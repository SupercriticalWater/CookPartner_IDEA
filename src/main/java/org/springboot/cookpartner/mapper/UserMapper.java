package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;
@Mapper
public interface UserMapper extends BaseMapper<User> {
    @Insert("insert ignore into user(u_id) " +
            "VALUES (#{u_id})")
    int createWxUser(@Param("u_id") String u_id);


    @Insert("insert ignore into user(u_id,u_pwd) " +
            "VALUES (#{u_id},#{u_pwd})")
    int createUser(@Param("u_id") String u_id, @Param("u_pwd") String u_pwd);

    @Select("select *" +
            "from user where u_id=#{u_id}")
    Map<String, Object> selectById(@Param("u_id") String u_id);

    @Select("select *" +
            "from user where u_id=#{u_id} and u_pwd = #{u_pwd}")
    Map<String, Object> selectByIdAndPwd(@Param("u_id") String u_id, @Param("u_pwd") String u_pwd);

    @Update("update user " +
            "set u_nickname = #{nickname} " +
            "where u_id=#{u_id}")
    boolean updateNickname(@Param("u_id") String uId,
                           @Param("nickname") String nickName);


    @Update("update user " +
            "set u_hobby = #{hobby} " +
            "where u_id=#{u_id}")
    boolean updateHobby(@Param("u_id") String uId,
                        @Param("hobby") String hobby);


    @Update("update user " +
            "set u_signature = #{signature} " +
            "where u_id=#{u_id}")
    boolean updateSignature(@Param("u_id") String uId,
                            @Param("signature") String signature);

    @Update("update user " +
            "set u_gender = #{gender} " +
            "where u_id=#{u_id}")
    boolean updateGender(@Param("u_id") String uId,
                         @Param("gender") int gender);

    @Update("update user " +
            "set u_url = #{url} " +
            "where u_id=#{u_id}")
    boolean updateAvatar(@Param("u_id") String uId,
                         @Param("url") String url);

    @Update("update user " +
            "set u_level = #{level} " +
            "where u_id=#{u_id}")
    boolean updateLevel(@Param("u_id") String uId,
                         @Param("level") Integer uLevel);

    @Update("update user " +
            "set u_score = #{score} " +
            "where u_id=#{u_id}")
    boolean updateScore(@Param("u_id") String uId,
                        @Param("score") Integer uScore);
}
