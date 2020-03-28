package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Module;

import java.util.List;

public interface ModuleService {

    List<Module> list(int type, String keyword);

    Module getById(int id);

    int save(Module module);

    int update(Module module);

    int countById(int analysisFk);

    int remove(List<Integer> ids);

    List<Module> ListByName(String name);

    List<Module> getByAnalysisFk(int analysisFk);

}
