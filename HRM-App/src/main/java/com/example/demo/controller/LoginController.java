package com.example.demo.controller;
import com.example.demo.model.Credentials;
import com.example.demo.model.Employee;
import com.example.demo.repository.EmployeeRepository;
import com.example.demo.repository.CredentialsRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class LoginController {

	@GetMapping("/")
	public String home() {
		return "index";
	}
	@Autowired
	private CredentialsRepository credentialsRepository;
	private String role;
	@PostMapping("/hr/dashboard")
	public String hr(@RequestParam String username, @RequestParam String password, RedirectAttributes redirectAttributes, HttpSession httpSession){
		Credentials credentials=credentialsRepository.findByUsername(username);
		if (credentials != null && credentials.getPassword().equals(password)) {
			httpSession.setAttribute("role","hr");
			return "redirect:/hr/dashboard";
		}
		else {
			redirectAttributes.addFlashAttribute("msg1", "Invalid Username or password");
			return "redirect:/";
		}
	}
	@Autowired
	private EmployeeRepository employeeRepository;
	@PostMapping("/employee/dashboard")
	public String employee(@RequestParam int empId, @RequestParam String password, RedirectAttributes redirectAttributes,HttpSession httpSession){
		Employee employee=employeeRepository.getByEmpId(empId);
		if (employee != null && employee.getPassword().equals(password)) {
			httpSession.setAttribute("role","employee");
			httpSession.setAttribute("empId",empId);
			return "redirect:/employee/dashboard";
		}
		else {
			redirectAttributes.addFlashAttribute("msg2", "Invalid Emp Id or password");
			return "redirect:/";
		}
	}
}
