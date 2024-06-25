package org.springboot.cookpartner.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.IdType;

@Data
@TableName("food")
public class Food {
    @TableId(value = "f_id", type = IdType.AUTO)
    Long f_id; //菜谱编号
    @TableField("f_name")
    String f_name; //菜谱名称
    @TableField("f_pic")
    String f_pic; //菜谱图片
    String f_th_pic; //缩略图
    String create_time;//创建时间
    String f_category; //类别
    String f_description; //简介
    Long num_make;//制作用户数
    Long num_like;//收藏用户数
    Long f_score;//积分
    Integer f_recommend;//是否推荐
}
