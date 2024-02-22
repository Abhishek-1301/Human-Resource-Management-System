package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.model.Fresher;
import com.example.demo.repository.RecuritmentRepository;
@Controller
public class RecuritmentController {
	 @GetMapping("/dashboard/recruitment")
	    public String recruitment() {
		 
	        return "recruitment";
	    }
	 @Autowired
	    private RecuritmentRepository recuritmentRepository;

	    @GetMapping("/recruitment")
	    @ResponseBody // Add this annotation to indicate that the return value should be sent as the response body
	    public List<Fresher> getAllFreshers() {
	        return recuritmentRepository.findAll();
	    }

	    

}
