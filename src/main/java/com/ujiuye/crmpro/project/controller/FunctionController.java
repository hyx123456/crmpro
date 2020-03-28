package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Function;
import com.ujiuye.crmpro.project.service.FunctionService;
import com.ujiuye.crmpro.task.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/function")
@Controller
public class FunctionController {

    @Autowired
    private FunctionService functionService;

    @Autowired
    private TaskService taskService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Function> list = functionService.list(type, keyword);
        PageInfo<Function> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-function";
    }

    @RequestMapping("/info")
    public String info(Model model, @ModelAttribute("pageNum") int pageNum, int id) {
        Function function = functionService.getById(id);
        model.addAttribute("function", function);
        return "show-function";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Function function) {
        try {
            int result = functionService.save(function);
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
    public String toUpdate(Model model, @ModelAttribute("pageNum") int pageNum, int id) {
        Function function = functionService.getById(id);
        model.addAttribute("function", function);
        return "update-function";
    }

    @ResponseBody
    @RequestMapping("/update")
    public String update(Function function) {
        try {
            int result = functionService.update(function);
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
    public String remove(Integer[] ids, Integer[] nums) {
        List<Integer> notDel = new ArrayList<>();
        List<Integer> del = new ArrayList<>();
        if (ids != null && ids.length > 0) {
            for (int i = 0; i < ids.length; i++) {
                if (taskService.countByFunFk(ids[i]) > 0) {
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
            int result = functionService.remove(del);
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
    @RequestMapping("/listbymodulefk")
    public String listByModuleFk(int moduleFk) {
        List<Function> functions = functionService.listByModuleFk(moduleFk);
        return JSON.toJSONString(functions);
    }
}
