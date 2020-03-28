package com.ujiuye.crmpro.message.service;

import com.ujiuye.crmpro.message.pojo.Notice;

import java.util.List;

public interface NoticeService {

    List<Notice> list(String keyword);

    int save(Notice notice);

    Notice getById(int id);
}
