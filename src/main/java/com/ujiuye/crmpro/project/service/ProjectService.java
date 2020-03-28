package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Project;

import java.util.List;

public interface ProjectService {

    List<Project> list(int type, String keyword);

    int save(Project project);

    int remove(List<Integer> ids);

    List<Project> getByIds(List<Integer> ids);

    Project getById(int id);

    int update(Project project);

    List<Project> listByIds(List<Integer> ids);

    List<Project> listByName(String name);
}
