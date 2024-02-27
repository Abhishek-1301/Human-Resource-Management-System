package com.example.demo.controller;

import com.example.demo.model.Score;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PerformanceController {
    @GetMapping("/dashboard/performance")
    public String performance() {
        return "performance";
    }
    @Autowired
    private ScoreRepository scoreRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @GetMapping("/performance")
    public void report(@RequestParam int empId, Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee not found");
        }
        else {
            List<Score> dataList=scoreRepository.getScores(empId);
            model.addAttribute("empId",empId);
            model.addAttribute("dataList",dataList);
        }
    }
}
