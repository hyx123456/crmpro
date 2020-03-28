package com.ujiuye.crmpro.employee.service.Impl;

import com.ujiuye.crmpro.employee.mapper.PositionMapper;
import com.ujiuye.crmpro.employee.pojo.Position;
import com.ujiuye.crmpro.employee.pojo.PositionExample;
import com.ujiuye.crmpro.employee.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PositionServiceImpl implements PositionService {

    @Autowired
    private PositionMapper positionMapper;

    @Override
    public List<Position> getByName(String name) {
        PositionExample example = new PositionExample();
        PositionExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike("%" + name + "%");
        return positionMapper.selectByExample(example);
    }
}
