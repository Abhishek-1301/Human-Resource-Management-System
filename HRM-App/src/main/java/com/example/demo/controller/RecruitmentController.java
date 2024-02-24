package com.example.demo.controller;
import java.util.List;

import com.example.demo.model.Interview;
import com.example.demo.repository.InterviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.Fresher;
import com.example.demo.repository.RecruitmentRepository;

@Controller
public class RecruitmentController {
	 @GetMapping("/dashboard/recruitment")
	 public String recruitment() {
	        return "recruitment";
	    }
	@Autowired
	private RecruitmentRepository repository;
	 @GetMapping("/recruitment")
	public void candidateScreen(@RequestParam String job_title,
								@RequestParam String skills,
								@RequestParam String education,
								@RequestParam int experience,
								Model model){
		 List<Fresher> dataList=repository.queryAll(job_title,skills,education,experience);
		 model.addAttribute("dataList",dataList);
	 }
	 @Autowired
	 private InterviewRepository interviewRepository;
	 @PostMapping("/schedule")
	public String schedule(@ModelAttribute Interview interview){
		 interviewRepository.save(interview);
		 return "dashboard";
	 }
}
