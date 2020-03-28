package com.ujiuye.crmpro.system.controller;

import com.ujiuye.crmpro.system.pojo.Sources;
import com.ujiuye.crmpro.system.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/sources")
public class SourcesController {

    @Autowired
    private SourcesService sourcesService;

    @RequestMapping("/listztree")
    @ResponseBody
    public List listZtree() {
        List<Sources> list = sourcesService.listZtree();
        return list;
    }

    @RequestMapping("/list")
    @ResponseBody
    public List list() {
        List<Sources> list = sourcesService.list();
        return list;
    }

    @RequestMapping("/info")
    @ResponseBody
    public Sources info(int id) {
        Sources sources = sourcesService.getById(id);
        return sources;
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Sources sources) {
        try {
            sourcesService.save(sources);
            return "true";
        } catch (Exception e) {
            return "false";
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Sources sources) {
        try {
            int result = sourcesService.update(sources);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            return "false";
        }
    }

    @ResponseBody
    @RequestMapping("/del")
    public String del(int id) {
        try {
            int result = sourcesService.remove(id);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            return "false";
        }
    }
}
