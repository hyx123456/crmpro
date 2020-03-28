package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.service.AnalysisService;
import com.ujiuye.crmpro.project.service.AttachmentService;
import com.ujiuye.crmpro.project.service.FunctionService;
import com.ujiuye.crmpro.project.service.ProjectService;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/project")
@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private AttachmentService attachmentService;

    @Autowired
    private FunctionService functionService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Project> list = projectService.list(type, keyword);
        PageInfo<Project> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-project";
    }

    @ResponseBody
    @RequestMapping("/add")
    public String add(Project project) {
        try {
            int result = projectService.save(project);
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
    @RequestMapping(value = "/remove", produces = "text/html;charset=utf-8")
    public String remove(Integer[] ids) {
        List<Integer> notDel = new ArrayList<>();
        List<Integer> del = new ArrayList<>();
        for (int i = 0; i < ids.length; i++) {
            int resultAnalysis = analysisService.countByPid(ids[i]);
            int resultAttachment = attachmentService.countByPid(ids[i]);
            int resultFunction = functionService.countByPid(ids[i]);
            if (resultAnalysis > 0 || resultAttachment > 0 || resultFunction > 0) {
                notDel.add(ids[i]);
            } else {
                del.add(ids[i]);
            }
        }
        if (del.size() == 0) {
            List<Project> projects = projectService.getByIds(notDel);
            String toString = "";
            for (Project project : projects) {
                toString += "【" + project.getName() + "】";
            }
            return toString;
        }
        try {
            int result = projectService.remove(del);
            if (result > 0) {
                if (notDel.size() > 0) {
                    List<Project> projects = projectService.getByIds(notDel);
                    String toString = "";
                    for (Project project : projects) {
                        toString += "【" + project.getName() + "【";
                    }
                    return toString;
                }
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/getById")
    public String getById(Model model, int id, @ModelAttribute("pageNum") int pageNum) {
        Project project = projectService.getById(id);
        model.addAttribute("project", project);

        return "show-project";
    }

    @RequestMapping("/toupdate")
    public String toUpdate(Model model, int id, @ModelAttribute("pageNum") int pageNum) {
        Project project = projectService.getById(id);
        model.addAttribute("project", project);
        return "update-project";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String upDate(Project project) {
        try {
            int result = projectService.update(project);
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

    //查出没有添加需求的项目
    @RequestMapping("/listjson")
    @ResponseBody
    public String listJSON() {
        List<Integer> ids = analysisService.getIds();
        List<Project> list = projectService.listByIds(ids);
        return JSON.toJSONString(list);
    }

    @RequestMapping("/getall")
    @ResponseBody
    public String getAll() {
        List<Project> list = projectService.list(0, "");
        return JSON.toJSONString(list);
    }
}
