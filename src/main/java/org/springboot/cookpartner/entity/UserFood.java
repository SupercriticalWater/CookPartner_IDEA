package org.springboot.cookpartner.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import lombok.Data;

@Data
@TableName("user_food")
public class UserFood {
    Long m_id;
    String u_id;
    Long f_id;
    String u_maketime;
}
