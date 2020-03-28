package com.ujiuye.crmpro.indexvalue.service;

import com.ujiuye.crmpro.indexvalue.pojo.Indexvalue;

import java.util.List;

public interface IndexvalueService {

    int countByComnameFk(int comnameFk);

    List<Indexvalue> list(int type, String keyword);

    Indexvalue getByInid(int inid);

    int save(Indexvalue indexvalue);

    int update(Indexvalue indexvalue);

    int remove(List<Integer> inids);
}
