package com.ujiuye.crmpro.message.service.impl;

import com.ujiuye.crmpro.message.mapper.MsgMapper;
import com.ujiuye.crmpro.message.pojo.Msg;
import com.ujiuye.crmpro.message.pojo.MsgExample;
import com.ujiuye.crmpro.message.service.MsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MsgServiceImpl implements MsgService {

    @Autowired
    private MsgMapper msgMapper;

    @Override
    public List<Msg> list(String title, int status, int type, int receive, int send) {
        MsgExample example = new MsgExample();
        MsgExample.Criteria criteria = example.createCriteria();
        example.setOrderByClause("time desc");
        if (title != null && !title.equals("")) {
            criteria.andTitleLike("%" + title + "%");
        }
        if (type != 0) {
            criteria.andTypeEqualTo(type);
        }
        if (send == 0 && receive != 0) {
            criteria.andReceiveEqualTo(receive);
            if (status > 1) {
                criteria.andStatusEqualTo(status);
            } else {
                List<Integer> list = new ArrayList<>();
                list.add(0);
                list.add(1);
                list.add(3);
                criteria.andStatusIn(list);
            }
        }
        if (receive == 0 && send != 0) {
            criteria.andSendEqualTo(send);
        }
        if (receive == 0 && send == 0) {
            criteria.andStatusEqualTo(status);
        }
        return msgMapper.selectByExample(example);
    }

    @Override
    public int save(Msg msg) {
        return msgMapper.insertSelective(msg);
    }

    @Override
    public Msg getById(int msgid) {
        return msgMapper.selectByPrimaryKey(msgid);
    }

    @Override
    public int updateStatus(List<Integer> msgids, Msg msg) {
        MsgExample example = new MsgExample();
        MsgExample.Criteria criteria = example.createCriteria();
        criteria.andMsgidIn(msgids);
        return msgMapper.updateByExampleSelective(msg, example);
    }
}
