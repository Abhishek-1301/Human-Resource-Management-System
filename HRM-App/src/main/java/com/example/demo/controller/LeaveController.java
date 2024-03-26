package com.example.demo.controller;
import com.example.demo.model.Employee;
import com.example.demo.model.Leave;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.LeaveRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
public class LeaveController {
    @GetMapping("/employee/leave")
    public String employeeLeave(){
        return "employeeLeave";
    }
    @Autowired
    private EmployeeRepository employeeRepository;
    @Autowired
    private LeaveRepository leaveRepository;
    @PostMapping("/employeeLeave")
    public void leave(@RequestParam("date") String date, @RequestParam("reason") String reason, HttpSession httpSession, Model model){
        int empId= (int) httpSession.getAttribute("empId");
        Employee employee = employeeRepository.getByEmpId(empId);
        LocalDate d = (date != null && !date.isEmpty()) ? LocalDate.parse(date) : LocalDate.ofEpochDay(0);
        if(validateDate(d)){
            Leave l=new Leave();
            l.setDate(d);
            l.setReason(reason);
            l.setEmployee(employee);
            leaveRepository.save(l);
            model.addAttribute("success","Requested successfully");
        }
        else{
            model.addAttribute("msg","Invalid date");
        }
    }
    @ModelAttribute("history")
    public List<Leave> getHistory(HttpSession httpSession){
        int empId= (int) httpSession.getAttribute("empId");
        List<Leave> history=leaveRepository.queryByApproved(empId);
        return history;
    }
    public static boolean validateDate(LocalDate date){
        LocalDate currentDate = LocalDate.now();
        int presentYear = currentDate.getYear();
        int presentMonth = currentDate.getMonthValue();
        int presentDay = currentDate.getDayOfMonth();
        int year = date.getYear();
        int month = date.getMonthValue();
        int day = date.getDayOfMonth();
        if(year < presentYear) return false;
        if(year == presentYear && month < presentMonth) return false;
        if((year == presentYear) && (month == presentMonth) && (day <= presentDay)) {
            return false;
        }
        return true;
    }
}
