package com.ujiuye.crmpro.employee.service.Impl;

import com.ujiuye.crmpro.employee.mapper.RoleMapper;
import com.ujiuye.crmpro.employee.pojo.Role;
import com.ujiuye.crmpro.employee.pojo.RoleExample;
import com.ujiuye.crmpro.employee.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> list(int type, String keyword) {
        RoleExample example = new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andRolenameLike("%" + keyword + "%");
        }
        return roleMapper.selectByExample(example);
    }

    @Override
    public Role getById(int roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    @Override
    public int update(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public int remove(List<Integer> roleIds) {
        RoleExample example = new RoleExample();
        RoleExample.Criteria criteria = example.createCriteria();
        criteria.andRoleidIn(roleIds);
        return roleMapper.deleteByExample(example);
    }

    @Override
    public int save(Role role) {
        return roleMapper.insert(role);
    }
}
