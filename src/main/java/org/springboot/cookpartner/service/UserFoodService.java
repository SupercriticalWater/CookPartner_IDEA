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

import org.springboot.cookpartner.mapper.UserMapper;
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

    @Resource
    private UserMapper userMapper;

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
//    public Boolean addRecord(String uid, int fid) {
//        String ltime = DateUtil.now();
//
//        try {
//            // 添加收藏记录
//            int result = userFoodMapper.AddRecord(uid,fid,ltime);
//
//            // 更新食物的收藏数
//            if (result != 0) {
//                // 查询食物信息
//                Map<String, Object> food = foodMapper.findFoodByFid(fid);
//                if (food == null) {
//                    logger.error("Food with fid {} not found", fid);
//                    return false;
//                }
//
//                // 更新收藏数
//                Long numRecordeLong = (Long) food.get("num_like");
//                int numRecord = numRecordeLong.intValue();
//                int updatedNumMake = numRecord + 1;
//                boolean updateResult = foodMapper.updateNumMake(fid,updatedNumMake);
//                return updateResult;
//            } else {
//                logger.error("Failed to add make record for food with fid {}", fid);
//                return false;
//            }
//        } catch (DataAccessException e) {
//            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
//            logger.error("Database error while adding make record: {}", e.getMessage());
//            return false;
//        }
//    }
    public Boolean addRecord(String uid, int fid) {
        String ltime = DateUtil.now();

        try {
            // 添加制作记录
            int result = userFoodMapper.AddRecord(uid, fid, ltime);

            // 更新食物的制作数
            if (result != 0) {
                // 查询食物信息
                Map<String, Object> food = foodMapper.findFoodByFid(fid);
                if (food == null) {
                    logger.error("Food with fid {} not found", fid);
                    return false;
                }

                // 获取并更新制作数
                Long numRecordeLong = (Long) food.get("num_make");
                //System.out.print(numRecordeLong);
                int numRecord = numRecordeLong.intValue();
                int updatedNumMake = numRecord + 1;
                boolean updateResult = foodMapper.updateNumMake(fid, updatedNumMake);
                if (!updateResult) {
                    logger.error("Failed to update num_like for food with fid {}", fid);
                    return false;
                }

                // 查询用户信息
                Map<String, Object> user = userMapper.selectById(uid);
                //System.out.print(user);
                if (user == null) {
                    logger.error("User with uid {} not found", uid);
                    return false;
                }

                // 获取菜谱的积分 f_score
                int fScore = (int)food.get("f_score");
                //System.out.println(fScore);
//                if (fScore == null) {
//                    logger.error("f_score for food with fid {} not found", fid);
//                    return false;
//                }

                // 更新用户的积分和等级
                int currentScore = (int) user.get("u_score");
                //System.out.println(currentScore);
//                if (currentScore == null) {
//                    logger.error("Score for user with uid {} not found", uid);
//                    return false;
//                }

                int updatedScore = currentScore + fScore;
                //System.out.println(updatedScore);
                int newLevel = calculateUserLevel(updatedScore); // 假设有一个方法根据积分计算用户等级
                //System.out.println(newLevel);
                boolean updateUserResult = userMapper.updateScoreAndLevel(uid, updatedScore, newLevel);
                return updateUserResult;
            } else {
                logger.error("Failed to add make record for food with fid {}", fid);
                return false;
            }
        } catch (DataAccessException e) {
            // 处理数据库操作异常
            logger.error("Database error while adding make record: {}", e.getMessage());
            return false;
        }
    }

    private int calculateUserLevel(int score) {
        // 根据积分计算用户等级的逻辑
        if (score >= 500000) {
            return 10;
        } else if (score >= 150000) {
            return 9;
        } else if (score >= 90000) {
            return 8;
        } else if (score >= 40000) {
            return 7;
        } else if (score >= 20000) {
            return 6;
        } else if (score >= 6400) {
            return 5;
        } else if (score >= 1600) {
            return 4;
        } else if (score >= 400) {
            return 3;
        } else if (score >= 200) {
            return 2;
        } else if (score >= 50) {
            return 1;
        } else {
            return 0; // Assuming a default level for scores less than 50
        }
    }

}
