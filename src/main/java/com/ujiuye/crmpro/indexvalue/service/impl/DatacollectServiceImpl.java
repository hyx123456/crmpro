package com.ujiuye.crmpro.indexvalue.service.impl;

import com.ujiuye.crmpro.indexvalue.mapper.DatacollectMapper;
import com.ujiuye.crmpro.indexvalue.pojo.Datacollect;
import com.ujiuye.crmpro.indexvalue.pojo.DatacollectExample;
import com.ujiuye.crmpro.indexvalue.service.DatacollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class DatacollectServiceImpl implements DatacollectService {

    @Autowired
    private DatacollectMapper datacollectMapper;

    @Override
    public List<Datacollect> list(int type, String keyword) {
        DatacollectExample example = new DatacollectExample();
        DatacollectExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andDacnameLike("%" + keyword + "%");
        }
        return datacollectMapper.selectByExample(example);
    }

    @Override
    public Datacollect getByDaid(int daid) {
        return datacollectMapper.selectByPrimaryKey(daid);
    }

    @Override
    public int save(Datacollect datacollect) {
        return datacollectMapper.insert(datacollect);
    }

    @Override
    public int update(Datacollect datacollect) {
        return datacollectMapper.updateByPrimaryKeySelective(datacollect);
    }

    @Override
    public int remove(List<Integer> daids) {
        DatacollectExample example = new DatacollectExample();
        DatacollectExample.Criteria criteria = example.createCriteria();
        criteria.andDaidIn(daids);
        return datacollectMapper.deleteByExample(example);
    }

    @Override
    public List<Datacollect> getBydacname(String dacname) {
        DatacollectExample example = new DatacollectExample();
        DatacollectExample.Criteria criteria = example.createCriteria();
        criteria.andDacnameLike("%" + dacname + "%");
        return datacollectMapper.selectByExample(example);
    }

}
