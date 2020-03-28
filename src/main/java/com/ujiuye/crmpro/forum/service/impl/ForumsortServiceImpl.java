package com.ujiuye.crmpro.forum.service.impl;

import com.ujiuye.crmpro.forum.mapper.ForumsortMapper;
import com.ujiuye.crmpro.forum.pojo.Forumsort;
import com.ujiuye.crmpro.forum.pojo.ForumsortExample;
import com.ujiuye.crmpro.forum.service.ForumsortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumsortServiceImpl implements ForumsortService {

    @Autowired
    private ForumsortMapper forumsortMapper;

    @Override
    public List<Forumsort> list() {
        ForumsortExample example = new ForumsortExample();
        example.setOrderByClause("type asc");
        return forumsortMapper.selectByExample(example);
    }

    @Override
    public int updateClick(int id) {
        Forumsort forumsort = forumsortMapper.selectByPrimaryKey(id);
        forumsort.setClick(forumsort.getClick() + 1);
        return forumsortMapper.updateByPrimaryKeySelective(forumsort);
    }

    @Override
    public int updateCount(int id) {
        Forumsort forumsort = forumsortMapper.selectByPrimaryKey(id);
        forumsort.setCount(forumsort.getCount() + 1);
        return forumsortMapper.updateByPrimaryKeySelective(forumsort);
    }
}
