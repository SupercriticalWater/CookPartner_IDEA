package org.springboot.cookpartner.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.IdType;

@Data
@TableName("moment")
public class Moment {
    Long m_id;
    String u_id;
    Long f_id;
    String m_content;
    Long m_like_num;
    Long m_browse_num;
    Float m_recommendation;
    String m_create_time;
}
