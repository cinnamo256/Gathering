package com.example.gathering.todo.dto;

import com.example.gathering.todo.domain.TodoStatus;
import lombok.Getter;
import lombok.Setter;

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
