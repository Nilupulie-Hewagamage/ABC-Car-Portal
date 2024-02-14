package com.abccarportal.controller;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

public class MvcConfig implements WebMvcConfigurer{
	
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        Path carUploadDir = Paths.get("./car-photo");
	        String carUploadPath = carUploadDir.toFile().getAbsolutePath();
	        
	        registry.addResourceHandler("/car-photo/**").addResourceLocations("file:/"+ carUploadPath + "/");
	    }

}
