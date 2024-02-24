package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name="fresher")
public class Fresher {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	@Column(name = "email")
	private String email;
	@Column(name = "job_title")
    private String jobTitle;
    private String skills;
    private String education;
    private int experience;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getSkills() {
		return skills;
	}
	public void setSkills(String skills) {
		this.skills = skills;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Fresher{" +
				"id=" + id +
				", email='" + email + '\'' +
				", jobTitle='" + jobTitle + '\'' +
				", skills='" + skills + '\'' +
				", education='" + education + '\'' +
				", experience=" + experience +
				'}';
	}
}