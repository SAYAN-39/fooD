package com.example.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BillController {

    @PostMapping("/bill")
    public String billPage(@RequestParam int productId,
                           @RequestParam String productName,
                           @RequestParam double productPrice,
                           Model model) {

        double delivery = 40;
        double tax = productPrice * 0.12;
        double total = productPrice + delivery + tax;

        model.addAttribute("productName", productName);
        model.addAttribute("productPrice", productPrice);
        model.addAttribute("deliveryFee", delivery);
        model.addAttribute("tax", tax);
        model.addAttribute("total", total);
        
        return "bill"; // JSP file: bill.jsp
    }
}
