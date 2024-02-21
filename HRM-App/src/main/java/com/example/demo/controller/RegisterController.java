package com.example.demo.controller;

import com.example.demo.model.Credentials;
import com.example.demo.repository.RegisterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class RegisterController {
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    @Autowired
    private RegisterRepository r;
    @PostMapping("/")
    public String createUser(@RequestParam String username,@RequestParam String password,@RequestParam String cpassword){
        Credentials c=new Credentials();
        c.setUsername(username);
        c.setPassword(password);
        c.setCpassword(cpassword);
        if(c.getPassword().equals(c.getCpassword())){
            r.save(c);
            return "index";
        }
        return "register";
    }
}
