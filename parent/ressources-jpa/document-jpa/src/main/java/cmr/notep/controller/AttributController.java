package cmr.notep.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cmr.notep.service.AttributServiceImpl;



@RestController

@RequestMapping("/attribut")
public class AttributController {
    
    @SuppressWarnings("unused")
    private AttributServiceImpl attributService ;

    public AttributController(AttributServiceImpl attributServiceImpl)
    {
        this.attributService = attributServiceImpl ;
    }

    @PostMapping("save")
    public String postMethodName(@RequestBody String entity) {
        //TODO: process POST request
        
        return entity;
    }
    

}
