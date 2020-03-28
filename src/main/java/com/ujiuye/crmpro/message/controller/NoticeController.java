package com.ujiuye.crmpro.message.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.message.pojo.Notice;
import com.ujiuye.crmpro.message.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Date;
import java.util.List;


@RequestMapping("/notice")
@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> list = noticeService.list(keyword);
        PageInfo<Notice> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("keyword", keyword);
        return "list-notice";
    }

    @RequestMapping("/publish")
    @ResponseBody
    public String publish(Notice notice, @RequestParam("myfile") MultipartFile[] myfile) {
        List<File> files = MyFileUtils.upload("E:/Project/crmpro/upload/", myfile);
        if (files != null && files.size() > 0) {
            notice.setPath(files.get(0).getName());
        }
        notice.setDate(new Date());
        try {
            int result = noticeService.save(notice);
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

    @RequestMapping("/getbyid")
    public String getById(int id, Model model) {
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice", notice);
        return "show-notice";
    }
}
