package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Analysis;

import java.util.List;

public interface AnalysisService {

    int countByPid(int pid);

    int save(Analysis analysis);

    List<Analysis> list(int type, String keyword);

    List<Integer> getIds();

    Analysis getById(int id);

    List<Analysis> getByName(String name);

    int update(Analysis analysis);

    int remove(List<Integer> ids);

    List<Analysis> listByName(String name);
}
