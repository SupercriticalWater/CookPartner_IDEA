package org.springboot.cookpartner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;


@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class CookPartnerApplication {

    public static void main(String[] args) {
        SpringApplication.run(CookPartnerApplication.class, args);
    }

}
