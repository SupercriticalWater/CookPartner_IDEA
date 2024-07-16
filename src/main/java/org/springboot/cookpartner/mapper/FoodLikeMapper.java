package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.FoodLike;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Mapper
public interface FoodLikeMapper extends BaseMapper<FoodLike>{

    @Select("select * from food_like where u_id = #{uid} and f_id =  #{fid}")
    Map<String, Object> findLikeByUidAndFid(@Param("uid")String uid, @Param("fid")int fid);


    @Select("select food_like.*, food.f_name, food.f_th_pic, food.f_description, type.tname "+
            "from food_like,food,type where u_id = #{uid} and food_like.f_id = food.f_id and food.f_category = type.tid")
    List<Map<String, Object>> findLikeByUid(@Param("uid")String uid);

    @Insert("insert into food_like(u_id, f_id, l_time) values (#{uid}, #{fid}, #{ltime})")
    int AddLike(@Param("uid")String uid,@Param("fid") int fid,@Param("ltime") String ltime);

    @Delete("delete from food_like where u_id = #{uid} and f_id =  #{fid}")
    Boolean DeleteLike(@Param("uid")String uid,@Param("fid") int fid);

    @Select("select count(*) from food_like where u_id = #{uid}")
    int getLikeNumByUid(@Param("uid")String uid);

}
