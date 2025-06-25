package com.example.gathering.todo.dto;

import com.example.gathering.todo.domain.TodoStatus;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class TodoUpdateDto {
    private String title;
    private String description;
    private LocalDate dueDate;
    private TodoStatus status;
}
