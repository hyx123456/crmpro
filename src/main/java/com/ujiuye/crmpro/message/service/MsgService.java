package com.ujiuye.crmpro.message.service;

import com.ujiuye.crmpro.message.pojo.Msg;

import java.util.List;

public interface MsgService {

    List<Msg> list(String title, int status, int type, int receive, int send);

    int save(Msg msg);

    Msg getById(int id);

    int updateStatus(List<Integer> msgids, Msg msg);
}
