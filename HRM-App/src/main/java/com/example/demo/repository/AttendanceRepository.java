package com.example.demo.repository;

import com.example.demo.model.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface AttendanceRepository extends JpaRepository<Attendance,Integer> {
    @Query(value = "SELECT * FROM attendance WHERE att_date=?1 and emp_id=?2 and present = true",nativeQuery = true)
    int present(String date,int empId);
    @Query(value = "SELECT COUNT(*) FROM attendance WHERE emp_id=?3 and att_date BETWEEN ?1 AND ?2 AND present = true",nativeQuery = true)
    int between(LocalDate date1,LocalDate date2,int empId);
    @Query(value = "SELECT COUNT(*) FROM attendance WHERE emp_id=?3 and att_date BETWEEN ?1 AND ?2",nativeQuery = true)
    int count(LocalDate date1,LocalDate date2,int empId);
    @Query(value = "SELECT COUNT(*) FROM attendance WHERE present = true and emp_id=?1",nativeQuery = true)
    int overall(int empId);
    @Query(value = "SELECT COUNT(*) FROM attendance where emp_id=?1",nativeQuery = true)
    int length(int empId);

}
