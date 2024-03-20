package com.example.demo.controller;
import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FeedbackController {
    @GetMapping("/dashboard/feedback")
    public String feedback() {
        return "feedback";
    }
    @Autowired
    private JavaMailSender mailSender;
    @Autowired
    private EmployeeRepository employeeRepository;
    @GetMapping("/feedback")
    public void sendEmail(@RequestParam(name = "empId") Integer empId, @RequestParam(name = "body") String body, Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee id not found");
        }
        else {
            Employee employee = employeeRepository.getByEmpId(empId);
            String email=employee.getEmail();
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("abishek13012003@gmail.com");
            message.setTo(email);
            message.setText(body);
            message.setSubject("Feedback");
            mailSender.send(message);
            model.addAttribute("success","Feedback sent");
        }
    }
}
