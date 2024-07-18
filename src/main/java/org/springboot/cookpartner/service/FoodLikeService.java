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
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.date.DateUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class FoodLikeService {
    @Resource
    private FoodLikeMapper foodLikeMapper;

    @Resource
    private FoodMapper foodMapper;
    private static final Logger logger = LoggerFactory.getLogger(FoodLikeService.class);

    public List<Map<String, Object>> findLikeByUser(String uid) {
        return foodLikeMapper.findLikeByUid(uid);
    }
    public Boolean isLike(String uid, int fid) {
        Map<String, Object> res = foodLikeMapper.findLikeByUidAndFid(uid,fid);
        if (res == null){
            return false;
        }
        return true;
    }
    public int getRecordNumByUser(String uid) {
        return foodLikeMapper.getLikeNumByUid(uid);
    }
    //收藏
    public Boolean addLike(String uid, int fid) {
        String ltime = DateUtil.now();

        try {
            // 添加收藏记录
            int result = foodLikeMapper.AddLike(uid, fid, ltime);

            // 更新食物的收藏数
            if (result != 0) {
                // 查询食物信息
                Map<String, Object> food = foodMapper.findFoodByFid(fid);
                if (food == null) {
                    logger.error("Food with fid {} not found", fid);
                    return false;
                }

                // 更新收藏数
                Long numLikeLong = (Long) food.get("num_like");
                int numLike = numLikeLong.intValue();
                int updatedNumLike = numLike + 1;
                boolean updateResult = foodMapper.updateNumLike(fid, updatedNumLike);
                return updateResult;
            } else {
                logger.error("Failed to add like for food with fid {}", fid);
                return false;
            }
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while adding like: {}", e.getMessage());
            return false;
        }
    }

    //取消收藏
    public Boolean DeleteLike(String uid, int fid) {

        try {
            // 添加收藏记录
           // int result = foodLikeMapper.AddLike(uid, fid, ltime);
            Map<String, Object> foodlike = foodLikeMapper.findLikeByUidAndFid(uid,fid);
            // 更新食物的收藏数
            if (foodlike != null) {
                // 查询食物信息
                Boolean result = foodLikeMapper.DeleteLike(uid,fid);
                return result;

                // 更新收藏数
                // Long numLikeLong = (Long) food.get("num_like");
                // int numLike = numLikeLong.intValue();
                // int updatedNumLike = numLike + 1;
               // boolean updateResult = foodMapper.updateNumLike(fid, updatedNumLike);
               // return updateResult;
            } else {
                logger.error("Failed to foodlike record ");
                return false;
            }
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while Deleting like: {}", e.getMessage());
            return false;
        }
    }


}
