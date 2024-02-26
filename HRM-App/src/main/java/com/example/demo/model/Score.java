package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name = "scores")
public class Score {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int sid;
    private int score;
    @ManyToOne
    @JoinColumn(name = "emp_id",nullable = false)
    private Employee employee;

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "Score{" +
                "sid=" + sid +
                ", score=" + score +
                ", employee=" + employee +
                '}';
    }
}
