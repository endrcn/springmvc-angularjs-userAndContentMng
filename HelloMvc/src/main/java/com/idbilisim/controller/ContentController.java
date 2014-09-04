package com.idbilisim.controller;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idbilisim.model.Content;
import com.idbilisim.service.PersistenceService;
import com.idbilisim.service.PersistenceServiceImpl;

@Controller
@RequestMapping("/content")
public class ContentController {

	@RequestMapping(value="/list")
	public @ResponseBody List<Content> getAllContents(){
		PersistenceService service = new PersistenceServiceImpl();
		List<Content> contentList = service.getAllEntities(Content.class);
		
		for(Content c : contentList){
			System.out.println(c.getDate());
		}
		
		return contentList;
	}
	
	@RequestMapping(value="/")
	public String getContentPage(final ModelMap model){
		return "content";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public @ResponseBody Content addContent(@RequestBody Content content ){
		
		content.setDate(new Date());
		System.out.println(content.getDate());
		System.out.println(content.getStatus());
		
		PersistenceService service = new PersistenceServiceImpl();
		service.save(content);
		
		return content;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public @ResponseBody Content updateContent(@RequestBody Content content){
		
		PersistenceService service = new PersistenceServiceImpl();
		service.update(content);
		
		return content;
	}
	
	@RequestMapping(value="/delete/{id}")
	public String deleteUser(@PathVariable Long id){
		
		Content content = new Content();
		content.setId(id);
		
		PersistenceService service = new PersistenceServiceImpl();
		
		service.getByNamedQuery("Content.getById", content);
		
		service.delete(content);
		
		return "content";
	}
	
}
