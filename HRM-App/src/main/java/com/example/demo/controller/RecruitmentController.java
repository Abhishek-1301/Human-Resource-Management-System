package com.example.demo.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.Fresher;
import com.example.demo.repository.RecruitmentRepository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RecruitmentController {
	 @GetMapping("/dashboard/recruitment")
	    public String recruitment() {
	        return "recruitment";
	    }
	 @Autowired
	 private RecruitmentRepository recruitmentRepository;
	@GetMapping("/recruitment")
	@ResponseBody
	public List<Fresher> getAllFreshers(@RequestParam String job_title) {
		return recruitmentRepository.findAll(job_title);
	}
}
