package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.supervise.pecr.util.ValidateConstant;
import com.dcits.supervise.pecr.validateData.mapper.ValidateParameterMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateParameter;
import com.dcits.supervise.pecr.validateData.model.ValidateParameterExample;
import com.dcits.supervise.pecr.validateData.service.AnalyticValidateParameterService;
import com.dcits.supervise.pecr.validateData.service.ValidateParameterService;

@Service("validateParameterService")
@Transactional
public class ValidateParameterServiceImpl implements ValidateParameterService {
	@Autowired
	private ValidateParameterMapper validateParameterMapper;
	@Resource(name = "analyticValidateParameterServiceImpl_string")
	private AnalyticValidateParameterService analyticValidateParameterService;

	@Override
	public Map<String, String> getValidateParameterList(List<String> parameterName) throws Exception {
		List<ValidateParameter> validateParameterList = (List<ValidateParameter>) validateParameterMapper
				.selectByCondition(parameterName);
		Map<String, String> validateParameterMap = new HashMap<String, String>(16);
		for (ValidateParameter x : validateParameterList) {
			validateParameterMap.put(x.getParameterName(), handleResult(x));
		}
		return validateParameterMap;
	}

	@Override
	public Map<String, String> getSystemDefParameterList() {
		ValidateParameterExample validateParameterExample = new ValidateParameterExample();
		ValidateParameterExample.Criteria criteria = validateParameterExample.createCriteria();
		criteria.andParameterTypeEqualTo(ValidateConstant.SYSTEMDEFPARAMETERTYPE);
		// List<ValidateParameter> validateParameterList =
		// (List<ValidateParameter>)this.validateParameterMapper.selectByExample((Object)validateParameterExample);
		Map<String, String> validateParameterMap = new HashMap<String, String>(16);
		// validateParameterList.stream().forEach(x ->
		// validateParameterMap.put(x.getParameterName(),
		// this.handleResult(x)));
		return validateParameterMap;
	}

	private String handleResult(ValidateParameter validateParameter) {
		return analyticValidateParameterService.analyticValidateParameter(validateParameter);
	}

}
