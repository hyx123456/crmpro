package com.ujiuye.crmpro.message.pojo;

import java.io.Serializable;
import java.util.Date;

public class Email implements Serializable {

    private int eid;
    private String receiver;
    private String title;
    private String content;
    private String istime;
    private Date sendtime;

    public int getEid() {
        return eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIstime() {
        return istime;
    }

    public void setIstime(String istime) {
        this.istime = istime;
    }

    public Date getSendtime() {
        return sendtime;
    }

    public void setSendtime(Date sendtime) {
        this.sendtime = sendtime;
    }

    @Override
    public String toString() {
        return "Email{" +
                "eid=" + eid +
                ", receiver='" + receiver + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", istime='" + istime + '\'' +
                ", sendtime=" + sendtime +
                '}';
    }
}
