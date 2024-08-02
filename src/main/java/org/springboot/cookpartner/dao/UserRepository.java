package org.springboot.cookpartner.dao;

import org.springboot.cookpartner.node.User;
import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.data.neo4j.repository.query.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.web.bind.annotation.PathVariable;

public interface UserRepository extends Neo4jRepository<User, Long> {
    @Query("merge(:user{openid:$openid})")
    void createUser(@Param(value = "openid") String id);

    @Query("match (u:user),(f:food) where u.openid = $u_id and f.f_id = $f_id " +
            "merge (u)-[r:RECOMMEND{grade:'1.0'}]->(f) " +
            "return r")
    void updateUserRecommendFood(@Param("u_id") String u_id,
                                  @Param("f_id") String f_id);
    @Query("MATCH (u:user)-[r:RECOMMEND]->(f:food) WHERE u.openid = $u_id AND f.f_id = $f_id " +
            "DELETE r " +
            "RETURN 'Relationship deleted successfully.'")
    void deleteUserRecommendFood(@Param("u_id") String u_id,
                                 @Param("f_id") String f_id);

    @Query("match (u:user),(f:food) where u.openid = $u_id and f.f_id = $f_id " +
            "merge (u)-[r:DONE]->(f) " +
            "return count(r) > 0 as exists")
    boolean updateUserCookedFood(@Param("u_id") String u_id,
                                 @Param("f_id") String f_id);

    @Query("MATCH (u:user)-[r:DONE]->(f:food) WHERE u.openid = $u_id AND f.f_id = $f_id " +
            "DELETE r " +
            "RETURN 'Relationship deleted successfully.'")
    void deleteUserCookedFood(@Param("u_id") String u_id,
                              @Param("f_id") String f_id);




}
