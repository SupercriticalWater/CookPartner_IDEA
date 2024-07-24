package org.springboot.cookpartner.node;



import cn.hutool.core.date.DateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Id;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Property;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.util.Date;
import java.util.Map;

@Data
@Node("food")
public class Neo4jFood {
    @Id
    @GeneratedValue
    private Long id;

    @Property("f_id")
    private String fId;

    @Property("f_name")
    private String fName;

    @Property("f_pic")
    private String fPic;

    @Property("f_th_pic")
    private String fThPic;


    @Property("create_time")
    //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String createTime;

    @Property("f_category")
    private String fCategory;

    @Property("f_description")
    private String fDescription;

    @Property("num_make")
    private String numMake;

    @Property("num_like")
    private String numLike;

    @Property("f_score")
    private String fScore;

    public static Neo4jFood Map2Neo4jFood(Map<String, Object> food) {
        Neo4jFood neo4jFood = new Neo4jFood();
        if (food.get("f_id") != null)
            neo4jFood.fId = food.get("f_id").toString();
        if (food.get("f_name") != null)
            neo4jFood.fName = food.get("f_name").toString();
        if (food.get("f_pic") != null)
            neo4jFood.fPic = food.get("f_pic").toString();
        if (food.get("f_th_pic") != null)
            neo4jFood.fThPic = food.get("f_th_pic").toString();
        if (food.get("create_time") != null)
            neo4jFood.createTime = food.get("create_time").toString();
        if (food.get("f_category") != null)
            neo4jFood.fCategory = food.get("f_category").toString();
        if (food.get("f_description") != null)
            neo4jFood.fDescription = food.get("f_description").toString();
        if (food.get("num_make") != null)
            neo4jFood.numMake = food.get("num_make").toString();
        if (food.get("num_like") != null)
            neo4jFood.numLike = food.get("num_like").toString();
        if (food.get("f_score") != null)
            neo4jFood.fScore = food.get("f_score").toString();

        return neo4jFood;
    }


}
