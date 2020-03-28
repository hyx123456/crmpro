package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Function;

import java.util.List;

public interface FunctionService {

    int countByPid(int pid);

    int countByMid(int mid);

    List<Function> list(int type, String keyword);

    int save(Function function);

    Function getById(int id);

    int update(Function function);

    int remove(List<Integer> id);

    List<Function> listByModuleFk(int moduleFk);
}
