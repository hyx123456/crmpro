package com.ujiuye.crmpro.forum.service;

import com.ujiuye.crmpro.forum.pojo.Forumpost;

import java.util.List;

public interface ForumpostService {

    List<Forumpost> list(Integer forumsort_fk);

    Forumpost getById(int id);

    int update(Forumpost forumpost);

    int save(Forumpost forumpost);

    List<Forumpost> getByEmpfk(int empFk);
}
