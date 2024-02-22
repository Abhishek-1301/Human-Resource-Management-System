package com.example.demo.controller;

import com.example.demo.model.Credentials;
import com.example.demo.repository.RegisterRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collection;
import java.util.Map;

@Controller
public class DashboardController {
    @GetMapping("/dashboard")
    public String dashboard(){
        return "dashboard";
    }
    @Autowired
    private RegisterRepository repo;
    @PostMapping("/dashboard")
    public String validateUser(@RequestParam String username, @RequestParam String password,RedirectAttributes redirectAttributes){
        Credentials credentials=repo.findByUsername(username);
        if (credentials != null && credentials.getPassword().equals(password)) {
            return "/dashboard";
        }
        else {
            redirectAttributes.addFlashAttribute("errorMessage", "Incorrect Username/password. Please try again.");
            return "redirect:/";
        }
    }
    @GetMapping("/dashboard/attendance")
    public String attendance() {
        return "attendance";
    }
    @GetMapping("/dashboard/feedback")
    public String feedback() {
        return "feedback";
    }
    @GetMapping("/dashboard/payrolls")
    public String payrolls() {
        return "payrolls";
    }
    @GetMapping("/dashboard/performance")
    public String performance() {
        return "performance";
    }
    @GetMapping("/dashboard/trainingndevelopment")
    public String trainndevelop() {
        return "trainndevelop";
    }
    @GetMapping("/dashboard/selection")
    public String selection() {
        return "selection";
    }
    @GetMapping("/dashboard/register-employee")
    public String register() {
        return "registerEmployee";
    }
}
