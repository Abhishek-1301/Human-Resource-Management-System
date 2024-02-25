package com.example.demo.controller;
import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    @PostMapping("/trainndevelop")
    public void assign(@RequestParam int empId, @RequestParam String course, Model model){
        if(employeeRepository.check(empId)==0){
            model.addAttribute("msg","Employee id not found");
        }
        else {
            Employee employee=employeeRepository.getByEmpId(empId);
            employee.setCourse(course);
            employeeRepository.save(employee);
            model.addAttribute("success","Course assigned successfully");
        }
    }
}
