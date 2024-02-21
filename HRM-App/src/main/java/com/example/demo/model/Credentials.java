package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name="credentials")
public class Credentials {
    @Id
    private String user_name;
    @Column(name = "pass")
    private String password;
    @Transient
    private String cpassword;

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }
}