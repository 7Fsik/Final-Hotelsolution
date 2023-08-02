package com.hotelsolution.fire.handler.exception;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NotFoundController {

    public String urlNotFound(){
        return "error/exception404";
    }
}
