package com.example.demo.repository;

import com.example.demo.model.Salary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface SalaryRepository extends JpaRepository<Salary,Integer> {
    @Query(value = "select * from salary s join employee e " +
            "on s.job_role=e.designation where e.emp_id=?1",nativeQuery = true)
    Salary getSal(int empId);
}
