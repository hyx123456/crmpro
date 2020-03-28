package com.ujiuye.crmpro.system.service.impl;

import com.ujiuye.crmpro.system.mapper.SourcesMapper;
import com.ujiuye.crmpro.system.pojo.Sources;
import com.ujiuye.crmpro.system.pojo.SourcesExample;
import com.ujiuye.crmpro.system.service.SourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SourcesServiceImpl implements SourcesService {

    @Autowired
    private SourcesMapper sourcesMapper;


    @Override
    @Cacheable(value = "listZtree", key = "'listZtree'")
    public List<Sources> listZtree() {
        SourcesExample example = new SourcesExample();
        SourcesExample.Criteria criteria = example.createCriteria();
        criteria.andPidEqualTo(0);
        List<Sources> sourcess = sourcesMapper.selectByExample(example);
        if (sourcess.size() > 0) {
            for (Sources sources : sourcess) {
                getChildren(sources);
            }
        }
        return sourcess;
    }

    @Override
    @Cacheable(value = "list", key = "'list'")
    public List<Sources> list() {
        return sourcesMapper.selectByExample(null);
    }

    private void getChildren(Sources sources) {
        SourcesExample example = new SourcesExample();
        SourcesExample.Criteria criteria = example.createCriteria();
        criteria.andPidEqualTo(sources.getId());
        List<Sources> sourcesChildren = sourcesMapper.selectByExample(example);
        if (sourcesChildren.size() > 0) {
            for (Sources sourcesChild : sourcesChildren) {
                getChildren(sourcesChild);
            }
            sources.setChildren(sourcesChildren);
        }
    }

    @Override
    @Cacheable(value = "getById", key = "'getById_'+#id")
    public Sources getById(int id) {
        return sourcesMapper.selectByPrimaryKey(id);
    }

    @Override
    @CacheEvict(value = {"list", "listZtree", "getById"}, allEntries = true)
    public int save(Sources sources) {
        return sourcesMapper.insert(sources);
    }


    @Override
    @CacheEvict(value = {"list", "listZtree", "getById"}, allEntries = true)
    public int update(Sources sources) {
        return sourcesMapper.updateByPrimaryKeySelective(sources);
    }


    @Override
    @CacheEvict(value = {"list", "listZtree", "getById"}, allEntries = true)
    public int remove(int id) {
        return sourcesMapper.deleteByPrimaryKey(id);
    }
}
