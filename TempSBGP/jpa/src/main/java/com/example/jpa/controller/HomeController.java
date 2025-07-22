package com.example.jpa.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.jpa.model.Product;

@Controller
public class HomeController {
	@RequestMapping("nav")
	public String navBar()
	{
		return "navbar";
	}
	
	@RequestMapping("reg")
	public String signUp()
	{
		return "signup";
	}
	
	@RequestMapping("log")
	public String login()
	{
		return "login";
	}
	
	@RequestMapping("des")
	public String description()
	{
		return "description";
	}
}
