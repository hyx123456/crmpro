package com.ujiuye.crmpro.message.controller;

import com.ujiuye.crmpro.common.utils.EmailScheduler;
import com.ujiuye.crmpro.common.utils.EmailUtils;
import com.ujiuye.crmpro.employee.pojo.Archives;
import com.ujiuye.crmpro.employee.service.ArchivesService;
import com.ujiuye.crmpro.message.pojo.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("/email")
@Controller
public class EmailController {

    @Autowired
    private ArchivesService archivesService;

    @InitBinder
    public void initBind(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @ResponseBody
    @RequestMapping("/send")
    public String send(Email email) {
        Archives archives = archivesService.getByEmpfk(email.getEid());
        if (archives == null || archives.getEmail() == null) {
            return "noemail";
        }
        email.setReceiver(archives.getEmail());
        try {
            if (email.getIstime() != null && email.getIstime().equals("on")) {
                EmailScheduler.sendEmail(email);
            } else {
                EmailUtils.send(email);
            }
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
