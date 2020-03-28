package com.ujiuye.crmpro.forum.controller;

import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.service.EvaluateService;
import com.ujiuye.crmpro.forum.service.ForumpostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@RequestMapping("/evaluate")
@Controller
public class EvaluateController {

    @Autowired
    private EvaluateService evaluateService;

    @Autowired
    private ForumpostService forumpostService;

    @RequestMapping("/add")
    @ResponseBody
    public String save(HttpSession session, Evaluate evaluate) {
        Employee employee = (Employee) session.getAttribute("LOGIN");
        evaluate.setEmpFk4(employee.getEid());
        evaluate.setEvatime(new Date());
        try {
            int result = evaluateService.save(evaluate);
            if (result > 0) {
                Forumpost forumpost = forumpostService.getById(evaluate.getForumFk());
                forumpost.setCommentCount(forumpost.getCommentCount() + 1);
                forumpostService.update(forumpost);
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
    public String del(int evaid, int forumid) {
        evaluateService.remove(evaid);
        return "redirect:/forumpost/info?id=" + forumid;


    }
}