package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashboardController {
    @GetMapping("/dashboard")
    public String dashboard() {
        return "dashboard";
    }
    @GetMapping("/dashboard/attendance")
    public String attendance() {
        return "attendance";
    }
    @GetMapping("/dashboard/recruitment")
    public String recruitment() {
        return "recruitment";
    }
}
