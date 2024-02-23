package com.example.demo.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.model.Fresher;
import com.example.demo.repository.RecruitmentRepository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RecruitmentController {
	 @GetMapping("/dashboard/recruitment")
	    public String recruitment() {
	        return "recruitment";
	    }
	@Autowired
	private RecruitmentRepository repository;
	 @GetMapping("/recruitment")
	public void candidateScreen(@RequestParam String job_title, @RequestParam String skills,
									 @RequestParam String education, @RequestParam int experience,RedirectAttributes redirectAttributes){
		 redirectAttributes.addFlashAttribute("msg","happy");
		 //return "redirect:/dashboard/recruitment";
	 }
}
