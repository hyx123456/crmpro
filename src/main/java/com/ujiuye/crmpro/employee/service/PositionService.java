package com.ujiuye.crmpro.employee.service;

import com.ujiuye.crmpro.employee.pojo.Position;

import java.util.List;

public interface PositionService {

    List<Position> getByName(String name);
}
