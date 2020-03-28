package com.ujiuye.crmpro.employee.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ujiuye.crmpro.common.utils.MyFileUtils;
import com.ujiuye.crmpro.common.utils.UUIDUtils;
import com.ujiuye.crmpro.employee.pojo.Archives;
import com.ujiuye.crmpro.employee.pojo.Employee;
import com.ujiuye.crmpro.employee.service.ArchivesService;
import com.ujiuye.crmpro.employee.service.EmployeeService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@RequestMapping("/archives")
@Controller
public class ArchivesController {

    @Autowired
    private ArchivesService archivesService;

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping(value = "/collect", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String collectArchives(@RequestParam("myfiles") MultipartFile[] myfiles) {
        List<String> names = new ArrayList<>();
        List<File> fileList = MyFileUtils.upload("E:/Project/crmpro/upload/", myfiles);
        if (fileList == null || fileList.size() == 0) {
            return "nofile";
        }
        File file = fileList.get(0);
        try {
            List<Archives> archivess = excelToList(file, names);
            if (archivess == null || archivess.size() == 0) {
                return "false";
            }
            int result = archivesService.saveByList(archivess);
            if (result > 0) {
                if (names.size() > 0) {
                    return names.toString();
                } else {
                    return "true";
                }
            } else {
                return "false";
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "false";
        }

    }

    private List<Archives> excelToList(File File, List<String> names) throws IOException {
        List<Archives> archivess = new ArrayList<>();
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(File));
        XSSFSheet sheetAt = workbook.getSheetAt(0);
        int numberOfRows = sheetAt.getPhysicalNumberOfRows();
        for (int i = 1; i < numberOfRows; i++) {
            Row row = sheetAt.getRow(i);
            String name = row.getCell(0).getStringCellValue();
            List<Employee> employees = employeeService.getByeqName(name);
            if (employees == null || employees.size() == 0) {
                names.add(name);
                continue;
            }
            Employee employee = employees.get(0);
            String telephone = row.getCell(1).getStringCellValue();
            String school = row.getCell(2).getStringCellValue();
            String major = row.getCell(3).getStringCellValue();
            String contact = row.getCell(4).getStringCellValue();
            Date graduate = row.getCell(5).getDateCellValue();
            String politics = row.getCell(6).getStringCellValue();
            String nation = row.getCell(7).getStringCellValue();
            String education = row.getCell(8).getStringCellValue();
            String email = row.getCell(9).getStringCellValue();
            String remark = row.getCell(10).getStringCellValue();
            Archives archives = new Archives(UUIDUtils.getID(), telephone, school, major, contact, graduate, politics,
                    nation, education, email, employee.getEid(), remark, employee.getHiredate());
            archivess.add(archives);
        }
        return archivess;
    }

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "type", required = false, defaultValue = "0") int type,
                       @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                       @RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Archives> list = archivesService.list(type, keyword);
        PageInfo<Archives> page = new PageInfo<>(list);
        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        return "list-archives";
    }

    @RequestMapping("/info")
    public String info(Model model, String no, @ModelAttribute("pageNum") int pageNum) {
        Archives archives = archivesService.getByNo(no);
        model.addAttribute("archives", archives);
        return "show-archives";
    }

    @ResponseBody
    @RequestMapping("/add")
    public String add(Archives archives, String ename) {
        List<Employee> employeeList = employeeService.getByeqName(ename);
        if (employeeList == null || employeeList.size() == 0) {
            return "notEmp";
        }
        Employee employee = employeeList.get(0);
        archives.setEmpFk(employee.getEid());
        archives.setNo(UUIDUtils.getID());
        try {
            int result = archivesService.save(archives);
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

    @RequestMapping("/update")
    @ResponseBody
    public String update(Archives archives) {
        try {
            int result = archivesService.update(archives);
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
    public String toUpdate(Model model, String no, @ModelAttribute("pageNum") int pageNum) {
        Archives archives = archivesService.getByNo(no);
        model.addAttribute("archives", archives);
        return "update-archives";
    }

    @RequestMapping("/del")
    @ResponseBody
    public String del(String[] nos) {
        List<String> list = Arrays.asList(nos);
        try {
            int result = archivesService.remove(list);
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