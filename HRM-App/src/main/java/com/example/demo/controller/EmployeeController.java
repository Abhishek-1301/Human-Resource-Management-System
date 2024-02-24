package com.example.demo.controller;

import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
