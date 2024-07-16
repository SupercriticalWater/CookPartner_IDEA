package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.Moment;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;

import java.util.Map;
@Mapper
public interface MomentMapper extends BaseMapper<Moment>{

    @Select("select * from food where m_id = #{mid}  ")
    Map<String, Object> findMomentByMid(int mid);

    @Select("select *"+
            "from moment where u_id = #{uid} ")
    List<Map<String, Object>> findByUid(@Param("uid")String uid);

    @Select("select *"+
            "from moment where f_id = #{fid} ")
    List<Map<String, Object>> findByFid(@Param("fid")int fid);

    @Insert("insert into moment(u_id, f_id, m_content,m_create_time) values (#{uid}, #{fid},#{mcontent}, #{mcreatetime})")
    int AddMoment(@Param("uid")String uid,@Param("fid") int fid,@Param("mcontent") String mcontent,@Param("mcreatetime") String mcreatetime);

    @Delete("delete from moment where m_id = #{mid}")
    Boolean DeleteMoment(@Param("mid") int mid);




}
