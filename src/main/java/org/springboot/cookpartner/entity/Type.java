package org.springboot.cookpartner.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.IdType;

@Data
@TableName("type")
public class Type {
    @TableId(value = "t_id", type = IdType.AUTO)
    Long tid; //分类编号
    String tname; //分类名称
}
