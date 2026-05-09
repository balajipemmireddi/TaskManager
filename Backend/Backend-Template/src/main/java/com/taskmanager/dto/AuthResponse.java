package com.taskmanager.auth.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthResponse {

    private String token;
    private String type = "Bearer";
    private String role;
    private Long userId;
    private String name;

    public AuthResponse(String token, String role, Long userId, String name) {
        this.token = token;
        this.type = "Bearer";
        this.role = role;
        this.userId = userId;
        this.name = name;
    }
}
