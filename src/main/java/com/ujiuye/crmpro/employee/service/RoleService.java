package com.ujiuye.crmpro.employee.service;

import com.ujiuye.crmpro.employee.pojo.Role;

import java.util.List;

public interface RoleService {

    List<Role> list(int key, String kewword);

    Role getById(int roleId);

    int update(Role role);

    int remove(List<Integer> roleIds);

    int save(Role role);
}
