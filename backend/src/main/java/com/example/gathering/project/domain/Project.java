package com.example.gathering.project.domain;

import com.example.gathering.user.domain.User;
import com.example.gathering.todo.domain.Todo;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "projects")
@Getter
@NoArgsConstructor
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String description;

    private LocalDate startDate;

    private LocalDate endDate;

    @Enumerated(EnumType.STRING)
    private ProjectStatus status;

    // 다수의 프로젝트 → 오직 하나의 팀장
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "team_leader_id")
    private User teamLeader;

    @OneToMany(mappedBy = "project", cascade = CascadeType.ALL, orphanRemoval = true) // 프로젝트에 속한 투두 리스트입니다. 하나의 프로젝트에는 여러 투두가 존재할 수 있으므로, 일대다 관계를 설정하였습니다.
    private List<Todo> todos;

    // 프로젝트 vs 멤버 <- 1명의 멤버는 여러 개의 프로젝트를, 1개의 프로젝트는 여러 명의 멤버 가질 수 있음.
    @ManyToMany
    @JoinTable(
            name = "project_members", // 다대다 관계 매핑을 위한 중간 테이블명입니다.
            joinColumns = @JoinColumn(name = "project_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> members;



}
