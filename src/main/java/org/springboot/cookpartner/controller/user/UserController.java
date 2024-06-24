package org.springboot.cookpartner.controller.user;

import org.springboot.cookpartner.utils.JsonMessageGetter;
import org.springboot.cookpartner.config.MyConfig;
import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.service.UserService;
import org.springboot.cookpartner.entity.UserAvatar;
import org.springboot.cookpartner.utils.DownloadImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    //获取openid
    @GetMapping("/get_openid")
    public String getOpenid(@RequestParam("js_code") String js_code) {
        return userService.getOpenid(js_code);
    }
   //登陆
    @GetMapping("/login")
    public Map<String, Object> login(@RequestParam("openid") String openid,
                                     @RequestParam("user_pwd") String password) {
        if (openid.length() != 11) {
           // userService.followUser(openid, openid);
            //wx-login
            return userService.login(openid);
        } else
            //Android-login
            return userService.login(openid, password);
    }
    @GetMapping("/version")
    public String getVersion() {

        Map<String, Object> objectMap = JsonMessageGetter.readJsonFile(MyConfig.RESOURCE_PATH + "myconfig.json");

        String version;
        if (objectMap != null && objectMap.containsKey("version"))
            version = objectMap.get("version").toString();
        else
            version = "1";
        return "{\"openid\":\"user0005\",\"version\":\""+version+"\"}";
    }
    //注册
    @GetMapping("/sign")
    public Map<String, Object> sign(@RequestParam("openid") String openid,
                                    @RequestParam("user_pwd") String password) {
        return userService.sign(openid, password);
    }
    //更新昵称
    @GetMapping("/updateNickname")
    public boolean updateNickname(@RequestParam("openid") String u_id,
                                  @RequestParam("nickname") String nickname) {
        return userService.updateNickname(u_id, nickname);
    }
    //更新性别
    @GetMapping("/updateGender")
    public boolean updateGender(@RequestParam("openid") String u_id,
                                @RequestParam("gender") int gender) {
        return userService.updateGender(u_id, gender);
    }
    //更新偏好
    @GetMapping("/updateHobby")
    public boolean updateHobby(@RequestParam("openid") String u_id,
                               @RequestParam("hobby") String hobby) {
        return userService.updateHobby(u_id, hobby);
    }
    //更新个性签名
    @GetMapping("/updateSignature")
    public boolean updateSignature(@RequestParam("openid") String u_id,
                                   @RequestParam("signature") String signature) {
        return userService.updateSignature(u_id, signature);
    }
   //更新头像
    @PostMapping("/updateAvatar")
    public void updateAvatar(@RequestBody UserAvatar userAvatar) {
        String base64 = userAvatar.getUrl();
        String u_id = userAvatar.getOpenid();
        try {
            String t = String.valueOf((new Date().getTime()));
            DownloadImg.saveImageFromBase64(base64, MyConfig.RESOURCE_PATH + "static/img/avatar/" + u_id + t + ".jpg");
            userService.updateAvatar(u_id, u_id + t);
        } catch (Exception ignore) {
            System.out.println("error");
        }
    }

}
