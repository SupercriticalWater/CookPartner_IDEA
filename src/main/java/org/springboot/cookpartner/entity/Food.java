package org.springboot.cookpartner.entity;
import lombok.Data;

@Data
public class Food {
    String f_id; //菜谱编号
    String f_name; //菜谱名称
    String f_pic; //菜谱图片
    String f_th_pic; //缩略图
    String create_time;//创建时间
    String f_category; //类别
    String f_description; //简介
    Integer num_make;//制作用户数
    Integer num_like;//收藏用户数
    Integer f_score;//积分
}
