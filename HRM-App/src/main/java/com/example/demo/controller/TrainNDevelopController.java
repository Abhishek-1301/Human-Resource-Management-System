package com.example.demo.controller;

import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import jakarta.persistence.Entity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TrainNDevelopController {
    @GetMapping("/dashboard/trainingndevelopment")
    public String trainndevelop() {
        return "trainndevelop";
    }
    @GetMapping("/dashboard/training")
    public String training() {
        return "training";
    }
    @Autowired
    private EmployeeRepository employeeRepository;
    @PostMapping("/trainndevelop")
    public void assign(@RequestParam int empId, @RequestParam String course, Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee not found");
        }
        else {
            Employee employee=employeeRepository.getByEmpId(empId);
            employee.setCourse(course);
            employeeRepository.save(employee);
            model.addAttribute("success","Course assigned successfully");
        }
    }
}
