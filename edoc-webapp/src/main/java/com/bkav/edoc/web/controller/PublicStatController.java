package com.bkav.edoc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PublicStatController {

    @RequestMapping(value = "/public/stat", method = RequestMethod.GET)
    public String publicStat() {
        return "publicReport";
    }

    @RequestMapping(value = "/public/stat/detail", method = RequestMethod.GET)
    public String publicStatDetail(){
        return "publicReportDetail";
    }
}