package com.example.gathering.project.service;

import com.example.gathering.project.domain.Project;
import com.example.gathering.project.dto.ProjectCreateRequestDto;
import com.example.gathering.project.dto.ProjectDetailResponseDto;
import com.example.gathering.project.dto.ProjectSimpleResponseDto;
import com.example.gathering.project.repository.ProjectRepository;
import com.example.gathering.user.domain.User;
import com.example.gathering.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProjectService {

    private final ProjectRepository projectRepository;
    private final UserRepository userRepository;

    // 새로운 프로젝트 생성
    public Long createProject(ProjectCreateRequestDto dto) {
        User teamLeader = userRepository.findById(dto.getTeamLeaderId())
                .orElseThrow(() -> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));

        Project project = Project.builder()
                .name(dto.getName())
                .description(dto.getDescription())
                .startDate(dto.getStartDate())
                .endDate(dto.getEndDate())
                .status(dto.getStatus())
                .teamLeader(teamLeader)
                .build();

        project.getMembers().add(teamLeader); // 일단 프로젝트 생성한 팀장은 자동으로 팀원에 포함한다.
        return projectRepository.save(project).getId();
    }

    // 존재하는 모든 프로젝트들을 조회함.
    public List<ProjectSimpleResponseDto> getAllProjects() {
        List<Project> projects = projectRepository.findAll();

        return projects.stream()
                .map(ProjectSimpleResponseDto::from)
                .collect(Collectors.toList());
    }

    // 특정 유저의 프로젝트 모두 조회
    public List<ProjectSimpleResponseDto> getProjectsByUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("사용자를 찾을 수 없습니다."));

        List<Project> projects = projectRepository.findAllByMembersContains(user);

        return projects.stream()
                .map(ProjectSimpleResponseDto::from)
                .collect(Collectors.toList());
    }

    // 특정 프로젝트 하나만 조회
    public ProjectDetailResponseDto getProjectById(Long id) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 프로젝트를 찾을 수 없습니다."));

        return ProjectDetailResponseDto.from(project);
    }

}
