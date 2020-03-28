package com.ujiuye.crmpro.indexvalue.service.impl;

import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import com.ujiuye.crmpro.indexvalue.mapper.IndexvalueMapper;
import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.pojo.Indexvalue;
import com.ujiuye.crmpro.indexvalue.pojo.IndexvalueExample;
import com.ujiuye.crmpro.indexvalue.service.DatacollectService;
import com.ujiuye.crmpro.indexvalue.service.IndexvalueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class IndexvalueServiceImpl implements IndexvalueService {

    @Autowired
    private IndexvalueMapper indexvalueMapper;

    @Autowired
    private DatacollectService datacollectService;

    @Autowired
    private EmployeeService employeeService;

    @Override
    public int countByComnameFk(int comnameFk) {
        IndexvalueExample example = new IndexvalueExample();
        IndexvalueExample.Criteria criteria = example.createCriteria();
        criteria.andComnameFkEqualTo(comnameFk);
        return indexvalueMapper.countByExample(example);
    }

    @Override
    public List<Indexvalue> list(int type, String keyword) {
        IndexvalueExample example = new IndexvalueExample();
        IndexvalueExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            List<Datacollect> datacollects = datacollectService.getBydacname(keyword);
            List<Integer> comnameFks = new ArrayList<>();
            comnameFks.add(0);
            if (datacollects != null && datacollects.size() > 0) {
                for (Datacollect datacollect : datacollects) {
                    comnameFks.add(datacollect.getDaid());
                }
            }
            criteria.andComnameFkIn(comnameFks);
        } else if (type == 2) {
            List<Employee> employees = employeeService.getByName(keyword);
            List<Integer> empFks = new ArrayList<>();
            empFks.add(0);
            if (employees != null && employees.size() > 0) {
                for (Employee employee : employees) {
                    empFks.add(employee.getEid());
                }
            }
            criteria.andEmpFk5In(empFks);
        }
        return indexvalueMapper.selectByExample(example);
    }

    @Override
    public Indexvalue getByInid(int inid) {
        return indexvalueMapper.selectByPrimaryKey(inid);
    }

    @Override
    public int save(Indexvalue indexvalue) {
        return indexvalueMapper.insert(indexvalue);
    }

    @Override
    public int update(Indexvalue indexvalue) {
        return indexvalueMapper.updateByPrimaryKeySelective(indexvalue);
    }

    @Override
    public int remove(List<Integer> inids) {
        IndexvalueExample example = new IndexvalueExample();
        IndexvalueExample.Criteria criteria = example.createCriteria();
        criteria.andInIdIn(inids);
        return indexvalueMapper.deleteByExample(example);
    }


}
