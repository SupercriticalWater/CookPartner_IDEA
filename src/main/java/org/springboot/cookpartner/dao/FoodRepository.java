package org.springboot.cookpartner.dao;

import cn.hutool.core.date.DateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springboot.cookpartner.node.Neo4jFood;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.Date;
import java.util.List;


public interface FoodRepository extends Neo4jRepository<Neo4jFood, Long> {

    @Query("MERGE(:food{f_id:$f_id,f_name:$f_name,f_pic:$f_pic,f_th_pic:$f_th_pic,create_time:$create_time,f_category:$f_category,f_description:$f_description,num_make:$num_make,num_like:$num_like,f_score:$f_score})")
    void createFood(@Param(value = "f_id") Long fId,
                    @Param(value = "f_name") String fName,
                    @Param(value = "f_pic") String fPic,
                    @Param(value = "f_th_pic") String fThPic,
//                    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
//                    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                    @Param(value = "create_time") String createTime,
                    @Param(value = "f_category") String fCategory,
                    @Param(value = "f_description") String fDescription,
                    @Param(value = "num_make") Long numMake,
                    @Param(value = "num_like") Long numLike,
                    @Param(value = "f_score") Integer fScore
    );


    //基于用户推荐过的菜进行推荐
    @Query( "MATCH(i:user{openid:$openid}),(other:user) " +
            "WHERE other.openid <> $openid " +
            "WITH i, other " +
            "OPTIONAL MATCH common=(i)-[:RECOMMEND]->(:food)<-[:RECOMMEND]-(other) "+
            "WITH i, other, COUNT(common) as intersection "+
            "OPTIONAL MATCH (i)-[:RECOMMEND]->(myFavour:food) "+
            "WITH i, other, intersection, collect(myFavour) as myFavour,count(myFavour) as myFavourNum  " +
            "OPTIONAL MATCH (other)-[:RECOMMEND]->(otherFavour:food)  " +
            "WHERE NOT otherFavour IN myFavour  " +
            "WITH i, other, intersection, count(otherFavour) AS recommendationNum,myFavourNum,otherFavour as recommendation  " +
            "where intersection/toFloat(recommendationNum+myFavourNum) > 0.2  " +
            "with recommendation,count(recommendation) as r_num " +
            "return recommendation as food " +
            "order by r_num desc limit 5")
    List<Neo4jFood> getRecommendedFoodByRecommendation(@Param(value = "openid") String openid);

    //基于用户做过的菜进行推荐
    @Query("MATCH (i:user{openid:$openid}),(other:user) " +
            "where other.openid <> $openid " +
            "WITH i, other " +
            "OPTIONAL MATCH common=(i)-[:DONE]->(:food)<-[:DONE]-(other) " +
            "WITH i, other, COUNT(common) as intersection " +
            "OPTIONAL MATCH (i)-[:DONE]->(myFavour:food) " +
            "WITH i, other, intersection, collect(myFavour) as myFavour, count(myFavour) as myFavourNum " +
            "OPTIONAL MATCH (other)-[:DONE]->(otherFavour:food) " +
            "WHERE NOT otherFavour IN myFavour " +
            "WITH i, other, intersection, count(otherFavour) AS recommendationNum, myFavourNum, otherFavour as recommendation " +
            "WHERE intersection/toFloat(recommendationNum + myFavourNum) > 0.2 " +
            "WITH recommendation, count(recommendation) as r_num " +
            "RETURN recommendation as food " +
            "ORDER BY r_num DESC LIMIT 5")
    List<Neo4jFood> getRecommendedFoodByCookedFood(@Param(value = "openid") String openid);

    // 获取热门菜谱
    @Query("MATCH (:user)-[r:RECOMMEND]->(f:food) " +
            "WITH f ,count(r) AS r_num " +
            "RETURN f " +
            "ORDER BY r_num DESC " +
            "LIMIT 30")
    List<Neo4jFood> selectHotFood();

    // 获取特定类别下的热门菜谱
    @Query("MATCH (f:food) " +
            "WHERE f.f_category = $f_category " +
            "WITH f, COUNT(:user)-[r:RECOMMEND]->(f) as r_num " +
            "WHERE r_num > 0 " +
            "RETURN f " +
            "ORDER BY r_num DESC " +
            "LIMIT 30")
    List<Neo4jFood> selectCategoryHotFood(@Param(value = "f_category") String fCategory);

}
