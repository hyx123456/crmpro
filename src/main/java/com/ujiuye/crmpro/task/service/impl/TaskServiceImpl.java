package com.ujiuye.crmpro.task.service.impl;

import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import com.ujiuye.crmpro.task.mapper.TaskMapper;
import com.ujiuye.crmpro.task.pojo.Task;
import com.ujiuye.crmpro.task.pojo.TaskExample;
import com.ujiuye.crmpro.task.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskMapper taskMapper;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public int countByFunFk(int funFk) {
        TaskExample example = new TaskExample();
        TaskExample.Criteria criteria = example.createCriteria();
        criteria.andFunFkEqualTo(funFk);
        return taskMapper.countByExample(example);
    }

    @Override
    public int save(Task task) {
        return taskMapper.insert(task);
    }

    @Override
    public List<Task> list(int type, String keyword, int empFk) {
        TaskExample example = new TaskExample();
        TaskExample.Criteria criteria = example.createCriteria();
        List<Integer> list = new ArrayList<>();
        list.add(0);
        if (empFk > 0) {
            criteria.andEmpFk2EqualTo(empFk);
        }
        if (type == 1) {
            criteria.andTasktitleLike("%" + keyword + "%");
        } else if (type == 2) {
            List<Employee> employees = employeeService.getByName(keyword);
            if (employees != null && employees.size() > 0) {
                for (Employee employee : employees) {
                    list.add(employee.getEid());
                }
            }
            criteria.andEmpFk2In(list);
        } else if (type == 3) {
            List<Employee> employees = employeeService.getByName(keyword);
            if (employees != null && employees.size() > 0) {
                for (Employee employee : employees) {
                    list.add(employee.getEid());
                }
            }
            criteria.andEmpFkIn(list);
        }
        return taskMapper.selectByExample(example);
    }

    @Override
    public int updateMyTaskStatus(Task task) {
        return taskMapper.updateByPrimaryKeySelective(task);
    }

    @Override
    public Task getById(int id) {
        return taskMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Task task) {
        return taskMapper.updateByPrimaryKeySelective(task);
    }

    @Override
    public int remove(List<Integer> dis) {
        TaskExample example = new TaskExample();
        TaskExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(dis);
        return taskMapper.deleteByExample(example);
    }
}
