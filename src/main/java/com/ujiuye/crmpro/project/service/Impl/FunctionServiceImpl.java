package com.ujiuye.crmpro.project.service.Impl;

import com.ujiuye.crmpro.project.mapper.FunctionMapper;
import com.ujiuye.crmpro.project.pojo.*;
import com.ujiuye.crmpro.project.service.AnalysisService;
import com.ujiuye.crmpro.project.service.FunctionService;
import com.ujiuye.crmpro.project.service.ModuleService;
import com.ujiuye.crmpro.project.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class FunctionServiceImpl implements FunctionService {

    @Autowired
    private FunctionMapper functionMapper;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private AnalysisService analysisService;

    @Autowired
    private ModuleService moduleService;

    @Override
    public int countByPid(int pid) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andProFkEqualTo(pid);
        return functionMapper.countByExample(example);
    }

    @Override
    public int countByMid(int mid) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andModuleFkEqualTo(mid);
        return functionMapper.countByExample(example);
    }

    @Override
    public List<Function> list(int type, String keyword) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        List<Integer> list = new ArrayList<>();
        list.add(0);
        if (type == 1) {
            criteria.andFunctionnameLike("%" + keyword + "%");
        } else if (type == 2) {
            List<Module> modules = moduleService.ListByName(keyword);
            if (modules != null && modules.size() > 0) {
                for (Module module : modules) {
                    list.add(module.getId());
                }
            }
            criteria.andModuleFkIn(list);
        } else if (type == 3) {
            List<Analysis> analysiss = analysisService.listByName(keyword);
            if (analysiss != null && analysiss.size() > 0) {
                for (Analysis analysis : analysiss) {
                    list.add(analysis.getId());
                }
            }
            criteria.andAnalysisFkIn(list);
        } else if (type == 4) {
            List<Project> projects = projectService.listByName(keyword);
            if (projects != null && projects.size() > 0) {
                for (Project project : projects) {
                    list.add(project.getPid());
                }
            }
            criteria.andProFkIn(list);
        }
        return functionMapper.selectByExample(example);
    }

    @Override
    public int save(Function function) {
        function.setAddtime(new Date());
        return functionMapper.insert(function);
    }

    @Override
    public Function getById(int id) {
        return functionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(Function function) {
        function.setUpdatetime(new Date());
        return functionMapper.updateByPrimaryKeySelective(function);
    }

    @Override
    public int remove(List<Integer> id) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(id);
        return functionMapper.deleteByExample(example);
    }

    @Override
    public List<Function> listByModuleFk(int moduleFk) {
        FunctionExample example = new FunctionExample();
        FunctionExample.Criteria criteria = example.createCriteria();
        criteria.andModuleFkEqualTo(moduleFk);
        return functionMapper.selectByExample(example);
    }


}
