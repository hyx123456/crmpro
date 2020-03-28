package com.ujiuye.crmpro.employee.service;

import com.ujiuye.crmpro.employee.pojo.Archives;

import java.util.List;

public interface ArchivesService {

    Archives getByEmpfk(int eid);

    int saveByList(List<Archives> list);

    List<Archives> list(int type, String keyword);

    Archives getByNo(String no);

    int save(Archives archives);

    int update(Archives archives);

    int remove(List<String> nos);
}
