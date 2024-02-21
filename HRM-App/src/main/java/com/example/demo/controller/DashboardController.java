package com.example.demo.controller;

import com.example.demo.model.Credentials;
import com.example.demo.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashboardController {
    @GetMapping("/dashboard")
    public String dashboard(){
        return "dashboard";
    }
    @Autowired
    private RegisterRepository r;
    @PostMapping("/dashboard")
    public String validateUser(@RequestParam String username, @RequestParam String password){
        Credentials c=r.findByUsername(username);
        if (c != null && c.getPassword().equals(password)) {
            return "dashboard";
        }
        else {
            return "index";
        }
    }
    @GetMapping("/dashboard/attendance")
    public String attendance() {
        return "attendance";
    }
    @GetMapping("/dashboard/recruitment")
    public String recruitment() {
        return "recruitment";
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
}
