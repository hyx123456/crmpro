package com.ujiuye.crmpro.task.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.task.pojo.Task;
import com.ujiuye.crmpro.task.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/task")
public class TaskController {

    @Autowired
    private TaskService taskService;

    @ResponseBody
    @RequestMapping("/add")
    public String add(Task task, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("LOGIN");
        task.setEmpFk(employee.getEid());
        task.setStatus(0);
        try {
            int result = taskService.save(task);
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

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Task> list = taskService.list(type, keyword, 0);
        PageInfo<Task> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-task";
    }

    @RequestMapping("/mylist")
    public String myList(Model model, HttpSession session,
                         @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                         @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                         @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                         @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Employee employee = (Employee) session.getAttribute("LOGIN");
        List<Task> list = taskService.list(type, keyword, employee.getEid());
        PageInfo<Task> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-mytask";
    }

    @RequestMapping("/updatemytaskstatus")
    @ResponseBody
    public String updateMyTaskStatus(Task task) {
        try {
            int result = taskService.updateMyTaskStatus(task);
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

    @RequestMapping("/info")
    public String info(Model model, int id, @ModelAttribute("pageNum") int pageNum, @ModelAttribute("flag") int flag) {
        Task task = taskService.getById(id);
        model.addAttribute("task", task);
        return "show-task";
    }

    @RequestMapping("/toupdate")
    public String toUpdate(Model model, int id) {
        Task task = taskService.getById(id);
        model.addAttribute("task", task);
        return "update-task";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Task task) {
        try {
            int result = taskService.update(task);
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

    @RequestMapping("/del")
    @ResponseBody
    public String remove(Integer[] ids) {
        List<Integer> list = Arrays.asList(ids);
        try {
            int result = taskService.remove(list);
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
