package com.ujiuye.crmpro.account.service;

import com.ujiuye.crmpro.account.pojo.Baoxiao;

import java.util.List;

public interface BaoxiaoService {

    int save(Baoxiao baoxiao);

    int remove(String bxid);

    int update(Baoxiao baoxiao);

    List<Baoxiao> list(int type, String keyword, int status, int empfk);

    Baoxiao getById(String bxid);
}
