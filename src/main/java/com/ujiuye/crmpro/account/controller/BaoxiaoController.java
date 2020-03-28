package com.ujiuye.crmpro.account.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.account.pojo.Baoxiao;
import com.ujiuye.crmpro.account.service.BaoxiaoService;
import com.ujiuye.crmpro.common.utils.UUIDUtils;
import com.ujiuye.crmpro.employee.pojo.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/baoxiao")
@Controller
public class BaoxiaoController {

    @Autowired
    private BaoxiaoService baoxiaoService;

    @RequestMapping("/save")
    @ResponseBody
    public String save(Baoxiao baoxiao, HttpSession session) {
        Employee employee = (Employee) session.getAttribute("LOGIN");
        baoxiao.setEmpFk(employee.getEid());
        baoxiao.setBxid(UUIDUtils.getID());
        baoxiao.setBxstatus(1);
        try {
            int result = baoxiaoService.save(baoxiao);
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

    @RequestMapping("/list")
    public String list(Model model, HttpSession session,
                       @RequestParam(value = "status", required = false, defaultValue = "4") int status,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Baoxiao> list = null;
        if (status == 4) {
            Employee employee = (Employee) session.getAttribute("LOGIN");
            list = baoxiaoService.list(type, keyword, status, employee.getEid());
        } else {
            list = baoxiaoService.list(type, keyword, status, 0);
        }
        PageInfo<Baoxiao> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        if (status == 1) {
            return "list-approve";
        } else if (status == 2) {
            return "list-pay";
        } else if (status == 3) {
            return "list-payed";
        } else {
            return "list-myaccount";
        }
    }

    //查看
    @RequestMapping("/info")
    public String info(Model model, String bxid, @ModelAttribute("pageNum") int pageNum) {
        Baoxiao baoxiao = baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao", baoxiao);
        return "show-myaccount";
    }

    @RequestMapping("/toupdate")
    public String toUpdate(Model model, String bxid, @ModelAttribute("pageNum") int pageNum) {
        Baoxiao baoxiao = baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao", baoxiao);
        return "update-myaccount";
    }

    @ResponseBody
    @RequestMapping("/update")
    public String update(Baoxiao baoxiao) {
        try {
            int result = baoxiaoService.update(baoxiao);
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

    //撤销报销申请
    @ResponseBody
    @RequestMapping("/revocation")
    public String revocation(String bxid) {
        try {
            int result = baoxiaoService.remove(bxid);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "true";
        }
    }

    @RequestMapping("/toapprove")
    public String toApprove(Model model, String bxid, @ModelAttribute("pageNum") int pageNum) {
        Baoxiao baoxiao = baoxiaoService.getById(bxid);
        model.addAttribute("baoxiao", baoxiao);
        return "update-approve";
    }

}
