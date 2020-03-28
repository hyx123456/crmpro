package com.ujiuye.crmpro.employee.service;

import com.ujiuye.crmpro.employee.pojo.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> getByName(String name);

    List<Employee> getByPfk(int pfk);

    int countByDfk(int dfk);

    Employee login(Employee employee);

    List<Employee> getByeqName(String name);

    List<Employee> list(int type, String keyword);
}
