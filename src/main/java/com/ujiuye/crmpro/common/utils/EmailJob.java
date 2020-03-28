package com.ujiuye.crmpro.common.utils;

import com.ujiuye.crmpro.message.pojo.Email;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import javax.mail.MessagingException;

public class EmailJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        Email email = (Email) jobExecutionContext.getJobDetail().getJobDataMap().get("email");
        try {
            EmailUtils.send(email);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
