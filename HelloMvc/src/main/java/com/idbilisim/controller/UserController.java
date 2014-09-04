package com.idbilisim.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idbilisim.model.User;
import com.idbilisim.service.PersistenceService;
import com.idbilisim.service.PersistenceServiceImpl;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<User> getUserAsJson() {
		PersistenceService persistenceService = new PersistenceServiceImpl();
		List<User> users = persistenceService.getAllEntities(User.class);
		
		for(User u : users){
			System.out.println(u.getEmail());
		}
		
		return users;
	}

	@RequestMapping(value = "/")
	public String getSignupForm(final ModelMap model) {
		return "user";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public @ResponseBody User addUser(@RequestBody final User user) {
		
		PersistenceService persistenceService = new PersistenceServiceImpl();
		persistenceService.save(user);
		
		System.out.println("Yeni kullanıcı eklendi: " + user.getFirstName());
		return user;
	}
	
	@RequestMapping(value="/deleteUser/{id}",method = RequestMethod.GET)
	public String deleteUser(@PathVariable(value="id") final Long id){
		
		PersistenceService persistenceService = new PersistenceServiceImpl();
		
		User user = new User();
		user.setId(id);

		List<User> userList = persistenceService.getByNamedQuery("User.getById",user);
		
		persistenceService.delete(user);
		return "index";
	}
	
	@RequestMapping(value="/updateUser", method=RequestMethod.POST)
	public @ResponseBody User updateUser(@RequestBody final User user){
		PersistenceService persistenceService = new PersistenceServiceImpl();
		
		persistenceService.update(user);
		
		return user;
		
	}
	
}
