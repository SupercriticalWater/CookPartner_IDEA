package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.UserFood;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Mapper
public interface UserFoodMapper  extends BaseMapper<UserFood>{
    @Select("select * from user_food where u_id = #{uid} and f_id =  #{fid}")
    Map<String, Object> findByUidAndFid(@Param("uid")String uid, @Param("fid")int fid);

    @Select("select user_food.*, food.f_name, food.f_th_pic, food.f_description, type.tname "+
            "from user_food,food,type where u_id = #{uid} and user_food.f_id = food.f_id and food.f_category = type.tid order by u_maketime desc")
    List<Map<String, Object>> findByUid(@Param("uid")String uid);

    @Insert("insert into user_food(u_id, f_id, u_maketime) values (#{uid}, #{fid}, #{utime})")
    int AddRecord(@Param("uid")String uid,@Param("fid") int fid,@Param("utime") String ltime);

    @Select("select count(*) from user_food where u_id = #{uid}")
    int getRecordNumByUid(@Param("uid")String uid);

}
