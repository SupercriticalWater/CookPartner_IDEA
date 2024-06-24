package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.Food;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;

import java.util.Map;
@Mapper
public interface FoodMapper extends BaseMapper<Food> {


    @Select("select * from food where fid = #{fid} ")
    List<Food> getFoodByFid(int fid);

    @Select("select * from food")
    List<Food> findAllFoods();

    @Select("select * from food"+
             "where f_recommend = 1")
    List<Food> findFrontFoods();

    @Insert("insert into food(f_name,f_pic,f_th_pic,create_time,f_category,f_description,f_score) " +
            "VALUES (#{f_name},#{f_pic},#{f_th_pic},#{create_time},#{f_category},#{f_description},#{f_score})")
    int createFood(@Param("food") Food food);


    @Update("update food " +
            "set f_name = #{f_name} " +
            "where f_id=#{f_id}")
    boolean updateFoodkName(@Param("f_id") String uId,
                           @Param("f_name") String nickName);



}