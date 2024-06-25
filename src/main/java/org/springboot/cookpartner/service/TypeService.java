package org.springboot.cookpartner.service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springboot.cookpartner.entity.Food;
import org.springboot.cookpartner.entity.Type;
import org.springboot.cookpartner.mapper.FoodMapper;
import org.springboot.cookpartner.mapper.TypeMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import cn.hutool.core.util.StrUtil;

@Service
public class TypeService  extends ServiceImpl<TypeMapper, Type>{
    @Resource
    private TypeMapper typeMapper;
    public List<Map<String, Object>> findAllType() {
        return typeMapper.findAllType();
    }

    public Map<String, Object> findTypeBytid(int tid) {
        return typeMapper.findTypeByTid(tid);
    }

}
