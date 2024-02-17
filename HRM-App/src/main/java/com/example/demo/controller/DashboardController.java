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
