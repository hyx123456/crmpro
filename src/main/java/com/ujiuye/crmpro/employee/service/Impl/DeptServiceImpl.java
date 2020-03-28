package com.ujiuye.crmpro.employee.service.Impl;

import com.ujiuye.crmpro.employee.mapper.DeptMapper;
import com.ujiuye.crmpro.employee.pojo.Dept;
import com.ujiuye.crmpro.employee.pojo.DeptExample;
import com.ujiuye.crmpro.employee.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> list(int type, String keyword) {
        DeptExample example = new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andDnameLike("%" + keyword + "%");
        } else if (type == 2) {
            criteria.andDlocationLike("%" + keyword + "%");
        }
        return deptMapper.selectByExample(example);
    }

    @Override
    public int save(Dept dept) {
        return deptMapper.insert(dept);
    }

    @Override
    public Dept getByDeptno(int deptno) {
        return deptMapper.selectByPrimaryKey(deptno);
    }

    @Override
    public int update(Dept dept) {
        return deptMapper.updateByPrimaryKey(dept);
    }

    @Override
    public int remove(List<Integer> deptnos) {
        DeptExample example = new DeptExample();
        DeptExample.Criteria criteria = example.createCriteria();
        criteria.andDeptnoIn(deptnos);
        return deptMapper.deleteByExample(example);
    }
}
