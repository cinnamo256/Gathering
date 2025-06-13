package com.example.gathering.user.controller;

import com.example.gathering.user.dto.UserCreateRequestDto;
import com.example.gathering.user.dto.UserResponseDto;
import com.example.gathering.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    // 새로운 사용자를 생성함 (Post)
    @PostMapping
    public ResponseEntity<Long> createUser(@RequestBody UserCreateRequestDto dto) {
        Long userId = userService.createUser(dto);
        return ResponseEntity.ok(userId);
    }

    // 존재하는 전체 사용자를 조회함
    @GetMapping
    public ResponseEntity<List<UserResponseDto>> getAllUsers() {
        return ResponseEntity.ok(userService.getAllUsers());
    }

    // 가입할 때 발급된 id로 조회.
    @GetMapping("/{id}")
    public ResponseEntity<UserResponseDto> getUserById(@PathVariable("id") Long id) {
        return ResponseEntity.ok(userService.getUserById(id));
    }
}
