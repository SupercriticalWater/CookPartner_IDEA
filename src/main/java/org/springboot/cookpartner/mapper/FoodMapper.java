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
    boolean updateFoodkName(@Param("f_id") int fid,
                           @Param("f_name") String nickName);

    @Update("update food " +
            "set num_like = #{num_like} " +
            "where f_id=#{f_id}")
    boolean updateNumLike(@Param("f_id") int fid,
                            @Param("num_like") int num_like);

    @Update("update food " +
            "set num_make = #{num_make} " +
            "where f_id=#{f_id}")
    boolean updateNumMake(@Param("f_id") int fid,
                          @Param("num_make") int num_make);

    @Select("select f_id,f_name,f_pic,f_th_pic,create_time,f_category,f_description,num_make,num_like,f_score,f_recommend " +
            "   from (select food.f_id,f_name,f_pic,f_th_pic,create_time,f_category,f_description,num_make,num_like,f_score,f_recommend," +
            "   count(m_recommendation) as r_num" +
            "       from moment " +
            "       join food on moment.f_id = food.f_id " +
            "       join (select food.f_category as category, count(f_category) as num " +
            "               from user_food " +
            "               join food on user_food.f_id = food.f_id " +
            "               where u_id = #{u_id} " +
            "               group by food.f_category " +
            "               order by num desc " +
            "               limit 1) as cn on food.f_category = cn.category " +
            "       where m_recommendation = 1.0 " +
            "       and food.f_id not in (select f_id from user_food where u_id = #{u_id}) " +
            "    group by f_id " +
            "    order by r_num desc) as `c.*rn` " +
            "limit 30 ")
    List<Map<String, Object>> recommendByCategory(@Param("u_id") String u_id);

}