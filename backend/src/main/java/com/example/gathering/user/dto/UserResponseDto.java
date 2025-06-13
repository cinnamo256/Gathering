package com.example.gathering.user.dto;

import lombok.Getter;

@Getter
public class UserResponseDto {
    private Long id;
    private String username;
    private String email;
    private String profileImageUrl;
    private String phoneNumber;

    // 👇 생성자 추가!
    public UserResponseDto(Long id, String username, String email, String profileImageUrl, String phoneNumber) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.profileImageUrl = profileImageUrl;
        this.phoneNumber = phoneNumber;
    }
}
