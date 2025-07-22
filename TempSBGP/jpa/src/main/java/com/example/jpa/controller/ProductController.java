package com.example.jpa.controller;

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
	        ModelMap model) {
	
	    Product prod = new Product();
	    prod.setName(name);
	    prod.setPrice(Double.parseDouble(price));
	
	    pd.save(prod);
	    model.put("msg", "Added!");
	    System.out.println(pd.findAll());
	    return "addForm";
	}
	@GetMapping("/dash")
	public String getAllData(Model model)
	{
		List<Product> prod=pd.findAll();
		System.out.println(pd.findAll());
		model.addAttribute("data",prod);
		return "dashboard";
	}
	
	@RequestMapping("/delete/{id}")
	public String deleteProd(@PathVariable Integer id)
	{
		pd.deleteById(id);
		return "redirect:/viewitem";
	}
	@RequestMapping("/viewrecord/{id}")
	public String getSingleData(@PathVariable Integer id,Model model)
	{
		Product prod=pd.findById(id).get();
		model.addAttribute("data",prod);
		return "updateForm";
	}
	
	@PostMapping("/update")
	public String updateRecord(@RequestParam("prodname")String name, @RequestParam("price")String price){
		Product prod=new Product();
		prod.setName(name);
		prod.setPrice(Double.parseDouble(price));
		pd.save(prod);
		return "redirect:/viewitem";
	}
	@GetMapping("/")
	public String index(Model model)
	{
		List<Product> prod=pd.findAll();
		model.addAttribute("data",prod);
		return "index";
	}
	
	@RequestMapping("/desc/{id}")
	public String description(@PathVariable Integer id,Model model)
	{
		Product prod=pd.findById(id).get();
		model.addAttribute("data",prod);
		return "description";
	}

}
