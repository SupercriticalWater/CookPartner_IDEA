package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.Food;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;

import java.util.Map;
@Mapper
public interface FoodMapper extends BaseMapper<Food> {


    @Select("select * from food where f_id = #{fid}  ")
    Map<String, Object> findFoodByFid(int fid);

    @Select("select food.* , type.tname from food,type where food.f_category = type.tid")
    List<Map<String, Object>> findAllFoods();
    @Select("select food.* , type.tname from food,type where food.f_category = type.tid order by num_like desc ")
    List<Map<String, Object>> findAllFoods_Like();
    @Select("select food.* , type.tname from food,type where food.f_category = type.tid order by num_make desc ")
    List<Map<String, Object>> findAllFoods_make();
    @Select("select food.* , type.tname from food,type where food.f_category = type.tid order by create_time desc ")
    List<Map<String, Object>> findAllFoods_time();

    @Select("select food.* , type.tname from food,type where food.f_category = type.tid "+
             "and f_recommend = 1")
    List<Map<String, Object>> findFrontFoods();

    @Select("select food.* , type.tname from food,type where food.f_category = type.tid "+
            "and f_category = #{tid}")
    List<Map<String, Object>> findFoodByType(int tid);

    @Insert("insert into food(f_name,f_pic,f_th_pic,create_time,f_category,f_description,f_score) " +
            "VALUES (#{f_name},#{f_pic},#{f_th_pic},#{create_time},#{f_category},#{f_description},#{f_score})")
    int createFood(@Param("food") Food food);


    @Update("update food " +
            "set f_name = #{f_name} " +
            "where f_id=#{f_id}")
    boolean updateFoodkName(@Param("f_id") String uId,
                           @Param("f_name") String nickName);



}