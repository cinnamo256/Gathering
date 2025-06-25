package org.example.gdgprojectbackend.todo.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.gdgprojectbackend.project.dto.ProjectSimpleResponseDto;
import org.example.gdgprojectbackend.user.dto.UserResponseDto;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TodoResponseDto {
    private Long id;
    private String title;
    private String description;
    private LocalDate createDate;
    private LocalDate dueDate;
    private String status;
    private UserResponseDto assignee;
    private UserResponseDto createdBy;
    private ProjectSimpleResponseDto project;
}
