package com.ujiuye.crmpro.project.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.FileTypeUtils;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.project.pojo.Attachment;
import com.ujiuye.crmpro.project.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@RequestMapping("/attachment")
@Controller
public class AttachmentController {

    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "fileName", required = false, defaultValue = "") String fileName,
                       @RequestParam(value = "tag", required = false, defaultValue = "") String tag,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "12") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Attachment> list = attachmentService.list(type, fileName, tag);
        PageInfo<Attachment> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("fileName", fileName);
        model.addAttribute("tag", tag);
        return "list-attachment";
    }

    @RequestMapping("/upload")
    @ResponseBody
    public String upload(@RequestParam("files") MultipartFile[] files, Attachment attachment) {

        List<File> listFile = MyFileUtils.upload("E:/Project/crmpro/upload/", files);
        if (listFile == null && listFile.size() == 0) {
            return "nofile";
        }
        attachment.setAddtime(new Date());
        String fileName = listFile.get(0).getName();
        attachment.setPath(fileName);
        int type = FileTypeUtils.getType(fileName);
        attachment.setType(type);
        try {
            int result = attachmentService.save(attachment);
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
    public String getById(Model model, int id) {
        Attachment attachment = attachmentService.getById(id);
        model.addAttribute("attachment", attachment);
        return "show-attachment";
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(String fileName) {
        try {
            ResponseEntity<byte[]> entity = MyFileUtils.download(fileName, "E:/Project/crmpro/upload/");
            return entity;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
