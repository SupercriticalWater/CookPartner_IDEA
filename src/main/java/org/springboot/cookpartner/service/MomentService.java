package org.springboot.cookpartner.service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springboot.cookpartner.dao.UserRepository;
import org.springboot.cookpartner.entity.Moment;
import org.springboot.cookpartner.mapper.MomentMapper;
import org.springboot.cookpartner.mapper.FoodMapper;

import org.springboot.cookpartner.utils.momentRating.MomentRating;
import org.springframework.dao.DataAccessException;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.date.DateUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class MomentService extends ServiceImpl<MomentMapper, Moment> {
    @Resource
    private MomentMapper momentMapper;

    @Resource
    private FoodMapper foodMapper;

    @Resource
    private UserRepository userRepository;
    private static final Logger logger = LoggerFactory.getLogger(MomentService.class);

    public Boolean addMoment(String uid, int fid, String content) {
        String mtime = DateUtil.now();
        try {
            // 添加评论内容
            float mrecommendation = Float.parseFloat(MomentRating.rating(content));
            int result = momentMapper.AddMoment(uid,fid,content, mrecommendation, mtime);
            if (mrecommendation == 1.0){
                userRepository.updateUserRecommendFood(uid, Integer.toString(fid));
            }
            return true;
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while adding moment: {}", e.getMessage());
            return false;
        }
    }

    public boolean updateRelationUser2Food(String u_id, String f_id, boolean recommend) {
        try {
            if (recommend)
                userRepository.updateUserRecommendFood(u_id, f_id);
//            else
//                userRepository.updateUserUnlikeCourse(u_id, c_no);
            return true;
        }catch (DataAccessException e){
            logger.error("Database error while adding moment: {}", e.getMessage());
            return false;
        }
    }


    public int getNumByUser(String uid) {
        return momentMapper.getMomentNumByUid(uid);
    }

    public int getNumByFood(int fid) {
        return momentMapper.getMomentNumByFid(fid);
    }
    public Boolean LikeMoment(int mid) {
        return momentMapper.addLikeNum(mid);
    }

    public Boolean ViewMoment(int mid) {
        return momentMapper.addBrowseNum(mid);
    }

    public List<Map<String, Object>> findMomentByUser(String uid) {
        return momentMapper.findByUid(uid);
    }

    public List<Map<String, Object>> findMomentByUserLike(String uid) {
        return momentMapper.findByUserLike(uid);
    }

    public List<Map<String, Object>> findAllMoment() {
        return momentMapper.findAll();
    }

    public Map<String, Object> findMomentByMid(int mid) {

        return momentMapper.findMomentByMid(mid);
    }

    public List<Map<String, Object>> findMomentByFid(int fid) {
        return momentMapper.findByFid(fid);
    }

    public Boolean deleteMoment(int mid) {
        try {
            // 删除评论内容
            Map<String, Object> res =  momentMapper.findMomentByMid(mid);
            if((Float)res.get("m_recommendation")== 1.0) {
                userRepository.deleteUserRecommendFood((String) res.get("u_id"), (String) res.get("f_id"));
            }
            momentMapper.DeleteMoment(mid);
            return  true;
        } catch (DataAccessException e) {
            // 处理数据库操作异常，可能是触发器引发的唯一性约束冲突
            logger.error("Database error while deleting moment: {}", e.getMessage());
            return false;
        }
    }

    //评论-模糊查询
    public List<Map<String, Object>> SerchMoment(String searchText) {
        LambdaQueryWrapper<Moment> query = Wrappers.<Moment>lambdaQuery().orderByDesc(Moment::getM_id);
        if (StrUtil.isNotBlank(searchText)) {
            query.like(Moment::getM_content, searchText);
        }

        return listMaps(query);
    }



}
