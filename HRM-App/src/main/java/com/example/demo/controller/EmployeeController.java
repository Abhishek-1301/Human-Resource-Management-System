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
    @Autowired
    private ScoreRepository scoreRepository;
    @GetMapping("/performance")
    public void report(@RequestParam int empId,Model model){
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
