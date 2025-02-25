package com.dcits.supervise.pecr.validateData.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dcits.supervise.pecr.validateData.mapper.ValidateMappingMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateMapping;
import com.dcits.supervise.pecr.validateData.service.ValidateMappingService;

@Service
public class ValidateMappingServiceImpl implements ValidateMappingService {
	@Autowired
	private ValidateMappingMapper validateMappingMapper;

	public List<ValidateMapping> getValidateMappingList(String validateRulesId) throws Exception {
		Map<String, Object> conditonMap = new HashMap<>();
		conditonMap.put("VALIDATE_RULES_ID", validateRulesId);
		// conditonMap.put("SEQ", "SEQ");
		conditonMap.put("SEQ", "");
		return (List<ValidateMapping>) validateMappingMapper.selectByCondition(conditonMap);
	}

	public void deleteValidateMapping(ValidateMapping validateMapping) throws Exception {
	}
}