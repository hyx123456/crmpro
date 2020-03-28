package com.ujiuye.crmpro.common.controller;

import com.ujiuye.crmpro.common.utils.VerificationCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/code")
public class CodeController {

    @RequestMapping("/logincode.jpg")
    public void createCode(HttpServletRequest request, HttpServletResponse response) {
        VerificationCode.getVerificationCode(request, response);
    }
}
