package com.example.demo.repository;

import com.example.demo.model.Credentials;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisterRepository extends JpaRepository<Credentials,String> {
}
