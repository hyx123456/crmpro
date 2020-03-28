package com.ujiuye.crmpro.indexvalue.mapper;

import com.ujiuye.crmpro.indexvalue.pojo.Indexvalue;
import com.ujiuye.crmpro.indexvalue.pojo.IndexvalueExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IndexvalueMapper {
    int countByExample(IndexvalueExample example);

    int deleteByExample(IndexvalueExample example);

    int deleteByPrimaryKey(Integer inId);

    int insert(Indexvalue record);

    int insertSelective(Indexvalue record);

    List<Indexvalue> selectByExample(IndexvalueExample example);

    Indexvalue selectByPrimaryKey(Integer inId);

    int updateByExampleSelective(@Param("record") Indexvalue record, @Param("example") IndexvalueExample example);

    int updateByExample(@Param("record") Indexvalue record, @Param("example") IndexvalueExample example);

    int updateByPrimaryKeySelective(Indexvalue record);

    int updateByPrimaryKey(Indexvalue record);
}