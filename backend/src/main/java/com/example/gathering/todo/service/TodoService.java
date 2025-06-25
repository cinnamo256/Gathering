package com.example.gathering.todo.service;

import com.example.gathering.project.domain.Project;
import com.example.gathering.project.repository.ProjectRepository;
import com.example.gathering.todo.domain.Todo;
import com.example.gathering.todo.domain.TodoStatus;
import com.example.gathering.todo.dto.TodoRequestDto;
import com.example.gathering.todo.dto.TodoResponseDto;
import com.example.gathering.todo.dto.TodoUpdateDto;
import com.example.gathering.todo.repository.TodoRepository;
import com.example.gathering.user.domain.User;
import com.example.gathering.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TodoService {

    private final TodoRepository todoRepository;
    private final UserRepository userRepository;
    private final ProjectRepository projectRepository;

    public TodoResponseDto createTodo(TodoRequestDto dto) {
        User assignee = userRepository.findById(dto.getAssigneeId()).orElseThrow();
        User createdBy = userRepository.findById(dto.getCreatedById()).orElseThrow();
        Project project = projectRepository.findById(dto.getProjectId()).orElseThrow();

        Todo todo = new Todo();
        todo.setTitle(dto.getTitle());
        todo.setDescription(dto.getDescription());
        todo.setCreateDate(dto.getCreateDate());
        todo.setDueDate(dto.getDueDate());
        todo.setStatus(dto.getStatus());
        todo.setAssignee(assignee);
        todo.setCreatedBy(createdBy);
        todo.setProject(project);

        return todoRepository.save(todo).toDto();
    }

    public TodoResponseDto getTodo(Long id) {
        return todoRepository.findById(id).orElseThrow().toDto();
    }

    public List<TodoResponseDto> getTodosByProject(Long projectId) {
        return todoRepository.findByProjectId(projectId).stream()
                .map(Todo::toDto)
                .collect(Collectors.toList());
    }

    public TodoResponseDto updateTodo(Long id, TodoUpdateDto dto) {
        Todo todo = todoRepository.findById(id).orElseThrow();
        todo.setTitle(dto.getTitle());
        todo.setDescription(dto.getDescription());
        todo.setDueDate(dto.getDueDate());
        todo.setStatus(dto.getStatus());
        return todoRepository.save(todo).toDto();
    }

    public void deleteTodo(Long id) {
        todoRepository.deleteById(id);
    }

    public TodoResponseDto checkTodo(Long id, TodoStatus status) {
        Todo todo = todoRepository.findById(id).orElseThrow();
        todo.setStatus(status);
        return todoRepository.save(todo).toDto();
    }

    public TodoResponseDto approveTodo(Long id, TodoStatus status) {
        Todo todo = todoRepository.findById(id).orElseThrow();
        todo.setStatus(status);
        return todoRepository.save(todo).toDto();
    }

    public TodoResponseDto assignTodo(Long id, Long assigneeId) {
        Todo todo = todoRepository.findById(id).orElseThrow();
        User newAssignee = userRepository.findById(assigneeId).orElseThrow();
        todo.setAssignee(newAssignee);
        return todoRepository.save(todo).toDto();
    }
}
