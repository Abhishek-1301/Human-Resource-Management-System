package com.example.demo.controller;

import com.example.demo.model.Leave;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.LeaveRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class HrLeaveController {
    @GetMapping("/hr/leave")
    public String hrLeave(){
        return "hrLeave";
    }
    @Autowired
    private LeaveRepository leaveRepository;
    @ModelAttribute("d")
    public List<Leave> addLeavesToModel() {
        return leaveRepository.queryAll();
    }
    @GetMapping("/hrLeave")
    public String updateLeave(@RequestParam("action") String action, @RequestParam("id") int id, Model model){
        Leave l=leaveRepository.getById(id);
        if(action.equals("accept")){
            l.setApproved(1);
            leaveRepository.save(l);
            model.addAttribute("accept","Leave Accepted");
        }
        if(action.equals("decline")){
            l.setApproved(2);
            leaveRepository.save(l);
            model.addAttribute("decline","Leave Declined");
        }
        return "redirect:/hr/leave";
    }
    @Autowired
    private EmployeeRepository employeeRepository;
    @PostMapping("/hrLeave")
    public void getHistory(@RequestParam(value = "empId") Integer empId, Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee not found");
        }
        model.addAttribute("empId",empId);
        List<Leave> history=leaveRepository.queryByApproved(empId);
        model.addAttribute("history",history);
    }
}
