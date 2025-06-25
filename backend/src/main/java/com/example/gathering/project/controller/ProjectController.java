package com.example.gathering.project.controller;

import com.example.gathering.project.dto.ProjectCreateRequestDto;
import com.example.gathering.project.dto.ProjectDetailResponseDto;
import com.example.gathering.project.dto.ProjectSimpleResponseDto;
import com.example.gathering.project.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/projects")
@RequiredArgsConstructor
public class ProjectController {

    private final ProjectService projectService;

    // H2 인메모리가 아닌 파일 기반으로 하면 -> jdbc:h2:file:./data/gathering-db 해당 JDBC URL로 접근해야 함.
    // 새로운 프로젝트를 생성하는 엔드포인트
    @PostMapping
    public ResponseEntity<Long> createProject(@RequestBody ProjectCreateRequestDto dto) {
        Long projectId = projectService.createProject(dto);
        return ResponseEntity.ok(projectId);
    }

    // 존재하는 모든 프로젝트 조회
    @GetMapping
    public ResponseEntity<List<ProjectSimpleResponseDto>> getAllProjects() {
        return ResponseEntity.ok(projectService.getAllProjects());
    }

    // 특정 유저의 프로젝트들을 모두 조회
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<ProjectSimpleResponseDto>> getProjectsByUser(@PathVariable Long userId) {
        return ResponseEntity.ok(projectService.getProjectsByUser(userId));
    }

    // 특정 프로젝트 하나를 조회하도록 함.
    @GetMapping("/{projectId}")
    public ResponseEntity<ProjectDetailResponseDto> getProjectById(@PathVariable Long projectId) {
        return ResponseEntity.ok(projectService.getProjectById(projectId));
    }

}
