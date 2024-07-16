package org.springboot.cookpartner.controller.food;

import org.springboot.cookpartner.common.Result;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.service.FoodLikeService;
import org.springboot.cookpartner.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.annotation.Resource;
import java.util.List;
@RestController
@RequestMapping("/foodlike")
public class FoodLikeController {
    @Resource
    private FoodLikeService foodLikeService;

    //获取某个用户收藏的所有菜谱
    @GetMapping("/user/{uid}")
    public Map<String,Object> findLikeByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(foodLikeService.findLikeByUser(uid));
        return message;
    }

    @GetMapping("/num/{uid}")
    public Map<String,Object> getNumByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(foodLikeService.getRecordNumByUser(uid));
        return message;
    }

    //收藏菜谱
    @GetMapping("/like")
    public Map<String,Object> AddLike(@RequestParam("uid") String uid,@RequestParam("fid") int fid) {
        Message message = new Message();
        message.setMeta("收藏成功", 200);
        message.setMessage(foodLikeService.addLike(uid,fid));
        return message;
    }

    //收藏菜谱
    @GetMapping("/deletelike")
    public Map<String,Object> DeleteLike(@RequestParam("uid") String uid,@RequestParam("fid") int fid) {
        Message message = new Message();
        message.setMeta("删除成功", 200);
        message.setMessage(foodLikeService.DeleteLike(uid,fid));
        return message;
    }






}
