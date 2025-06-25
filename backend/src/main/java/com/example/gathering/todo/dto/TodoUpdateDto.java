package org.example.gdgprojectbackend.todo.dto;

import lombok.Getter;
import lombok.Setter;
import org.example.gdgprojectbackend.todo.domain.TodoStatus;

import java.time.LocalDate;

@Getter
@Setter
public class TodoUpdateDto {
    private String title;
    private String description;
    private LocalDate dueDate;
    private TodoStatus status;
}
