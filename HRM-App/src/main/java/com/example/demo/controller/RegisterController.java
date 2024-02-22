package com.example.demo.controller;

import com.example.demo.model.Credentials;
import com.example.demo.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

public class RegisterController {
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @Autowired
    private RegisterRepository repo;
    @PostMapping("/")
    public String createUser(@RequestParam String username, @RequestParam String password, @RequestParam String cpassword, RedirectAttributes redirectAttributes){
        Credentials c=new Credentials();
        c.setUsername(username);
        c.setPassword(password);
        c.setCpassword(cpassword);
        if (repo.findByUsername(username)!=null){
            redirectAttributes.addFlashAttribute("error1","Username already exist");
            return "redirect:/register";
        }
        else if(c.getPassword().equals(c.getCpassword())){
            repo.save(c);
            redirectAttributes.addFlashAttribute("success","User added successfully");
            return "redirect:/";
        }
        else{
            redirectAttributes.addFlashAttribute("error2","Passwords do not match");
            return "redirect:/register";
        }
    }
}
