package com.ujiuye.crmpro.forum.controller;

import com.ujiuye.crmpro.forum.pojo.Forumsort;
import com.ujiuye.crmpro.forum.service.ForumsortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/forumsort")
public class ForumsortController {

    @Autowired
    private ForumsortService forumsortService;

    @RequestMapping("/list")
    public String list(Model model) {
        List<Forumsort> list = forumsortService.list();
        model.addAttribute("list", list);
        return "list-forum-main";
    }

    @ResponseBody
    @RequestMapping("/listjson")
    public List<Forumsort> listJSON() {
        List<Forumsort> list = forumsortService.list();
        return list;
    }

}
