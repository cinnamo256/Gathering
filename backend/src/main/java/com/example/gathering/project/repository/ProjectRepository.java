package com.example.gathering.project.repository;

import com.example.gathering.project.domain.Project;
import com.example.gathering.user.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjectRepository extends JpaRepository<Project, Long> {
    List<Project> findAllByMembersContains(User user);
    List<Project> findAll();
}
