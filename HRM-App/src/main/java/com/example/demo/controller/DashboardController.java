package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    @GetMapping("/hr/dashboard")
    public String hrDashboard(){
        return "dashboard";
    }
    @GetMapping("/employee/dashboard")
    public String employeeDashboard(){
        return "employeeDashboard";
    }

}
