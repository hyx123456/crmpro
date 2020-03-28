package com.ujiuye.crmpro.account.service.impl;

import com.ujiuye.crmpro.account.mapper.BaoxiaoMapper;
import com.ujiuye.crmpro.account.pojo.Baoxiao;
import com.ujiuye.crmpro.account.pojo.BaoxiaoExample;
import com.ujiuye.crmpro.account.service.BaoxiaoService;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BaoxiaoServiceImpl implements BaoxiaoService {

    @Autowired
    private BaoxiaoMapper baoxiaoMapper;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public int save(Baoxiao baoxiao) {
        return baoxiaoMapper.insertSelective(baoxiao);
    }

    @Override
    public int remove(String bxid) {
        return baoxiaoMapper.deleteByPrimaryKey(bxid);
    }

    @Override
    public int update(Baoxiao baoxiao) {
        return baoxiaoMapper.updateByPrimaryKeySelective(baoxiao);
    }

    @Override
    public List<Baoxiao> list(int type, String keyword, int status, int empfk) {
        BaoxiaoExample example = new BaoxiaoExample();
        BaoxiaoExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andBxidEqualTo(keyword);
        } else if (type == 2) {
            List<Employee> employees = employeeService.getByName(keyword);
            List<Integer> empfks = new ArrayList<>();
            empfks.add(0);
            if (employees != null) {
                for (Employee emp : employees) {
                    empfks.add(emp.getEid());
                }
            }
            criteria.andEmpFkIn(empfks);
        }
        if (status < 4) {
            criteria.andBxstatusEqualTo(status);
        }
        if (empfk != 0) {
            criteria.andEmpFkEqualTo(empfk);
        }
        return baoxiaoMapper.selectByExample(example);
    }

    @Override
    public Baoxiao getById(String bxid) {
        return baoxiaoMapper.selectByPrimaryKey(bxid);
    }

}
