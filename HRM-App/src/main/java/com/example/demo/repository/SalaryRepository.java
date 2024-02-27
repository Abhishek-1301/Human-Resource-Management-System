package com.example.demo.repository;

import com.example.demo.model.Salary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
@Repository
public interface SalaryRepository extends JpaRepository<Salary,Integer> {
    @Query(value = "select * from salary s where s.emp_id=?1 and s.sal_month=?2 and s.sal_year=?3",nativeQuery = true)
    Salary getSal(int empId,String month,int year);
}
