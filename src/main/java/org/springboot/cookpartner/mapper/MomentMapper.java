package org.springboot.cookpartner.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springboot.cookpartner.entity.Moment;
import org.apache.ibatis.annotations.*;
import org.springboot.cookpartner.entity.User;
import java.util.List;

import java.util.Map;
@Mapper
public interface MomentMapper extends BaseMapper<Moment>{

    @Select("select moment.*, user.u_nickname,u_url, food.f_name  from moment, user, food where m_id = #{mid} and user.u_id = moment.u_id and food.f_id = moment.f_id")
    Map<String, Object> findMomentByMid(int mid);

    @Select("select moment.*, user.u_nickname, u_url, food.f_name "+
            "from moment, user, food where moment.u_id = #{uid} and user.u_id = moment.u_id and food.f_id = moment.f_id")
    List<Map<String, Object>> findByUid(@Param("uid")String uid);

    @Select("select moment.*, user.u_nickname, u_url, food.f_name "+
            "from moment, user, food where moment.f_id = #{fid} and user.u_id = moment.u_id and food.f_id = moment.f_id")
    List<Map<String, Object>> findByFid(@Param("fid")int fid);

    @Insert("insert into moment(u_id, f_id, m_content,m_create_time) values (#{uid}, #{fid},#{mcontent}, #{mcreatetime})")
    int AddMoment(@Param("uid")String uid,@Param("fid") int fid,@Param("mcontent") String mcontent,@Param("mcreatetime") String mcreatetime);

    @Delete("delete from moment where m_id = #{mid}")
    Boolean DeleteMoment(@Param("mid") int mid);

    @Select("select count(*) from moment where u_id = #{uid}")
    int getMomentNumByUid(@Param("uid")String uid);

    @Select("select count(*) from moment where f_id = #{fid}")
    int getMomentNumByFid(@Param("fid")int fid);

}
