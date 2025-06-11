package com.example.gathering.user.dto;

import lombok.Getter;

@Getter
public class UserCreateRequestDto {
    private String username;
    private String email;
    private String profileImageUrl;
    private String phoneNumber;
    private String password;
}
