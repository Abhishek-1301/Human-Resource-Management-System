package com.example.demo.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Fresher;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface RecruitmentRepository extends JpaRepository<Fresher,Integer> {
    @Query(value = "SELECT * FROM fresher f WHERE f.job_title LIKE %:jobTitle% AND f.skills LIKE %:skills% AND f.education LIKE %:education% AND f.experience = :experience", nativeQuery = true)
    List<Fresher> queryAll(@Param("jobTitle") String jobTitle, @Param("skills") String skills,@Param("education") String education, @Param("experience") int experience);
}