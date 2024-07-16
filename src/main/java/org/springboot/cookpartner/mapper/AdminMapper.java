package org.springboot.cookpartner.mapper;

import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.Admin;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.FoodLike;


import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper extends BaseMapper<Admin>{
    @Select("select * from admin where name = #{name} and password =  #{password}")
    Admin selectByNameAndPasswordAndIsAdmin(@Param("name") String name,
                                            @Param("password") String password);



}
