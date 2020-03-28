package com.ujiuye.crmpro.common.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MyFileUtils {

    public static List<File> upload(String path, MultipartFile[] files) {
        ArrayList<File> list = new ArrayList<>();
        if (path == null) {
            path = "E:/Project/springmvc/upload/";
        }
        if (files.length > 0) {
            for (MultipartFile multipartFile : files) {
                if (multipartFile.getSize() > 0) {
                    //获得上传的文件名
                    String filename = multipartFile.getOriginalFilename();
                    //随机生成6位数
                    String random = String.valueOf(Math.random()).substring(2, 8);
                    //设置一个按时间格式的8位数
                    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
                    String date = format.format(new Date());
                    //截取源文件的后缀名
                    String suffixName = filename.substring(filename.lastIndexOf("."));
                    //文件上传路径
                    String newPath = path + "file" + date + random + suffixName;
                    File file = new File(newPath);
                    try {
                        //使用工具类中的方法把上传的文件mfile内容写到文件file,其实就是io复制
                        multipartFile.transferTo(file);
                        list.add(file);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            System.out.println("没有上传文件");
        }
        return list;
    }

    public static ResponseEntity<byte[]> download(String filename, String path) throws IOException {
        if (path == null) {
            //下载的目录
            path = "E:/Project/springmvc/upload/";
        }
        //解决文件名乱码问题，用于下载时显示
        String newName = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
        //下载路径
        String downpath = path + filename;
        //文件对象
        File file = new File(downpath);
        HttpHeaders headers = new HttpHeaders();
        //下载文件的文件名字
        headers.setContentDispositionFormData("attchment", newName);
        // MIME:类型
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // springmvc 提供的下载文件的工具类，ResponseEntity：表示整个HTTP响应：状态代码，标题和正文。
        // 因此，我们可以使用它来完全配置HTTP响应，它是一个对象。
        ResponseEntity<byte[]> entity = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
        return entity;
    }
}
