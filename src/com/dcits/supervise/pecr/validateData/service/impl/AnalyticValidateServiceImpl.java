package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.util.EasyUtils;
import com.dcits.supervise.pecr.util.StrUtil;
import com.dcits.supervise.pecr.validateData.model.ValidateMapping;
import com.dcits.supervise.pecr.validateData.model.ValidateRules;
import com.dcits.supervise.pecr.validateData.model.ValidateTemplate;
import com.dcits.supervise.pecr.validateData.service.AnalyticValidateService;

@Service
public abstract class AnalyticValidateServiceImpl implements AnalyticValidateService
{
    @Override
    public String renderTemplate(final ValidateTemplate validateTemplate, final Map<String, String> parametersMap) throws Exception{
        String templateStr = validateTemplate.getTemplateTpl();
        if (null != parametersMap && !parametersMap.isEmpty()) {
            templateStr = EasyUtils.format((CharSequence)templateStr, parametersMap);
        }
        return templateStr;
    }
    
    @Override
    public String fieldMapping(final String templateStr, final List<ValidateMapping> validateMappingList) throws Exception{
        if (validateMappingList.size() > 0) {
            ConcurrentHashMap<String, String> map = new ConcurrentHashMap<String, String>(16);
            for (ValidateMapping x : validateMappingList) {
            	map.put(x.getTemplateMappingName(), "#" + x.getValidateParameterName() + "#");
			}
            return EasyUtils.format((CharSequence)templateStr, map);
        }
        return templateStr;
    }
    
    @Override
    public String renderErrorMessage(final ValidateTemplate validateTemplate, final Map<String, String> parametersMap, final ValidateRules validateRule)throws Exception {
        String msg = validateTemplate.getErrorMsg();
        if (null != parametersMap && !parametersMap.isEmpty()) {
            msg = EasyUtils.format((CharSequence)msg,parametersMap);
        }
        return msg;
    }
    
    @Override
    public String compileTemplate(final ValidateTemplate validateTemplate, final ValidateRules validateRule, final Map<String, String> parametersMap) throws Exception{
        return validateTemplate.getTemplateTpl();
    }
    
    @Override
    public String validateTemplate(String template, final boolean isMulti) throws Exception{
        if (template.contains("{") && template.contains("}") && template.contains("[") && template.contains("]")) {
            if (isMulti) {
                final int start = template.indexOf("{");
                final int end = template.indexOf("}") + 1;
                final String replaceStr = StrUtil.sub((CharSequence)template, start, end);
                template = StrUtil.replace((CharSequence)template, (CharSequence)replaceStr, (CharSequence)"");
                template = template.replace("[", "");
                template = template.replace("]", "");
            }
            else {
                template = template.replace("{", "");
                template = template.replace("}", "");
                final int start = template.indexOf("[");
                final int end = template.indexOf("]") + 1;
                final String replaceStr = StrUtil.sub((CharSequence)template, start, end);
                template = StrUtil.replace((CharSequence)template, (CharSequence)replaceStr, (CharSequence)"");
            }
        }
        return template;
    }
}
