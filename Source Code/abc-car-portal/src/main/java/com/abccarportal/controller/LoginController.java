package com.abccarportal.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abccarportal.model.Car;
import com.abccarportal.model.CarBidding;
import com.abccarportal.model.User;
import com.abccarportal.security.UserDetailsServiceImpl;
import com.abccarportal.service.CarService;
import com.abccarportal.service.UserService;




@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CarService carService;
	
    @GetMapping("login")
    public String onLogin() {
        return "login";
    }


    @GetMapping("login_error")
    public String onLoginError(Model model) {
        String error_msg = "Incorrect username or password. Try Again.";
        model.addAttribute("error_string", error_msg);
        return "login";
    }
    
    @GetMapping("register_user")
    public String showRegistrationForm(@ModelAttribute("user") User user) {
    	
    	
    	return "Register";
    }
    
    @PostMapping("register")
    public String registerNewUser(@ModelAttribute("user") User user, Model model) {
    	
    	userService.save(user);
    	
    	String success_register = "Registeration Successful! ";
    	model.addAttribute("success_register", success_register);
    	
    	return "Register";
    }
    
    @GetMapping("profile")
    public String showProfile(Model model, Principal principal) {
    	
    	//Get User name
    	String uname = principal.getName();
    	System.out.println(uname);
    	
    	User userdata = userService.findLoginUser(uname);
    	
    	long uid = userdata.getId();
    	
    	List<User> user = new ArrayList<User>();
    	
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	//Get user bidding or booking or both
    	List<CarBidding> bids = carService.getUserBids(userdata);
    	System.out.println(bids);
    	
    	model.addAttribute("bids", bids);
    	
    	return "profile";
    }
    
    @PostMapping("update")
    public String updateUser(Principal principal, 
    		@ModelAttribute("user") User u) {
    	
    	//Get User name
    	String username = principal.getName();
    	
    	User user = userService.findLoginUser(username);
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setAddress(u.getAddress());
    	
    	userService.update(user);
    	System.out.println("Update User Successful");
    	System.out.println(user);
    	
    	return "redirect:profile";
    }
    
    @GetMapping("users")
    public ModelAndView showAllUser() {
    	
    	List<User> user = userService.showAllUser();
    	
    	return new ModelAndView ("allUser", "user", user);
    }
    
    @GetMapping("view")
    public String userProfile(@RequestParam long uid, Model model) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User userdata = user_info.get();
    	
    	List<User> user = new ArrayList<User>();
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	return "profile";	
    }
    
    @GetMapping("delete")
    public String deleteUser(@RequestParam long uid) {
    	
    	userService.deleteUser(uid);
    	
    	return "redirect:users";
    }
    
    @PostMapping("edit")
    public String editUser(@RequestParam long uid,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    	
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
    	user.setAddress(u.getAddress());
    	
    	userService.update(user);
    	System.out.println("Edit User Successful");
    	System.out.println(user);
    	
    	return "redirect:users";
    }
    
    @PostMapping("assign_role")
    public String assignRole(@RequestParam long uid,
    		@RequestParam("name") String role,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    
    	userService.assignNewRole(user, role);
    	System.out.println(user);
    	 return "redirect:users";
    }
    
    @GetMapping("about_us")
    public String showAboutUsPage() {
    	
    	return "aboutUs";
    }
   
    @GetMapping("contact_us")
    public String showContactUsPage() {
    	
    	return "contactUs";
    }
    
}
