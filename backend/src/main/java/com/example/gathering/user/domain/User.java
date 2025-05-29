package com.example.gathering.user.domain;

import com.example.gathering.communication.chat.domain.GroupChatRoom;
import com.example.gathering.project.domain.Project;
import com.example.gathering.todo.domain.Todo;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "users")
@Getter
@NoArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;

    private String email;

    private String profileImageUrl;

    private String phoneNumber;


    // 사용자가 만들거나 할당된 투두들을 매핑한다
    @OneToMany(mappedBy = "assignee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Todo> todos;

    // 사용자가 참여하는 프로젝트들을 다대다 관계로 매핑하자. users 테이블 안에 필드 또한 존재한다
    @ManyToMany(mappedBy = "members")
    private List<Project> projects;

    @ManyToMany(mappedBy = "members")
    private Set<GroupChatRoom> groupChatRooms = new HashSet<>();
}
