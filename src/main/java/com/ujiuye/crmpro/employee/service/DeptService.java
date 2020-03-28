package com.ujiuye.crmpro.employee.service;

import com.ujiuye.crmpro.employee.pojo.Dept;

import java.util.List;

public interface DeptService {

    List<Dept> list(int type, String keyword);

    int save(Dept dept);

    Dept getByDeptno(int deptno);

    int update(Dept dept);

    int remove(List<Integer> deptnos);

}
