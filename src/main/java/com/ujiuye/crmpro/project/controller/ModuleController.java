package com.ujiuye.crmpro.project.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Module;
import com.ujiuye.crmpro.project.service.FunctionService;
import com.ujiuye.crmpro.project.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/module")
@Controller
public class ModuleController {

    @Autowired
    private ModuleService moduleService;

    @Autowired
    private FunctionService functionService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Module> list = moduleService.list(type, keyword);
        PageInfo<Module> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-module";
    }

    @RequestMapping("/getbyid")
    public String getById(Model model, int id, @ModelAttribute("pageNum") int pageNum) {
        Module module = moduleService.getById(id);
        model.addAttribute("module", module);
        return "show-module";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Module module) {
        try {
            int result = moduleService.save(module);
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

    @RequestMapping("/toupdate")
    public String toUpdate(Model model, int id) {
        Module module = moduleService.getById(id);
        model.addAttribute("module", module);
        return "update-module";
    }

    @ResponseBody
    @RequestMapping("/update")
    public String update(Module module) {
        try {
            int result = moduleService.update(module);
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

    @RequestMapping("/remove")
    @ResponseBody
    public String remove(Integer[] ids, Integer[] nums) {
        List<Integer> notDel = new ArrayList<>();
        List<Integer> del = new ArrayList<>();
        if (ids != null && ids.length > 0) {
            for (int i = 0; i < ids.length; i++) {
                if (functionService.countByMid(ids[i]) > 0) {
                    notDel.add(nums[i]);
                } else {
                    del.add(ids[i]);
                }
            }
        }
        if (del.size() == 0) {
            return JSON.toJSONString(notDel);
        }
        try {
            int result = moduleService.remove(del);
            if (result > 0) {
                if (notDel.size() > 0) {
                    return JSON.toJSONString(notDel);
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


    @ResponseBody
    @RequestMapping("/checkbyid")
    public String checkById(int id) {
        List<Module> modules = moduleService.getByAnalysisFk(id);
        return JSON.toJSONString(modules);
    }
}
