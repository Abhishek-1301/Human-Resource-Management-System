package com.example.demo.repository;

import com.example.demo.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository extends JpaRepository<Employee,Integer> {
    @Query(value = "select count(*) from employee where emp_id=?1",nativeQuery = true)
    int check(int empId);
    Employee getByEmpId(int empId);
}