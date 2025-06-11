package com.example.gathering.project.dto;

import com.example.gathering.project.domain.Project;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDate;

@Getter
@AllArgsConstructor
public class ProjectDetailResponseDto {
    private Long id;
    private String name;
    private String description;
    private LocalDate startDate;
    private LocalDate endDate;
    private String status;
    private String teamLeaderName;

    public static ProjectDetailResponseDto from(Project project) {
        return new ProjectDetailResponseDto(
                project.getId(),
                project.getName(),
                project.getDescription(),
                project.getStartDate(),
                project.getEndDate(),
                project.getStatus().name(),
                project.getTeamLeader().getUsername()
        );
    }
}
