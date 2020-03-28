package com.ujiuye.crmpro.indexvalue.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.indexvalue.pojo.Indexvalue;
import com.ujiuye.crmpro.indexvalue.service.IndexvalueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/indexvalue")
public class IndexvalueController {

    @Autowired
    private IndexvalueService indexvalueService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Indexvalue> list = indexvalueService.list(type, keyword);
        PageInfo<Indexvalue> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-indexvalue";
    }

    @RequestMapping("/info")
    public String info(Model model, int inid, @ModelAttribute("pageNum") int pageNum) {
        Indexvalue indexvalue = indexvalueService.getByInid(inid);
        model.addAttribute("indexvalue", indexvalue);
        return "show-indexvalue";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestParam("files") MultipartFile[] files, Indexvalue indexvalue, HttpSession session) {
        List<File> fileList = MyFileUtils.upload("E:/Project/crmpro/upload/", files);
        if (fileList != null) {
            indexvalue.setInFile(fileList.get(0).getName());
        }
        Employee employee = (Employee) session.getAttribute("LOGIN");
        indexvalue.setEmpFk5(employee.getEid());
        try {
            int result = indexvalueService.save(indexvalue);
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
    public String toUpdate(@ModelAttribute("pageNum") int pageNum, Model model, int inid) {
        Indexvalue indexvalue = indexvalueService.getByInid(inid);
        model.addAttribute("indexvalue", indexvalue);
        return "update-indexvalue";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(@RequestParam("files") MultipartFile[] files, Indexvalue indexvalue) {
        if (files.length > 0) {
            if (files[0].getSize() > 0) {
                List<File> fileList = MyFileUtils.upload("E:/Project/crmpro/upload/", files);
                if (fileList != null) {
                    indexvalue.setInFile(fileList.get(0).getName());
                }
            }
        }
        indexvalue.setInUpdatetime(new Date());
        try {
            int result = indexvalueService.update(indexvalue);
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

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(int inid) {
        Indexvalue indexvalue = indexvalueService.getByInid(inid);
        try {
            ResponseEntity<byte[]> entity = MyFileUtils.download(indexvalue.getInFile(), "E:/Project/crmpro/upload/");
            return entity;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/del")
    @ResponseBody
    public String del(Integer[] inids) {
        List<Integer> list = Arrays.asList(inids);
        int result = indexvalueService.remove(list);
        return String.valueOf(result);
    }
}
