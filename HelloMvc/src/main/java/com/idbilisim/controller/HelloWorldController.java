package com.idbilisim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
public class HelloWorldController {
 
	@RequestMapping(value="/")
	public String index(final ModelMap model){
		model.addAttribute("titel", "Araç Kiralama Servisi");
		System.out.println("HelloWorldController");
		return "index";
	}
}