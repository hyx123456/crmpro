package com.ujiuye.crmpro.message.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.message.pojo.Msg;
import com.ujiuye.crmpro.message.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/msg")
public class MsgController {

    @Autowired
    private MsgService msgService;

    @RequestMapping("/list")
    public String list(Model model, HttpSession session,
                       @RequestParam(value = "who", required = false, defaultValue = "0") int who,
                       @RequestParam(value = "title", required = false, defaultValue = "") String title,
                       @RequestParam(value = "status", required = false, defaultValue = "0") int status,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Employee employee = (Employee) session.getAttribute("LOGIN");
        List<Msg> list = null;
        if (who == 0 && status != 3) {
            list = msgService.list(title, status, type, employee.getEid(), 0);
        } else if (who == 1) {
            list = msgService.list(title, status, type, 0, employee.getEid());
            model.addAttribute("who", who);
        } else if (status == 3) {
            list = msgService.list(title, status, type, 0, 0);
        }
        PageInfo<Msg> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("title", title);
        model.addAttribute("status", status);
        model.addAttribute("type", type);
        return "list-message";
    }

    @RequestMapping("/send")
    @ResponseBody
    public String send(Msg msg, @RequestParam("myfile") MultipartFile[] myfile, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("LOGIN");
        msg.setSend(employee.getEid());
        List<File> files = MyFileUtils.upload("E:/Project/crmpro/upload/", myfile);
        if (files != null && files.size() > 0) {
            msg.setPath(files.get(0).getName());
        }
        try {
            int result = msgService.save(msg);
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
    public String getById(Model model, int msgid) {
        Msg msg = msgService.getById(msgid);
        msg.setStatus(1);
        ArrayList<Integer> list = new ArrayList<>();
        list.add(msg.getMsgid());
        msgService.updateStatus(list, msg);
        model.addAttribute("msg", msg);
        return "show-message";
    }

    @RequestMapping("/updatestatus")
    @ResponseBody
    public String updateStatus(Integer[] msgids, Msg msg) {
        List<Integer> list = Arrays.asList(msgids);
        try {
            int result = msgService.updateStatus(list, msg);
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
}
