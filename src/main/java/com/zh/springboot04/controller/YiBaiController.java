package com.zh.springboot04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: zh
 * @Date: 2018/11/21 09:44
 * @Description:
 */
@Controller
public class YiBaiController {

    @RequestMapping("YIBAI")
    public String yiBai(){
        System.out.println(321);
        return "YIBAI";
    }
}
