package com.example.demo.repository;

import com.example.demo.model.Leave;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LeaveRepository extends JpaRepository<Leave,Integer> {
    Leave getById(int id);
    @Query(value = "select * from leaves l where l.approved = 0",nativeQuery = true)
    List<Leave> queryAll();
    @Query(value = "select * from leaves l where l.approved = 1 && l.emp_id=?1",nativeQuery = true)
    List<Leave> queryByApproved(Integer empId);
}
