package org.springboot.cookpartner.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;

@Data
@TableName("admin")
public class Admin implements Serializable {
    private Integer adminid;

    private String name;

    private String password;
}
