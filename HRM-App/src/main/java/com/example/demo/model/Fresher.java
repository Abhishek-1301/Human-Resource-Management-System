package com.example.demo.model;

import jakarta.persistence.*;

@Entity
@Table(name="fresher")

public class Fresher {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	@Column(name = "cname")
	private String name;
    private String jobTitle;
    private String skills;
    private String education;
    private int experience;
	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Fresher{" +
				"id=" + id +
				", name='" + name + '\'' +
				", jobTitle='" + jobTitle + '\'' +
				", skills='" + skills + '\'' +
				", education='" + education + '\'' +
				", experience=" + experience +
				'}';
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


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
