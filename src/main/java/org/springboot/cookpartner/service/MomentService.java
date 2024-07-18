package org.springboot.cookpartner.service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.springboot.cookpartner.entity.Moment;
import org.springboot.cookpartner.entity.Food;
import org.springboot.cookpartner.mapper.FoodLikeMapper;
import org.springboot.cookpartner.mapper.MomentMapper;
import org.springboot.cookpartner.mapper.FoodMapper;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.date.DateUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class MomentService {
    @Resource
    private MomentMapper momentMapper;

    @Resource
    private FoodMapper foodMapper;

    private static final Logger logger = LoggerFactory.getLogger(MomentService.class);

    public Boolean addMoment(String uid, int fid, String content) {
        String mtime = DateUtil.now();
        try {
            // 添加评论内容
            int result = momentMapper.AddMoment(uid,fid,content,mtime);
             return true;
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while adding moment: {}", e.getMessage());
            return false;
        }
    }

    public List<Map<String, Object>> findMomentByUser(String uid) {
        return momentMapper.findByUid(uid);
    }

    public Map<String, Object> findMomentByMid(int mid) {
        return momentMapper.findMomentByMid(mid);
    }

    public List<Map<String, Object>> findMomentByFid(int fid) {
        return momentMapper.findByFid(fid);
    }

    public Boolean deleteMoment(int mid) {
        try {
            // 添加评论内容
            return momentMapper.DeleteMoment(mid);
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while deleting moment: {}", e.getMessage());
            return false;
        }
    }



}
