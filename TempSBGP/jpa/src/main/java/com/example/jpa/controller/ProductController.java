package com.example.jpa.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.jpa.dao.ProductDao;
import com.example.jpa.model.Product;

@Controller
public class ProductController {
    @Autowired
    ProductDao pd;
    
    @PostMapping("/additem")
    public String addProd(
            @RequestParam("prodname") String name,
            @RequestParam("price") String price,
            @RequestParam("description") String description,
            @RequestParam("image") MultipartFile file,
            ModelMap model) {

        Product prod = new Product();
        prod.setName(name);
        prod.setPrice(Double.parseDouble(price));
        prod.setDescription(description);

        if (!file.isEmpty()) {
            try {
                // Absolute path to uploads folder at project root
                String uploadDir = System.getProperty("user.dir") + "/uploads/";

                // Create the uploads directory if it doesn't exist
                File directory = new File(uploadDir);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                // Save file with original filename (or use UUID to avoid name clash)
                String fileName = file.getOriginalFilename();
                File saveFile = new File(uploadDir + fileName);
                file.transferTo(saveFile);

                // Store just the filename in DB
                prod.setImage(fileName);

            } catch (IOException e) {
                e.printStackTrace();
                model.put("msg", "Error uploading image");
                return "addForm";
            }
        }

        pd.save(prod);
        model.put("msg", "Added!");
        return "addForm";
    }

    
    
    @GetMapping("/dash")
    public String getAllData(Model model) {
        List<Product> prod = pd.findAll();
        System.out.println(pd.findAll());
        model.addAttribute("data", prod);
        return "dashboard";
    }
    
    @RequestMapping("/delete/{id}")
    public String deleteProd(@PathVariable Integer id) {
        pd.deleteById(id);
        return "redirect:/viewitem";
    }
    
    @RequestMapping("/viewrecord/{id}")
    public String getSingleData(@PathVariable Integer id, Model model) {
        Product prod = pd.findById(id).get();
        model.addAttribute("data", prod);
        return "updateForm";
    }
    
    @PostMapping("/update")
    public String updateRecord(
            @RequestParam("prodname") String name,
            @RequestParam("category") String category,
            @RequestParam("price") String price,
            @RequestParam("description") String description) {
        Product prod = new Product();
        prod.setName(name);
        prod.setPrice(Double.parseDouble(price));
        prod.setDescription(description);
        pd.save(prod);
        return "redirect:/viewitem";
    }
    
    @GetMapping("/")
    public String index(Model model) {
        List<Product> prod = pd.findAll();
        model.addAttribute("data", prod);
        return "index";
    }
    
    @RequestMapping("/desc/{id}")
    public String description(@PathVariable Integer id, Model model) {
        Product prod = pd.findById(id).get();
        model.addAttribute("data", prod);
        return "description";
    }
}