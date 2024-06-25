package org.springboot.cookpartner.controller.type;

import org.springboot.cookpartner.common.Result;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.service.TypeService;
import org.springboot.cookpartner.utils.DownloadImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.annotation.Resource;
import java.util.List;
@RestController
@RequestMapping("/type")
public class TypeController {
    @Resource
    private TypeService typeService;

    //获取所有菜谱-默认排序
    @GetMapping("/all")
    public Map<String,Object> findAllType() {
        Message message = new Message();
        message.setMessage(typeService.findAllType());
        return message;
    }

    @GetMapping("/tid/{tid}")
    public Map<String,Object> findTypeByTid(@PathVariable int tid) {
        Message message = new Message();
        message.setMessage(typeService.findTypeBytid(tid));
        return message;
    }
}
