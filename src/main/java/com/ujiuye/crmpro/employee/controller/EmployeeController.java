package com.ujiuye.crmpro.employee.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.pojo.Position;
import com.ujiuye.crmpro.employee.pojo.Role;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/employee")
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/getByPfk")
    @ResponseBody
    public String getByPfk(int pfk) {
        List<Employee> list = employeeService.getByPfk(pfk);
        return JSON.toJSONString(list);
    }

    @ResponseBody
    @RequestMapping("/login")
    public String login(Employee employee, HttpSession session, String code) {
        String sysCode = (String) session.getAttribute("CODE");
        if (!code.equalsIgnoreCase(sysCode)) {
            return "error";
        }
        Employee login = employeeService.login(employee);
        if (login == null) {
            return "false";
        }
        session.setAttribute("LOGIN", login);
        return "true";
    }

    @ResponseBody
    @RequestMapping("/getjson")
    public String getJSON() {
        List<Employee> employees = employeeService.getByName("");
        return JSON.toJSONString(employees);
    }

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> list = employeeService.list(type, keyword);
        PageInfo<Employee> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-employee";
    }

}
