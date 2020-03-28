package com.ujiuye.crmpro.indexvalue.controller;


import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.service.DatacollectService;
import com.ujiuye.crmpro.indexvalue.service.IndexvalueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/datacollect")
@Controller
public class DatacollectController {

    @Autowired
    private DatacollectService datacollectService;

    @Autowired
    private IndexvalueService indexvalueService;

    @ResponseBody
    @RequestMapping("/listjson")
    public String listJSON() {
        List<Datacollect> list = datacollectService.list(0, "");
        return JSON.toJSONString(list);
    }

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Datacollect> list = datacollectService.list(type, keyword);
        PageInfo<Datacollect> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-benchmarking";
    }

    @RequestMapping("/info")
    public String info(Model model, int daid, @ModelAttribute("pageNum") int pageNum) {
        Datacollect datacollect = datacollectService.getByDaid(daid);
        model.addAttribute("datacollect", datacollect);
        return "show-benchmarking";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Datacollect datacollect) {
        try {
            int result = datacollectService.save(datacollect);
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
    public String toUpdate(Model model, int daid, @ModelAttribute("pageNum") int pageNum) {
        Datacollect datacollect = datacollectService.getByDaid(daid);
        model.addAttribute("datacollect", datacollect);
        return "update-benchmarking";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Datacollect datacollect) {
        try {
            int result = datacollectService.update(datacollect);
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
    @RequestMapping("/del")
    public String del(Integer[] daids, Integer[] nums) {
        List<Integer> notDel = new ArrayList<>();
        List<Integer> del = new ArrayList<>();
        if (daids != null) {
            for (int i = 0; i < daids.length; i++) {
                if (indexvalueService.countByComnameFk(daids[i]) > 0) {
                    notDel.add(nums[i]);
                } else {
                    del.add(daids[i]);
                }
            }
        }
        if (del.size() == 0) {
            return JSON.toJSONString(notDel);
        }
        try {
            int result = datacollectService.remove(del);
            if (result > 0) {
                if (notDel.size() == 0) {
                    return "true";
                } else {
                    return JSON.toJSONString(notDel);
                }
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping("/getbydaidjson")
    @ResponseBody
    public String getByDaidJSON(int daid) {
        Datacollect datacollect = datacollectService.getByDaid(daid);
        return JSON.toJSONString(datacollect);
    }
}
