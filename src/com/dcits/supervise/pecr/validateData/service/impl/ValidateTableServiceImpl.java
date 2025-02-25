package com.dcits.supervise.pecr.validateData.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dcits.supervise.pecr.validateData.mapper.ValidateTableMapper;
import com.dcits.supervise.pecr.validateData.model.ValidateField;
import com.dcits.supervise.pecr.validateData.model.ValidateTable;
import com.dcits.supervise.pecr.validateData.service.ValidateFieldService;
import com.dcits.supervise.pecr.validateData.service.ValidateTableService;
import com.dcits.supervise.pecr.validateData.vo.ValidateTableVo;

@Service
@Transactional
public class ValidateTableServiceImpl implements ValidateTableService
{
    @Autowired
    private ValidateFieldService validateFieldService;
    @Autowired
    private ValidateTableMapper validateTableMapper;
    
    
    public ValidateTable selectValidateTable( ValidateTable validateTable) throws Exception {
        return (ValidateTable)validateTableMapper.selectOneByCondition(validateTable);
    }
    
    public List<ValidateTable> selectValidateTableList() throws Exception{
        return (List<ValidateTable>)validateTableMapper.selectByCondition();
    }
    
    public List<ValidateTableVo> selectAllTableAndField() throws Exception{
         List<ValidateTable> validateTableList = this.selectValidateTableList();
         List<ValidateTableVo> validateTableVoList = new ArrayList<ValidateTableVo>();
        for ( ValidateTable validateTable : validateTableList) {
             ValidateTableVo validateTableVo = new ValidateTableVo();
            BeanUtils.copyProperties((Object)validateTable, (Object)validateTableVo);
             ValidateField validateField = new ValidateField();
            validateField.setTableId(validateTable.getTableId());
            validateTableVo.setValidateFieldList(this.validateFieldService.selectValidateFieldList(validateField));
            validateTableVoList.add(validateTableVo);
        }
        return validateTableVoList;
    }
}
