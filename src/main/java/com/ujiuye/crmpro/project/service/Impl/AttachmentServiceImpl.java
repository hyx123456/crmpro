package com.ujiuye.crmpro.project.service.Impl;

import com.ujiuye.crmpro.project.mapper.AttachmentMapper;
import com.ujiuye.crmpro.project.pojo.Attachment;
import com.ujiuye.crmpro.project.pojo.AttachmentExample;
import com.ujiuye.crmpro.project.service.AttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttachmentServiceImpl implements AttachmentService {

    @Autowired
    private AttachmentMapper attachmentMapper;

    @Override
    public int countByPid(int pid) {
        AttachmentExample example = new AttachmentExample();
        AttachmentExample.Criteria criteria = example.createCriteria();
        criteria.andProFkEqualTo(pid);
        return attachmentMapper.countByExample(example);
    }

    @Override
    public List<Attachment> list(int type, String fileName, String tag) {
        AttachmentExample example = new AttachmentExample();
        AttachmentExample.Criteria criteria = example.createCriteria();
        if (type != 0) {
            criteria.andTypeEqualTo(type);
        }
        if (fileName != null && !fileName.equals("")) {
            criteria.andAttnameLike("%" + fileName + "%");
        }
        if (tag != null && !tag.equals("")) {
            criteria.andTagLike("%" + tag + "%");
        }
        return attachmentMapper.selectByExample(example);
    }

    @Override
    public int save(Attachment attachment) {
        return attachmentMapper.insert(attachment);
    }

    @Override
    public Attachment getById(int id) {
        return attachmentMapper.selectByPrimaryKey(id);
    }
}
