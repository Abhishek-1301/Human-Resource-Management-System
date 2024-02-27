package com.example.demo.controller;
import com.example.demo.model.Employee;
import com.example.demo.model.Score;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class EmployeeController {
    @GetMapping("/dashboard/registeremployee")
    public String register() {
        return "registerEmployee";
    }
    @Autowired
    private EmployeeRepository employeeRepository;
    @PostMapping("/registerEmp")
    public String saveEmployee(@ModelAttribute Employee employee,
                               RedirectAttributes redirectAttributes){
        employeeRepository.save(employee);
        redirectAttributes.addFlashAttribute("msg","Employee Registered Successfully");
        return "redirect:/dashboard/registeremployee";
    }
}
