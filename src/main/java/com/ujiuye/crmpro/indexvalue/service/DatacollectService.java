package com.ujiuye.crmpro.indexvalue.service;

import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;

import java.util.List;

public interface DatacollectService {

    List<Datacollect> list(int type, String keyword);

    Datacollect getByDaid(int daid);

    int save(Datacollect datacollect);

    int update(Datacollect datacollect);

    int remove(List<Integer> daids);

    List<Datacollect> getBydacname(String dacname);
}
