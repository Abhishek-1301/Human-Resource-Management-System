package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name="salary")
public class Salary {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "job_role")
    private String jobRole;
    @Column(name = "basic_salary")
    private int basicSalary;
    private int hra;
    private int bonus;
    private int allowances;
    private int deductions;
    @Transient
    private int netSalary;

    public int getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(int basicSalary) {
        this.basicSalary = basicSalary;
    }

    public int getHra() {
        return hra;
    }

    public void setHra(int hra) {
        this.hra = hra;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }

    public int getAllowances() {
        return allowances;
    }

    public void setAllowances(int allowances) {
        this.allowances = allowances;
    }

    public int getDeductions() {
        return deductions;
    }

    public void setDeductions(int deductions) {
        this.deductions = deductions;
    }
    public void calculateNetSalary(){
        this.netSalary = this.basicSalary + this.hra + this.bonus + this.allowances - this.deductions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getJobRole() {
        return jobRole;
    }

    public void setJobRole(String jobRole) {
        this.jobRole = jobRole;
    }
}
