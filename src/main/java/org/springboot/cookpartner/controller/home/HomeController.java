package org.springboot.cookpartner.controller.home;

import org.springboot.cookpartner.controller.message.Message;
import org.springboot.cookpartner.utils.JsonMessageGetter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/home")
public class HomeController {
    @GetMapping("/swiperdata")
    public Map<String, Object> getSwiperData() {
        Message message = new Message();
        message.setMessage(SwiperDataMap.SwiperDataMapList());
        return message;
    }

    @GetMapping("/swiperurl")
    public Map<String, Object> getSwiperUrl() {
        Message message = new Message();
        List<String> urlList = new ArrayList<>();
        urlList.add("http://mp.weixin.qq.com/s?__biz=MzkzMDQ4NzUyMQ==&mid=2247483706&idx=1&sn=c5afad329d759f066d7adad0d67ebdbf");
        urlList.add("http://mp.weixin.qq.com/s?__biz=MzkzMDQ4NzUyMQ==&mid=2247483723&idx=1&sn=29406d4a64807ec29a97bfdf3e006aef");
        urlList.add("http://mp.weixin.qq.com/s?__biz=MzkzMDQ4NzUyMQ==&mid=2247483782&idx=1&sn=98fe495096c38997b9585716b11d3d7e");
        message.setMessage(urlList);
        return message;
    }
}
