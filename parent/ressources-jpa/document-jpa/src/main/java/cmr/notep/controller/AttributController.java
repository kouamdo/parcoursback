package cmr.notep.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cmr.notep.dao.AttributsEntity;
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

    @PostMapping("/save")
    public ResponseEntity<AttributsEntity> saveAttribut (@RequestBody AttributsEntity attribut) {
        try {
                AttributsEntity attribExist = this.attributService.SaveAttrib(attribut) ;
                return new ResponseEntity<AttributsEntity>(attribExist,HttpStatus.CREATED) ;
        }catch (Exception e)
        {
            return new ResponseEntity<AttributsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/update/{id}")
    public ResponseEntity<AttributsEntity> updateAttribut (@PathVariable String id,@RequestBody AttributsEntity attribut) {
        try {
                this.attributService.SetAttrib(id, attribut) ;
                return new ResponseEntity<AttributsEntity>(HttpStatus.OK) ;
        }catch (Exception e)
        {
            return new ResponseEntity<AttributsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/delete/{id}")
    public ResponseEntity<AttributsEntity> deleteAttribut (@PathVariable String id) {
        try {
                this.attributService.DeleteAttrib(id);
                return new ResponseEntity<AttributsEntity>(HttpStatus.OK) ;
        }catch (Exception e)
        {
            return new ResponseEntity<AttributsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/find/{id}")
    public ResponseEntity<AttributsEntity> findAttribut (@PathVariable String id) {
        try {
                this.attributService.GetAttrib(id);
                return new ResponseEntity<AttributsEntity>(HttpStatus.OK) ;
        }catch (Exception e)
        {
            return new ResponseEntity<AttributsEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
