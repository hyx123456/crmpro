package com.ujiuye.crmpro.forum.service.impl;

import com.ujiuye.crmpro.forum.mapper.EvaluateMapper;
import com.ujiuye.crmpro.forum.pojo.Evaluate;
import com.ujiuye.crmpro.forum.pojo.EvaluateExample;
import com.ujiuye.crmpro.forum.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EvaluateServiceImpl implements EvaluateService {

    @Autowired
    private EvaluateMapper evaluateMapper;

    @Override
    public List<Evaluate> list(int forum_fk) {
        EvaluateExample example = new EvaluateExample();
        EvaluateExample.Criteria criteria = example.createCriteria();
        criteria.andForumFkEqualTo(forum_fk);
        return evaluateMapper.selectByExample(example);
    }

    @Override
    public int save(Evaluate evaluate) {
        return evaluateMapper.insert(evaluate);
    }

    @Override
    public int remove(int evaid) {
        return evaluateMapper.deleteByPrimaryKey(evaid);
    }
}
