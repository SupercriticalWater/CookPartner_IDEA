package org.springboot.cookpartner.service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import org.springboot.cookpartner.entity.Food;
import org.springboot.cookpartner.mapper.FoodMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class FoodService extends ServiceImpl<FoodMapper, Food>{
    @Resource
    private FoodMapper foodMapper;

    public List<Map<String, Object>> findAllFoods() {
        return foodMapper.findAllFoods();
    }

    public Map<String, Object> findFoodByFid(int fid) {
        return foodMapper.findFoodByFid(fid);
    }

    public List<Map<String, Object>> findAllFoods_Like() {
        return foodMapper.findAllFoods_Like();
    }

    public List<Map<String, Object>> findAllFoods_Make() {
        return foodMapper.findAllFoods_make();
    }

    public List<Map<String, Object>> findAllFoods_Time() {
        return foodMapper.findAllFoods_time();
    }

    public List<Map<String, Object>> findFrontFoods() {
        return foodMapper.findFrontFoods();
    }

    public List<Map<String, Object>> findFoodByType(int tid) {
        return foodMapper.findFoodByType(tid);
    }





}
