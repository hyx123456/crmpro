package com.ujiuye.crmpro.project.service;

import com.ujiuye.crmpro.project.pojo.Attachment;

import java.util.List;

public interface AttachmentService {

    int countByPid(int pid);

    List<Attachment> list(int type, String fileName, String tag);

    int save(Attachment attachment);

    Attachment getById(int id);
}
