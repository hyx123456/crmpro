package com.ujiuye.crmpro.common.utils;

import com.ujiuye.crmpro.message.pojo.Email;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;


public class EmailScheduler {

    public static void sendEmail(Email email) throws SchedulerException {
        //jobDetail
        JobDetail jobDetail = JobBuilder.newJob(EmailJob.class).withIdentity("emailJob").build();

        //向任务器中动态传参
        jobDetail.getJobDataMap().put("email", email);

        //Scheduler实例
        StdSchedulerFactory stdSchedulerFactory = new StdSchedulerFactory();
        Scheduler scheduler = stdSchedulerFactory.getScheduler();
        scheduler.start();


        SimpleTrigger simpleTrigger = TriggerBuilder.newTrigger()
                .withIdentity("trigger3", "group1")
                .startAt(email.getSendtime())//设定发送时间
                .withSchedule(
                        SimpleScheduleBuilder.simpleSchedule()
                                .withIntervalInSeconds(3)
                                .withRepeatCount(0))//重复执行的次数，因为加入任务的时候马上执行了，所以不需要重复，否则会多一次。
                .build();
        scheduler.scheduleJob(jobDetail, simpleTrigger);

    }
}
