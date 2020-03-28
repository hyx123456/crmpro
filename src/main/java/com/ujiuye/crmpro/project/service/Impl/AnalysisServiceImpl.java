package com.ujiuye.crmpro.project.service.Impl;

import com.ujiuye.crmpro.project.mapper.AnalysisMapper;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.AnalysisExample;
import com.ujiuye.crmpro.project.service.AnalysisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnalysisServiceImpl implements AnalysisService {

    @Autowired
    private AnalysisMapper analysisMapper;

    @Override
    public int countByPid(int pid) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(pid);
        return analysisMapper.countByExample(example);
    }

    @Override
    public int save(Analysis analysis) {
        return analysisMapper.insert(analysis);
    }

    @Override
    public List<Analysis> list(int type, String keyword) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andTitleLike("%" + keyword + "%");
        } else if (type == 2) {
            criteria.andPronameLike("%" + keyword + "%");
        }
        return analysisMapper.selectByExample(example);
    }

    @Override
    public List<Integer> getIds() {
        List<Integer> ids = analysisMapper.getIds();
        return ids;
    }

    @Override
    public Analysis getById(int id) {
        return analysisMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Analysis> getByName(String name) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        criteria.andTitleLike("%" + name + "%");
        return analysisMapper.selectByExample(example);
    }

    @Override
    public int update(Analysis analysis) {
        return analysisMapper.updateByPrimaryKeySelective(analysis);
    }

    @Override
    public int remove(List<Integer> ids) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return analysisMapper.deleteByExample(example);
    }

    @Override
    public List<Analysis> listByName(String name) {
        AnalysisExample example = new AnalysisExample();
        AnalysisExample.Criteria criteria = example.createCriteria();
        criteria.andTitleLike("%" + name + "%");
        return analysisMapper.selectByExample(example);
    }


}
