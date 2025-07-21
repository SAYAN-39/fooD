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
public String addProd(@RequestParam("prodid")String id, @RequestParam("prodname")String name,
		@RequestParam("category")String catagory,@RequestParam("qty")String quantity,
		@RequestParam("price")String price,ModelMap model)
{
	Product prod=new Product();
	prod.setId(id);
	prod.setName(name);
	prod.setCatagory(catagory);
	prod.setQuantity(Integer.parseInt(quantity));
	prod.setPrice(Double.parseDouble(price));
	pd.save(prod);
	model.put("msg", "Added!");
	return "addForm";
}
@GetMapping("/viewitem")
public String getAllData(Model model)
{
	List<Product> prod=pd.findAll();
	
	model.addAttribute("data",prod);
	return "dashboard";
}

@RequestMapping("/delete/{id}")
public String deleteProd(@PathVariable String id)
{
	pd.deleteById(id);
	return "redirect:/viewitem";
}
@RequestMapping("/viewrecord/{id}")
public String getSingleData(@PathVariable String id,Model model)
{
	Product prod=pd.findById(id).get();
	model.addAttribute("data",prod);
	return "updateForm";
}

@PostMapping("/update")
public String updateRecord(@RequestParam("prodid")String id, @RequestParam("prodname")String name,
		@RequestParam("catagory")String catagory,@RequestParam("qty")String quantity,
		@RequestParam("price")String price)


{
	//System.out.println("Hello........."+name);
	Product prod=new Product();
	prod.setId(id);
	prod.setName(name);
	prod.setCatagory(catagory);
	prod.setQuantity(Integer.parseInt(quantity));
	prod.setPrice(Double.parseDouble(price));
	pd.save(prod);
	return "redirect:/viewitem";
}

@GetMapping("/mens")
public String getAllMensItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("mcollection");
	model.addAttribute("product",prod);
	return "mens";
}

@GetMapping("/womens")
public String getAllWomensItem(Model model)
{
	List<Product> prod=(List<Product>) pd.findByCatagory("wcollection");
	model.addAttribute("product",prod);
	return "womens";
}
}
