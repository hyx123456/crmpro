package com.ujiuye.crmpro.forum.service.impl;

import com.ujiuye.crmpro.forum.mapper.ForumpostMapper;
import com.ujiuye.crmpro.forum.pojo.Forumpost;
import com.ujiuye.crmpro.forum.pojo.ForumpostExample;
import com.ujiuye.crmpro.forum.service.ForumpostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumpostServiceImpl implements ForumpostService {

    @Autowired
    private ForumpostMapper forumpostMapper;

    @Override
    public List<Forumpost> list(Integer forumsort_fk) {
        ForumpostExample example = new ForumpostExample();
        ForumpostExample.Criteria criteria = example.createCriteria();
        criteria.andForumsortFkEqualTo(forumsort_fk);
        return forumpostMapper.selectByExample(example);
    }

    @Override
    public Forumpost getById(int id) {
        return forumpostMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Forumpost forumpost) {
        return forumpostMapper.updateByPrimaryKeySelective(forumpost);
    }

    @Override
    public int save(Forumpost forumpost) {
        return forumpostMapper.insert(forumpost);
    }

    @Override
    public List<Forumpost> getByEmpfk(int empFk) {
        ForumpostExample example = new ForumpostExample();
        ForumpostExample.Criteria criteria = example.createCriteria();
        criteria.andEmpFk3EqualTo(empFk);
        return forumpostMapper.selectByExample(example);
    }
}
