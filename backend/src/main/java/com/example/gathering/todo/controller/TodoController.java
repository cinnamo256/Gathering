package org.example.gdgprojectbackend.todo.controller;

import lombok.RequiredArgsConstructor;
import org.example.gdgprojectbackend.todo.domain.TodoStatus;
import org.example.gdgprojectbackend.todo.dto.TodoAssignDto;
import org.example.gdgprojectbackend.todo.dto.TodoRequestDto;
import org.example.gdgprojectbackend.todo.dto.TodoResponseDto;
import org.example.gdgprojectbackend.todo.dto.TodoUpdateDto;
import org.example.gdgprojectbackend.todo.service.TodoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/todo")
@RequiredArgsConstructor
public class TodoController {

    private final TodoService todoService;

    @PostMapping
    public ResponseEntity<TodoResponseDto> createTodo(@RequestBody TodoRequestDto dto) {
        return ResponseEntity.ok(todoService.createTodo(dto));
    }

    @GetMapping("/{id}")
    public ResponseEntity<TodoResponseDto> getTodo(@PathVariable Long id) {
        return ResponseEntity.ok(todoService.getTodo(id));
    }

    @GetMapping("/project/{projectId}")
    public ResponseEntity<List<TodoResponseDto>> getTodosByProject(@PathVariable Long projectId) {
        return ResponseEntity.ok(todoService.getTodosByProject(projectId));
    }

    @PatchMapping("/{id}")
    public ResponseEntity<TodoResponseDto> updateTodo(@PathVariable Long id, @RequestBody TodoUpdateDto dto) {
        return ResponseEntity.ok(todoService.updateTodo(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTodo(@PathVariable Long id) {
        todoService.deleteTodo(id);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{id}/check")
    public ResponseEntity<TodoResponseDto> checkTodo(@PathVariable Long id, @RequestBody Map<String, String> body) {
        TodoStatus status = TodoStatus.valueOf(body.get("status"));
        return ResponseEntity.ok(todoService.checkTodo(id, status));
    }

    @PostMapping("/{id}/approve")
    public ResponseEntity<TodoResponseDto> approveTodo(@PathVariable Long id, @RequestBody Map<String, String> body) {
        TodoStatus status = TodoStatus.valueOf(body.get("status"));
        return ResponseEntity.ok(todoService.approveTodo(id, status));
    }

    @PostMapping("/{id}/assign")
    public ResponseEntity<TodoResponseDto> assignTodo(@PathVariable Long id, @RequestBody TodoAssignDto dto) {
        return ResponseEntity.ok(todoService.assignTodo(id, dto.getAssigneeId()));
    }
}
