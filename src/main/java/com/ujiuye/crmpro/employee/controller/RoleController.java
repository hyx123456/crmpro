package com.ujiuye.crmpro.employee.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.employee.pojo.Role;
import com.ujiuye.crmpro.employee.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Role> list = roleService.list(type, keyword);
        PageInfo<Role> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-role";
    }

    @RequestMapping("/toupdate")
    @ResponseBody
    public String toUpdate(int roleid) {
        Role role = roleService.getById(roleid);
        return JSON.toJSONString(role);
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Role role) {
        try {
            int result = roleService.update(role);
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

    @RequestMapping("/add")
    @ResponseBody
    public String add(Role role) {
        try {
            int result = roleService.save(role);
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
}
