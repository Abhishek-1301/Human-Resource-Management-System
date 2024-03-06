package com.example.demo.controller;

import com.example.demo.model.Credentials;
import com.example.demo.repository.CredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller

public class RegisterController {
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @Autowired
    private CredentialsRepository repo;
    @PostMapping("/")
    public String createUser(@ModelAttribute Credentials credentials, RedirectAttributes redirectAttributes){
        if (repo.findByUsername(credentials.getUsername())!=null){
            redirectAttributes.addFlashAttribute("error1","Username already exist");
        }
        else if(credentials.getPassword().equals(credentials.getCpassword())){
            repo.save(credentials);
            redirectAttributes.addFlashAttribute("success","User added successfully");
        }
        else{
            redirectAttributes.addFlashAttribute("error2","Passwords do not match");
        }
        return "redirect:/register";
    }
}
