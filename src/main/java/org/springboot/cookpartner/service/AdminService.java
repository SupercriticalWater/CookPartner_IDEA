package org.springboot.cookpartner.service;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springboot.cookpartner.entity.Admin;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.mapper.*;
import org.springboot.cookpartner.utils.JsonMessageGetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.Collections;
import java.util.*;
import org.springboot.cookpartner.controller.message.Message;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
@Service
public class AdminService {
    @Resource
    private AdminMapper adminMapper;

    @Resource
    private RedisTemplate<Object, Object> redisTemplate;

}
