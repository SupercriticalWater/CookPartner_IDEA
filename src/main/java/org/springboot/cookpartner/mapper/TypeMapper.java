package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.Type;
import org.apache.ibatis.annotations.*;
import java.util.List;

import java.util.Map;
@Mapper
public interface TypeMapper extends BaseMapper<Type>{
    @Select("select * from type where tid = #{tid}  ")
    Map<String, Object> findTypeByTid(int tid);

    @Select("select * from type")
    List<Map<String, Object>> findAllType();

}
