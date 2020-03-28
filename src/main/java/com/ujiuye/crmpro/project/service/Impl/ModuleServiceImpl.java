package com.ujiuye.crmpro.project.service.Impl;

import com.ujiuye.crmpro.project.mapper.ModuleMapper;
import com.ujiuye.crmpro.project.pojo.Analysis;
import com.ujiuye.crmpro.project.pojo.Module;
import com.ujiuye.crmpro.project.pojo.ModuleExample;
import com.ujiuye.crmpro.project.service.AnalysisService;
import com.ujiuye.crmpro.project.service.ModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ModuleServiceImpl implements ModuleService {

    @Autowired
    private ModuleMapper moduleMapper;

    @Autowired
    private AnalysisService analysisService;

    @Override
    public List<Module> list(int type, String keyword) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        if (type == 1) {
            criteria.andModulenameLike("%" + keyword + "%");
        } else if (type == 2) {
            List<Analysis> analyses = analysisService.getByName(keyword);
            List<Integer> list = new ArrayList<>();
            list.add(0);
            if (analyses != null && analyses.size() > 0) {
                for (Analysis analysis : analyses) {
                    list.add(analysis.getId());
                }
            }
            criteria.andAnalysisFkIn(list);
        } else if (type == 3) {
            criteria.andProjectnameLike("%" + keyword + "%");
        }
        return moduleMapper.selectByExample(example);
    }

    @Override
    public Module getById(int id) {
        return moduleMapper.selectByPrimaryKey(id);
    }

    @Override
    public int save(Module module) {
        return moduleMapper.insert(module);
    }

    @Override
    public int update(Module module) {
        return moduleMapper.updateByPrimaryKeySelective(module);
    }

    @Override
    public int countById(int analysisFk) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andAnalysisFkEqualTo(analysisFk);
        return moduleMapper.countByExample(example);
    }

    @Override
    public int remove(List<Integer> ids) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        return moduleMapper.deleteByExample(example);
    }

    @Override
    public List<Module> ListByName(String name) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andModulenameLike("%" + name + "%");
        return moduleMapper.selectByExample(example);
    }

    @Override
    public List<Module> getByAnalysisFk(int analysisFk) {
        ModuleExample example = new ModuleExample();
        ModuleExample.Criteria criteria = example.createCriteria();
        criteria.andAnalysisFkEqualTo(analysisFk);
        return moduleMapper.selectByExample(example);
    }


}
