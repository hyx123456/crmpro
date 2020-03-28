package com.ujiuye.crmpro.task.service;

import com.ujiuye.crmpro.task.pojo.Task;

import java.util.List;

public interface TaskService {

    int countByFunFk(int funFk);

    int save(Task task);

    List<Task> list(int type, String keyword, int empFk);

    int updateMyTaskStatus(Task task);

    Task getById(int id);

    int update(Task task);

    int remove(List<Integer> dis);
}
