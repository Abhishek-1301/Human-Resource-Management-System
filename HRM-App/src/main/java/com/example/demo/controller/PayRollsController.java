package com.example.demo.controller;

import com.example.demo.model.Salary;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.SalaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.Month;

@Controller
public class PayRollsController {
    @GetMapping("/dashboard/payrolls")
    public String payrolls() {
        return "payrolls";
    }
    @Autowired
    private SalaryRepository salaryRepository;
    @Autowired
    private EmployeeRepository employeeRepository;
    @GetMapping("/payrolls")
    public void getSalary(@RequestParam int empId,@RequestParam String month,@RequestParam int year,Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee id not found");
        } else {
            LocalDate currentDate = LocalDate.now();
            int presentYear = currentDate.getYear();
            int presentMonth = currentDate.getMonthValue();
            Month m = Month.valueOf(month.toUpperCase());
            int monthNumber = m.getValue();
            if (year < presentYear || (year <= presentYear && monthNumber < presentMonth)) {
                Salary salary = salaryRepository.getSal(empId);
                model.addAttribute("salary", salary);
                model.addAttribute("empId", empId);
                model.addAttribute("month", month);
                model.addAttribute("year", year);
            } else {
                model.addAttribute("msg","Invalid Date");
            }
        }
    }
}
