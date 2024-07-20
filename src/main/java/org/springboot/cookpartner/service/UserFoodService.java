package org.springboot.cookpartner.service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.springboot.cookpartner.entity.FoodLike;
import org.springboot.cookpartner.entity.Food;
import org.springboot.cookpartner.mapper.FoodLikeMapper;
import org.springboot.cookpartner.mapper.FoodMapper;

import org.springboot.cookpartner.mapper.FoodMapper;
import org.springboot.cookpartner.mapper.UserFoodMapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.date.DateUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class UserFoodService {
    @Resource
    private UserFoodMapper userFoodMapper;

    @Resource
    private FoodMapper foodMapper;

    private static final Logger logger = LoggerFactory.getLogger(FoodLikeService.class);

    public List<Map<String, Object>> findRecordByUser(String uid) {
        return userFoodMapper.findByUid(uid);
    }

    public int getRecordNumByUser(String uid) {
        return userFoodMapper.getRecordNumByUid(uid);
    }

    public Boolean isMade(String uid, int fid) {
        Map<String, Object> res = userFoodMapper.findByUidAndFid(uid, fid);
        if (res == null){
            return false;
        }
        return true;
    }

    //收藏
    public Boolean addRecord(String uid, int fid) {
        String ltime = DateUtil.now();

        try {
            // 添加收藏记录
            int result = userFoodMapper.AddRecord(uid,fid,ltime);

            // 更新食物的收藏数
            if (result != 0) {
                // 查询食物信息
                Map<String, Object> food = foodMapper.findFoodByFid(fid);
                if (food == null) {
                    logger.error("Food with fid {} not found", fid);
                    return false;
                }

                // 更新收藏数
                Long numRecordeLong = (Long) food.get("num_like");
                int numRecord = numRecordeLong.intValue();
                int updatedNumMake = numRecord + 1;
                boolean updateResult = foodMapper.updateNumMake(fid,updatedNumMake);
                return updateResult;
            } else {
                logger.error("Failed to add make record for food with fid {}", fid);
                return false;
            }
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while adding make record: {}", e.getMessage());
            return false;
        }
    }
}
