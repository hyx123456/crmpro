package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Forumsort;

import java.util.List;

public interface ForumsortService {

    List<Forumsort> list();

    int updateClick(int id);

    int updateCount(int id);
}
