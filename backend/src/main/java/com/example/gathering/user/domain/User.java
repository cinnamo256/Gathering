package com.example.gathering.user.domain;

import com.example.gathering.communication.chat.domain.GroupChatRoom;
import com.example.gathering.project.domain.Project;
import com.example.gathering.todo.domain.Todo;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user")
@Getter
@Setter
@NoArgsConstructor
public class User {
    // 기본키는 가입할 때 발급된 id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String username; // username을 아이디로 쓴다고 가정 -> 유니크값을 가짐.

    private String password;

    @Column(unique = true, nullable = false)
    private String email;            // 중복 방지 처리 !! -> Post요청 시 email은 다르게 작성해서 요청해야 함

    private String profileImageUrl;
    private String phoneNumber;


    // 1. 사용자가 맡은 Todo
    @OneToMany(mappedBy = "assignee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Todo> assignedTodos;

    // 2. 사용자가 참여 중인 Project (N:M)
    @ManyToMany(mappedBy = "members")
    private List<Project> projects;

    // 3. 사용자가 참여하는 그룹 채팅방 (N:M)
    @ManyToMany(mappedBy = "members")
    private Set<GroupChatRoom> groupChatRooms = new HashSet<>();
}

