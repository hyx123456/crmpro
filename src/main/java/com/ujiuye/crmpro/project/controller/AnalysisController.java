package com.ujiuye.crmpro.project.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.service.AnalysisService;
import com.ujiuye.crmpro.project.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private ModuleService moduleService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Analysis> list = analysisService.list(type, keyword);
        PageInfo<Analysis> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-analysis";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Analysis analysis) {
        try {
            analysis.setAddtime(new Date());
            int result = analysisService.save(analysis);
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

    @RequestMapping("/byid")
    public String getById(Model model, int id, @ModelAttribute("pageNum") int pageNum) {
        Analysis analysis = analysisService.getById(id);
        model.addAttribute("analysis", analysis);
        return "show-analysis";
    }

    @RequestMapping("/getbyid")
    @ResponseBody
    public String getById(int id) {
        Analysis analysis = analysisService.getById(id);
        return JSON.toJSONString(analysis);
    }

    @RequestMapping("toupdate")
    public String toUpdate(int id, Model model) {
        Analysis analysis = analysisService.getById(id);
        model.addAttribute("analysis", analysis);
        return "update-analysis";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Analysis analysis) {
        try {
            analysis.setUpdatetime(new Date());
            int result = analysisService.update(analysis);
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
                if (moduleService.countById(ids[i]) > 0) {
                    notDel.add(nums[i]);
                } else {
                    del.add(ids[i]);
                }
            }
        }

        if (del.size() == 0) {
            return notDel.toString();
        }
        try {
            int result = analysisService.remove(del);
            if (result > 0) {
                if (notDel.size() == 0) {
                    return "true";
                } else {
                    return notDel.toString();
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
