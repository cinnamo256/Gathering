package org.example.gdgprojectbackend.todo.dto;

import lombok.Getter;
import lombok.Setter;
import org.example.gdgprojectbackend.todo.domain.TodoStatus;

import java.time.LocalDate;

@Getter
@Setter
public class TodoRequestDto {
    private String title;
    private String description;
    private LocalDate createDate;
    private LocalDate dueDate;
    private TodoStatus status;
    private Long assigneeId;
    private Long createdById;
    private Long projectId;
}
