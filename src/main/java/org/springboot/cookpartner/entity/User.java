package org.springboot.cookpartner.entity;

import lombok.Data;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@Data
@TableName("user")
public class User {
    String u_id; //用户号
    String u_pwd; //密码
    String u_nickname; //昵称
    String u_url; //头像
    Integer u_gender;//性别
    String u_hobby;//偏好
    Integer u_score;//积分
    Integer u_level;//等级
    String u_signature;//个性签名

}
