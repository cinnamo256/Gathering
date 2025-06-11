package com.example.gathering.user.service;

import com.example.gathering.user.domain.User;
import com.example.gathering.user.dto.UserCreateRequestDto;
import com.example.gathering.user.dto.UserResponseDto;
import com.example.gathering.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    // 새로운 사용자 생성 -> userdto에 맞게 body를 전달해야 함.
    public Long createUser(UserCreateRequestDto dto) {
        User user = new User();
        user.setUsername(dto.getUsername());
        user.setEmail(dto.getEmail());
        user.setProfileImageUrl(dto.getProfileImageUrl());
        user.setPhoneNumber(dto.getPhoneNumber());
        user.setPassword(dto.getPassword());

        return userRepository.save(user).getId();
    }

    // 사용자 전체 리스트 조회
    public List<UserResponseDto> getAllUsers() {
        return userRepository.findAll().stream()
                .map(user -> new UserResponseDto(
                        user.getId(),
                        user.getUsername(),
                        user.getEmail(),
                        user.getProfileImageUrl(),
                        user.getPhoneNumber()))
                .collect(Collectors.toList());
    }

    // 사용자를 id를 통해서 조회
    public UserResponseDto getUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 번호의 사용자를 찾을 수 없습니다. ID: " + id));

        return new UserResponseDto(
                user.getId(),
                user.getUsername(),
                user.getEmail(),
                user.getProfileImageUrl(),
                user.getPhoneNumber()
        );
    }
}
