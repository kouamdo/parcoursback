package cmr.notep.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cmr.notep.dao.CategoryEntity;
import cmr.notep.service.CategoryServiceImpl;


@RestController
@RequestMapping("/category")
public class CategoryController {

    @SuppressWarnings("unused")
    private CategoryServiceImpl categoryService ;

    public CategoryController(CategoryServiceImpl catergoCategoryServiceImpl)
    {
        this.categoryService = catergoCategoryServiceImpl ;
    }

    @PostMapping("/save")
    public ResponseEntity<CategoryEntity> saveCategory(@RequestBody CategoryEntity category)
    {
        try {
            CategoryEntity categoryExist = this.categoryService.SaveCategory(category);
            return new ResponseEntity<CategoryEntity>(categoryExist,HttpStatus.CREATED);
        } catch (Exception e) {
             return new ResponseEntity<CategoryEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/update/{id}")
    public ResponseEntity<CategoryEntity> updateCategory(@PathVariable String id,@RequestBody CategoryEntity category)
    {
        try {
            this.categoryService.SetCategory(id, category);
            return new ResponseEntity<CategoryEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<CategoryEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }
    
    @PostMapping("/delete/{id}")
    public ResponseEntity<CategoryEntity> deleteCategory(@PathVariable String id)
    {
        try {
            this.categoryService.DeleteCategory(id);
            return new ResponseEntity<CategoryEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<CategoryEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }

    @PostMapping("/find/{id}")
    public ResponseEntity<CategoryEntity> findCategory(@PathVariable String id)
    {
        try {
            this.categoryService.GetCategory(id);
            return new ResponseEntity<CategoryEntity>(HttpStatus.OK) ;
        } catch (Exception e) {
            return new ResponseEntity<CategoryEntity>(HttpStatus.INTERNAL_SERVER_ERROR);
       }
    }
}
