package com.ujiuye.crmpro.employee.service.Impl;

import com.ujiuye.crmpro.employee.mapper.EmployeeMapper;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.pojo.EmployeeExample;
import com.ujiuye.crmpro.employee.pojo.Position;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import com.ujiuye.crmpro.employee.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private PositionService positionService;

    @Override
    public List<Employee> getByName(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEnameLike("%" + name + "%");
        return employeeMapper.selectByExample(example);
    }

    @Override
    public List<Employee> getByPfk(int pfk) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andPFkEqualTo(pfk);
        return employeeMapper.selectByExample(example);
    }

    @Override
    public int countByDfk(int dfk) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andDFkEqualTo(dfk);
        return employeeMapper.countByExample(example);
    }

    @Override
    public Employee login(Employee employee) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(employee.getUsername());
        criteria.andPasswordEqualTo(employee.getPassword());
        List<Employee> employees = employeeMapper.selectByExample(example);
        if (employees != null && employees.size() > 0) {
            return employees.get(0);
        }
        return null;
    }

    @Override
    public List<Employee> getByeqName(String name) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEnameEqualTo(name);
        return employeeMapper.selectByExample(example);
    }

    @Override
    public List<Employee> list(int type, String keyword) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andEnameLike("%" + keyword + "%");
        } else if (type == 2) {
            List<Integer> list = new ArrayList<>();
            list.add(0);
            List<Position> positions = positionService.getByName(keyword);
            if (list.size() > 0) {
                for (Position position : positions) {
                    list.add(position.getId());
                }
            }
            criteria.andPFkIn(list);
        }
        return employeeMapper.selectByExample(example);
    }
}
