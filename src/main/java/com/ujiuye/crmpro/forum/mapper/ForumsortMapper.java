package com.ujiuye.crmpro.forum.mapper;

import com.ujiuye.crmpro.forum.pojo.Forumsort;
import com.ujiuye.crmpro.forum.pojo.ForumsortExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ForumsortMapper {
    int countByExample(ForumsortExample example);

    int deleteByExample(ForumsortExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Forumsort record);

    int insertSelective(Forumsort record);

    List<Forumsort> selectByExample(ForumsortExample example);

    Forumsort selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Forumsort record, @Param("example") ForumsortExample example);

    int updateByExample(@Param("record") Forumsort record, @Param("example") ForumsortExample example);

    int updateByPrimaryKeySelective(Forumsort record);

    int updateByPrimaryKey(Forumsort record);
}