package com.ujiuye.crmpro.customer.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.customer.pojo.Customer;
import com.ujiuye.crmpro.customer.service.CustomerService;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/customer")
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "5") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Customer> list = customerService.list(type, keyword);
        PageInfo<Customer> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-customer";
    }

    @ResponseBody
    @RequestMapping("/listjson")
    public String listJSON() {
        List<Customer> customers = customerService.list(0, null);
        return JSON.toJSONString(customers);
    }

    @RequestMapping("/info")
    public String info(Model model, int id, int pageNum) {
        Customer customer = customerService.getById(id);
        model.addAttribute("customer", customer);
        model.addAttribute("pageNum", pageNum);
        return "show-customer";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Customer customer) {
        try {
            customerService.save(customer);
            return "true";
        } catch (Exception e) {
            return "false";
        }
    }

    @RequestMapping("/toupdate")
    public String toUpdate(Model model, int id, int pageNum) {
        Customer customer = customerService.getById(id);
        model.addAttribute("customer", customer);
        model.addAttribute("pageNum", pageNum);
        return "update-customer";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Customer customer) {
        try {
            int result = customerService.update(customer);
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
    @RequestMapping("/remove")
    public String remove(Integer[] ids) {
        try {
            List<Integer> list = Arrays.asList(ids);
            int result = customerService.remove(list);
            if (result > 0) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            return "false";
        }
    }

    @RequestMapping("/exportExcel")
    public ResponseEntity<byte[]> exportExcel() {
        List<Customer> list = customerService.list(0, "");
        File file = getExcel(list);
        try {
            ResponseEntity<byte[]> entity = MyFileUtils.download(file.getName(), "E:/Project/crmpro/upload/");
            return entity;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public File getExcel(List<Customer> list) {
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet sheet = workbook.createSheet("客户信息");
        XSSFRow rowHreader = sheet.createRow(0);
        rowHreader.createCell(0).setCellValue("id");
        rowHreader.createCell(1).setCellValue("公司名称");
        rowHreader.createCell(2).setCellValue("公司联系人");
        rowHreader.createCell(3).setCellValue("联系电话");
        rowHreader.createCell(4).setCellValue("座机");
        rowHreader.createCell(5).setCellValue("公司地址");
        rowHreader.createCell(6).setCellValue("公司简介");
        rowHreader.createCell(7).setCellValue("备注");
        for (int i = 0; i < list.size(); i++) {
            Customer customer = list.get(i);
            XSSFRow row = sheet.createRow(i + 1);
            row.createCell(0).setCellValue(customer.getId());
            row.createCell(1).setCellValue(customer.getComname());
            row.createCell(2).setCellValue(customer.getCompanyperson());
            row.createCell(3).setCellValue(customer.getComphone());
            row.createCell(4).setCellValue(customer.getCamera());
            row.createCell(5).setCellValue(customer.getAddtime());
            row.createCell(6).setCellValue(customer.getPresent());
            row.createCell(7).setCellValue(customer.getRemark());
        }
        File file = new File("E:/Project/crmpro/upload/客户信息数据.xlsx");
        try {
            workbook.write(new FileOutputStream(file));
            return file;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
