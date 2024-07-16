package org.springboot.cookpartner.controller.food;
import org.springboot.cookpartner.common.Result;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.service.FoodLikeService;
import org.springboot.cookpartner.service.UserFoodService;
import org.springboot.cookpartner.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.annotation.Resource;
import java.util.List;
@RestController
@RequestMapping("/made")
public class UserFoodController {
    @Resource
    private UserFoodService userFoodService;

    //获取某个用户收藏的所有菜谱
    @GetMapping("/user/{uid}")
    public Map<String,Object> findMakeRecordByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(userFoodService.findRecordByUser(uid));
        return message;
    }

    //收藏菜谱
    @GetMapping("/addmake")
    public Map<String,Object> AddMake(@RequestParam("uid") String uid,@RequestParam("fid") int fid) {
        Message message = new Message();
        Boolean res = userFoodService.addRecord(uid, fid);
        message.setMessage(res);
        if(res) {
            message.setMeta("添加成功", 200);
        }
        else {
            message.setMeta("添加失败", 400);
        }


        return message;
    }

    @GetMapping("/num/{uid}")
    public Map<String,Object> getNumByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(userFoodService.getRecordNumByUser(uid));
        return message;
    }

}
