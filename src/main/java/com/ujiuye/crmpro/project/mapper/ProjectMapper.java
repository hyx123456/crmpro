package com.ujiuye.crmpro.project.mapper;

import com.ujiuye.crmpro.project.pojo.Project;
import com.ujiuye.crmpro.project.pojo.ProjectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {
    int countByExample(ProjectExample example);

    int deleteByExample(ProjectExample example);

    int deleteByPrimaryKey(Integer pid);

    int insert(Project record);

    int insertSelective(Project record);

    List<Project> selectByExample(ProjectExample example);

    Project selectByPrimaryKey(Integer pid);

    int updateByExampleSelective(@Param("record") Project record, @Param("example") ProjectExample example);

    int updateByExample(@Param("record") Project record, @Param("example") ProjectExample example);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKey(Project record);
}