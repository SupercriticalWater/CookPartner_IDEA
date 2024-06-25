package org.springboot.cookpartner.controller.food;

import org.springboot.cookpartner.common.Result;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.service.FoodService;
import org.springboot.cookpartner.utils.DownloadImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.annotation.Resource;
import java.util.List;
@RestController
@RequestMapping("/food")
public class FoodController {
    @Resource
    private FoodService foodService;

    //获取所有菜谱-默认排序
    @GetMapping("/all")
    public Map<String,Object> findAll() {
        Message message = new Message();
        message.setMessage(foodService.findAllFoods());
        return message;
    }

    //获取所有菜谱-按喜爱数从高到低排序
    @GetMapping("/all_like")
    public Map<String,Object> findAll_Like() {
        Message message = new Message();
        message.setMessage(foodService.findAllFoods_Like());
        return message;
    }
    //获取所有菜谱-按制作数从高到低排序
    @GetMapping("/all_make")
    public Map<String,Object> findAll_Make() {
        Message message = new Message();
        message.setMessage(foodService.findAllFoods_Make());
        return message;
    }
    //获取所有菜谱-按发布时间从新到旧排序
    @GetMapping("/all_time")
    public Map<String,Object> findAll_Time() {
        Message message = new Message();
        message.setMessage(foodService.findAllFoods_Time());
        return message;
    }
    //获取所有菜谱-按发布时间从新到旧排序
    @GetMapping("/recommend")
    public Map<String,Object> findFrontFood() {
        Message message = new Message();
        message.setMessage(foodService.findFrontFoods());
        return message;
    }

    //获取某个类别下的所有菜谱
    @GetMapping("/type/{tid}")
    public Map<String,Object> findFoodByType(@PathVariable int tid) {
        Message message = new Message();
        message.setMessage(foodService.findFoodByType(tid));
        return message;
    }

    @GetMapping("/fid/{fid}")
    public Map<String,Object> findFoodByFid(@PathVariable int fid) {
        Message message = new Message();
        message.setMessage(foodService.findFoodByFid(fid));
        return message;
    }

    @GetMapping("/search")
    public Map<String,Object> searchFood(
            @RequestParam(required = false, defaultValue = "") String searchText,
            @RequestParam(required = false) Integer tid) {
        Message message = new Message();
        message.setMessage(foodService.SerchFood(searchText,tid));
        return message;
    }



}
