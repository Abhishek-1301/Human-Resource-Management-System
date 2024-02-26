package com.example.demo.repository;

import com.example.demo.model.Score;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ScoreRepository extends JpaRepository<Score,Integer> {
    @Query(value = "select * from scores s where s.emp_id=?1",nativeQuery = true)
    List<Score> getScores(int empId);
}
