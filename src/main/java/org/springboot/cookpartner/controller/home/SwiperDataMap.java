package org.springboot.cookpartner.controller.home;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;


public class SwiperDataMap extends HashMap<String, Object>{
    public SwiperDataMap(String no, String image_src, String navigator_url) {
        this.put("goods_id", no);
        this.put("image_src", image_src);
        this.put("open_type", "navigate");
        this.put("navigator_url", navigator_url);
    }

    public static List<SwiperDataMap> SwiperDataMapList() {
        List<String> srcList = Arrays.asList(
                "https://localhost:8080/swiperImg/1.jpg",
                "https://localhost:8080/swiperImg/2.jpg",
                "https://localhost:8080/swiperImg/3.jpg");

        List<String> noList = Arrays.asList(
                "0",
                "1",
                "2"
        );

        List<String> urlList = Arrays.asList(
                "",
                "",
                ""
        );

        List<SwiperDataMap> swiperDataMapList = new ArrayList<>();
        for (int i = 0; i < 3; i++)
            swiperDataMapList.add(new SwiperDataMap(noList.get(i), srcList.get(i), urlList.get(i)));
        return swiperDataMapList;
    }
}
