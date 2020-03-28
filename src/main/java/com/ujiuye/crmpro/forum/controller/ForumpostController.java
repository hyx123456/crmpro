package com.ujiuye.crmpro.forum.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.service.EvaluateService;
import com.ujiuye.crmpro.forum.service.ForumpostService;
import com.ujiuye.crmpro.forum.service.ForumsortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@RequestMapping("/forumpost")
@Controller
public class ForumpostController {

    @Autowired
    private ForumpostService forumpostService;

    @Autowired
    private ForumsortService forumsortService;

    @Autowired
    private EvaluateService evaluateService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/list")
    public String list(Model model, int forumsort_fk,
                       @RequestParam(value = "view", required = false, defaultValue = "0") int view,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "6") int pageSize) {
        if (view == 1) {
            forumsortService.updateClick(forumsort_fk);
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Forumpost> list = forumpostService.list(forumsort_fk);
        PageInfo<Forumpost> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        return "list-forum";
    }

    @RequestMapping("/info")
    public String info(Model model, int id, HttpSession session) {
        Forumpost forumpost = forumpostService.getById(id);
        forumpost.setClick(forumpost.getClick() + 1);
        forumpostService.update(forumpost);
        model.addAttribute("forumpost", forumpost);
        List<Evaluate> evaluates = evaluateService.list(id);
        model.addAttribute("evaluates", evaluates);
        Employee login = (Employee) session.getAttribute("LOGIN");
        model.addAttribute("employee", login);
        return "show-forum";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Forumpost forumpost, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("LOGIN");
        forumpost.setEmpFk3(employee.getEid());
        forumpost.setCreatetime(new Date());
        forumpost.setCommentCount(0);
        forumpost.setClick(0);
        try {
            int result = forumpostService.save(forumpost);
            if (result > 0) {
                forumsortService.updateCount(forumpost.getForumsortFk());
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/listmy")
    public String listMyForum(Model model, HttpSession session,
                              @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                              @RequestParam(value = "pageSize", required = false, defaultValue = "6") int pageSize) {
        Employee login = (Employee) session.getAttribute("LOGIN");
        PageHelper.startPage(pageNum, pageSize);
        List<Forumpost> list = forumpostService.getByEmpfk(login.getEid());
        PageInfo<Forumpost> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        return "list-myforum";
    }
}
