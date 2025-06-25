package com.example.gathering.project.dto;

import com.example.gathering.project.domain.ProjectStatus;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class ProjectCreateRequestDto {
    private String name;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private ProjectStatus status;
    private Long teamLeaderId; // 유저 ID -> 일단 생성되면, teamLeader로 기본적으로 지정
}

