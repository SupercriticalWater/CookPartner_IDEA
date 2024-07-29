package org.springboot.cookpartner.controller.moment;

import org.springboot.cookpartner.common.Result;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.entity.Moment;
import org.springboot.cookpartner.service.FoodLikeService;
import org.springboot.cookpartner.service.MomentService;
import org.springboot.cookpartner.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.annotation.Resource;
import java.util.List;
@RestController
@RequestMapping("/moment")
public class MomentController {

    @Resource
    private MomentService momentService;

    //获取某个用户发布的所有动态
    @GetMapping("/user/{uid}")
    public Map<String,Object> findMomentByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(momentService.findMomentByUser(uid));
        return message;
    }

    //查看某个菜谱对应的所有评论
    @GetMapping("/food/{fid}")
    public Map<String,Object> findMomentByUser(@PathVariable int fid) {
        Message message = new Message();
        message.setMessage(momentService.findMomentByFid(fid));
        return message;
    }

    //获取某个用户发布的所有动态
    @GetMapping("/mid/{mid}")
    public Map<String,Object> findMomentByMid(@PathVariable int mid) {
        Message message = new Message();
        message.setMessage(momentService.findMomentByMid(mid));
        return message;
    }

    //发布评论动态
    @GetMapping("/addmoment")
    public Map<String,Object> AddMoment(@RequestParam("uid") String uid,
                                        @RequestParam("fid") int fid,
                                        @RequestParam("content") String content) {
        Message message = new Message();
        message.setMeta("发布成功", 200);
        message.setMessage(momentService.addMoment(uid, fid, content));
        return message;
    }

    //删除评论
    @GetMapping("/deletemoment")
    public Map<String,Object> DeleteLike(@RequestParam("mid") int mid) {
        Message message = new Message();
        message.setMeta("删除成功", 200);
        message.setMessage(momentService.deleteMoment(mid));
        return message;
    }

    @GetMapping("/num/uid/{uid}")
    public Map<String,Object> getNumByUser(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(momentService.getNumByUser(uid));
        return message;
    }

    @GetMapping("/num/fid/{fid}")
    public Map<String,Object> getNumByFood(@PathVariable int fid) {
        Message message = new Message();
        message.setMessage(momentService.getNumByFood(fid));
        return message;
    }

    @GetMapping("/search")
    public Map<String,Object> searchMoment(
            @RequestParam(required = false, defaultValue = "") String searchText) {
        Message message = new Message();
        message.setMessage(momentService.SerchMoment(searchText));
        return message;
    }

    @GetMapping("/all")
    public Map<String,Object> getAllMoment() {
        Message message = new Message();
        message.setMessage(momentService.findAllMoment());
        return message;
    }

    @GetMapping("/likedfood/uid/{uid}")
    public Map<String,Object> getLikedFoodMoment(@PathVariable String uid) {
        Message message = new Message();
        message.setMessage(momentService.findMomentByUserLike(uid));
        return message;
    }

    @GetMapping("/addlike")
    public Map<String,Object> addLike(@RequestParam("mid") int mid) {
        Message message = new Message();
        message.setMessage(momentService.LikeMoment(mid));
        return message;
    }

    @GetMapping("/addview")
    public Map<String,Object> addView(@RequestParam("mid") int mid) {
        Message message = new Message();
        message.setMessage(momentService.ViewMoment(mid));
        return message;
    }
}
