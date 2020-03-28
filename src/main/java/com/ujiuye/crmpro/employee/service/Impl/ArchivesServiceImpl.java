package com.ujiuye.crmpro.employee.service.Impl;

import com.ujiuye.crmpro.employee.mapper.ArchivesMapper;
import com.ujiuye.crmpro.employee.pojo.Archives;
import com.ujiuye.crmpro.employee.pojo.ArchivesExample;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.ArchivesService;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArchivesServiceImpl implements ArchivesService {

    @Autowired
    private ArchivesMapper archivesMapper;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public Archives getByEmpfk(int eid) {
        ArchivesExample example = new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFkEqualTo(eid);
        List<Archives> archivess = archivesMapper.selectByExample(example);
        if (archivess != null && archivess.size() > 0) {
            return archivess.get(0);
        }
        return null;
    }

    @Override
    public int saveByList(List<Archives> list) {
        return archivesMapper.saveByList(list);
    }

    @Override
    public List<Archives> list(int type, String keyword) {
        ArchivesExample example = new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            List<Integer> empfks = new ArrayList<>();
            List<Employee> employees = employeeService.getByName(keyword);
            for (Employee employee : employees) {
                empfks.add(employee.getEid());
            }
            criteria.andEmpFkIn(empfks);
        }
        return archivesMapper.selectByExample(example);
    }

    @Override
    public Archives getByNo(String no) {
        return archivesMapper.selectByPrimaryKey(no);
    }

    @Override
    public int save(Archives archives) {
        return archivesMapper.insert(archives);
    }

    @Override
    public int update(Archives archives) {
        return archivesMapper.updateByPrimaryKeySelective(archives);
    }

    @Override
    public int remove(List<String> nos) {
        ArchivesExample example = new ArchivesExample();
        ArchivesExample.Criteria criteria = example.createCriteria();
        criteria.andNoIn(nos);
        return archivesMapper.deleteByExample(example);
    }
}
