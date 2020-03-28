package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Evaluate;

import java.util.List;

public interface EvaluateService {

    List<Evaluate> list(int forum_fk);

    int save(Evaluate evaluate);

    int remove(int evaid);
}
