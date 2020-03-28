package com.ujiuye.crmpro.common.utils;

import com.ujiuye.crmpro.message.pojo.Email;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public class EmailUtils {

    public static void send(Email email) throws MessagingException {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.qq.com");//指定用来发送Email的邮件服务器主机名
        mailSender.setPort(25);//默认端口，标准的SMTP端口
        mailSender.setUsername("1023598901@qq.com");//用户名
        mailSender.setPassword("qkceflzzcfhcbaji");//密码/授权码


        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper helper;
        try {
            helper = new MimeMessageHelper(msg, true, "utf-8");
            helper.setFrom(mailSender.getUsername());
            helper.setTo(email.getReceiver());
            helper.setSubject(email.getTitle());
            //第二个参数true，表示text的内容为html，然后注意<img/>标签，src='cid:file'，'cid'是contentId的缩写，'file'是一个标记，需要在后面的代码中调用MimeMessageHelper的addInline方法替代成文件
            helper.setText(email.getContent(), true);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        mailSender.send(msg);
        System.out.println("邮件发送完毕");


    }
}
