package com.ujiuye.crmpro.employee.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.employee.pojo.Dept;
import com.ujiuye.crmpro.employee.service.DeptService;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/dept")
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Dept> list = deptService.list(type, keyword);
        if (list.size() == 0) {
            PageHelper.startPage(pageNum - 1, pageSize);
            list = deptService.list(type, keyword);
        }
        PageInfo<Dept> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-dept";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Dept dept) {
        try {
            int result = deptService.save(dept);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping("/toupdate")
    public String toUpdate(int deptno) {
        Dept dept = deptService.getByDeptno(deptno);
        return JSON.toJSONString(dept);
    }

    @ResponseBody
    @RequestMapping("/update")
    public String update(Dept dept) {
        try {
            int result = deptService.update(dept);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping("/remove")
    public String remove(Integer[] deptnos) {
        List<Integer> notDel = new ArrayList<>();
        List<Integer> del = new ArrayList<>();
        if (deptnos != null && deptnos.length > 0) {
            for (Integer deptno : deptnos) {
                if (employeeService.countByDfk(deptno) > 0) {
                    notDel.add(deptno);
                } else {
                    del.add(deptno);
                }
            }
        }
        if (del.size() == 0) {
            return notDel.toString();
        }
        try {
            int result = deptService.remove(del);
            if (result > 0) {
                if (notDel.size() > 0) {
                    return notDel.toString();
                } else {
                    return "true";
                }
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
