package org.springboot.cookpartner.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import org.springboot.cookpartner.dao.FoodRepository;
import org.springboot.cookpartner.dao.UserRepository;
import org.springboot.cookpartner.entity.User;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.entity.UserAvatar;
import org.springboot.cookpartner.mapper.*;
import org.springboot.cookpartner.node.Neo4jFood;
import org.springboot.cookpartner.utils.JsonMessageGetter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import java.util.Collections;
import java.util.*;
import org.springboot.cookpartner.controller.message.Message;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;

@Service
public class UserService extends ServiceImpl<UserMapper, User>{
    @Autowired
    UserMapper userMapper;

    @Autowired
    FoodLikeMapper foodLikeMapper;

    @Autowired
    MomentMapper momentMapper;

    @Autowired
    UserFoodMapper userFoodMapper;

    @Autowired
    FoodMapper foodMapper;

    @Autowired
    FoodRepository foodRepository;

    @Autowired
    UserRepository userRepository;

    public String getOpenid(String temporaryId) {
        RestTemplate template = new RestTemplate();
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid=wxcb2253685dc8181e&secret=70520b2c51d10d623de0e6b81011e981&js_code={code}&grant_type=authorization_code";

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("code", temporaryId);

        String result = template.getForObject(url, String.class, paramMap);
        if (result != null && result.length() > 0) {
            result = result.substring(0, result.length() - 1);
        }
        assert result != null;
        result = result.replaceAll(",\"session_key\":\"[^\"]*\"|\"session_key\":\"[^\"]*\",", "");
        Map<String, Object> objectMap = JsonMessageGetter.readJsonFile(MyConfig.RESOURCE_PATH + "myconfig.json");

        String version;
        if (objectMap != null && objectMap.containsKey("version"))
            version = objectMap.get("version").toString();
        else
            version = "1";
        result = result + ",\"version\":\"" + version + "\"}";
        return result;
    }

    //登陆（wx端）
    public Map<String, Object> login(String u_id) {
        Message message = new Message();
        if (Objects.equals(u_id, "undefined")){
            message.setMeta("FAIL", 200);
            return message;
        }
        userMapper.createWxUser(u_id);
        userRepository.createUser(u_id);
        Map<String, Object> userInfo = userMapper.selectById(u_id);
        userInfo.put("moment_num", momentMapper.getMomentNumByUid(u_id)); //评论数
        userInfo.put("follow_num", foodLikeMapper.getLikeNumByUid(u_id)); //收藏菜谱数
        userInfo.put("make_num", userFoodMapper.getRecordNumByUid(u_id)); //制作数
        message.setMeta("SUCCESS", 200);
        message.setMessage(userInfo);
        return message;
    }

    //登陆（安卓端）
    public Map<String, Object> login(String u_id, String u_pwd) {
        Message message = new Message();
        if (Objects.equals(u_id, "undefined")){
            message.setMeta("FAIL", 200);
            return message;
        }
        Map<String, Object> userInfo = userMapper.selectByIdAndPwd(u_id, u_pwd);
        if (userInfo == null)
            message.setMeta("FAIL", 200);
        else {
           // userInfo.put("moment_num", momentMapper.selectMyMomentTotalNum(u_id));
           // userInfo.put("course_num", userMapper.selectSelectedLessonPlanNumByUid(u_id));
           // userInfo.put("follow_num", courseFollowMapper.selectFollowCoursesNumByUid(u_id));

            //this.followUser(u_id, u_id);
            message.setMeta("SUCCESS", 200);
            message.setMessage(userInfo);
        }
        return message;
    }
    //注册
    public Map<String, Object> sign(String u_id,String u_pwd) {
        Message message = new Message();
        if (userMapper.createUser(u_id,u_pwd) != 0) {
            userRepository.createUser(u_id);
            message.setMeta("SUCCESS", 200);
        } else
            message.setMeta("FAIL", 200);
        return message;
    }

    public boolean updateNickname(String u_id, String nickName) {
        return userMapper.updateNickname(u_id, nickName);
    }
    public boolean updateHobby(String u_id, String hobby) {
        return userMapper.updateHobby(u_id, hobby);
    }
    public boolean updateGender(String u_id, int gender) {
        return userMapper.updateGender(u_id, gender);
    }
    public boolean updateAvatar(String u_id, String url) {
        String url_temp = MyConfig.ADDR + "/img/avatar/" + url + ".jpg";
        //String url_temp = "/files/" + url + ".jpg";
        return userMapper.updateAvatar(u_id, url_temp);
    }
    public boolean updateSignature(String u_id, String signature) {
        return userMapper.updateSignature(u_id, signature);
    }




    public List<Neo4jFood> getrecommendedFood(String u_id){
        int min_len = 20;
        List<Neo4jFood> recommendedFood = new ArrayList<>();
        List<String> fNames = new ArrayList<>();
        // 根据用户推荐过的菜进行推荐
        List<Neo4jFood> recommendedFoodByRecommendation = foodRepository.getRecommendedFoodByRecommendation(u_id);
//        System.out.println("recommendedFoodByRecommendation:"+recommendedFoodByRecommendation);
        for (Neo4jFood food : recommendedFoodByRecommendation) {
            if (recommendedFood.size() < min_len) {
                recommendedFood.add(food);
                fNames.add(food.getFName());
            }
        }

        // 根据用户做过的菜进行推荐
        if (recommendedFood.size() < min_len) {
            List<Neo4jFood> recommendedFoodByCookedFood = foodRepository.getRecommendedFoodByCookedFood(u_id);
            for (Neo4jFood food : recommendedFoodByCookedFood) {
                if (!fNames.contains(food.getFName()) && recommendedFood.size() < min_len) {
                    recommendedFood.add(food);
                    fNames.add(food.getFName());
                }
            }
        }


        // 根据用户做过的菜品类别进行推荐
        if (recommendedFood.size() < min_len) {
            List<Map<String, Object>> food = foodMapper.recommendByCategory(u_id);
            for (Map<String, Object> f : food) {
                Neo4jFood neo4jFood = Neo4jFood.Map2Neo4jFood(f);
                if (!fNames.contains(neo4jFood.getFName()) && recommendedFood.size() < min_len) {
                    recommendedFood.add(neo4jFood);
                    fNames.add(neo4jFood.getFName());
                }
            }
        }

        // 根据热门菜谱进行推荐
        if (recommendedFood.size() < min_len) {
            List<Neo4jFood> f = foodRepository.selectHotFood();
            for (Neo4jFood food : f) {
                if (!fNames.contains(food.getFName()) && recommendedFood.size() < min_len) {
                    recommendedFood.add(food);
                    fNames.add(food.getFName());
                }
            }
        }
        return recommendedFood;

    }
}
