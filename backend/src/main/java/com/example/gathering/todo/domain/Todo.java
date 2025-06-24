package org.example.gdgprojectbackend.todo.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.gdgprojectbackend.project.domain.Project;
import org.example.gdgprojectbackend.project.dto.ProjectSimpleResponseDto;
import org.example.gdgprojectbackend.todo.dto.TodoResponseDto;
import org.example.gdgprojectbackend.user.domain.User;
import org.example.gdgprojectbackend.user.dto.UserResponseDto;

import java.time.LocalDate;

@Entity
@Table(name = "todo")
@Getter
@Setter
@NoArgsConstructor
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String description;

    private LocalDate dueDate = LocalDate.now().plusDays(7);  // 데드라인은 기본값이 존재해야 하는데, 서비스 딴에서 생성하는 것보단 일단 도메인에서 생성하기로 하였습니다.

    private LocalDate createDate = LocalDate.now(); // 생성일자 또한 추가하도록 하자.

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "created_by_id")
    private User createdBy;   // 팀장 구분을 위한 ..


    @Enumerated(EnumType.STRING)
    private TodoStatus status;

    // 다수의 Todo → 하나의 User (담당자)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assignee_id")
    private User assignee;

    // 다수의 Todo → 하나의 Project (속한 프로젝트)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "project_id")
    private Project project;

    @PrePersist
    public void prePersist() {
        if (dueDate == null) {
            dueDate = LocalDate.now().plusDays(7);  // 저장 직전에 한번 더 설정하기.
        }
    }

    public TodoResponseDto toDto() {
        return new TodoResponseDto(
                this.getId(),
                this.getTitle(),
                this.getDescription(),
                this.getCreateDate(),
                this.getDueDate(),
                this.getStatus().name(),
                new UserResponseDto(
                        this.getAssignee().getId(),
                        this.getAssignee().getUsername(),
                        this.getAssignee().getEmail(),
                        this.getAssignee().getProfileImageUrl(),
                        this.getAssignee().getPhoneNumber()
                ),
                new UserResponseDto(
                        this.getAssignee().getId(),
                        this.getAssignee().getUsername(),
                        this.getAssignee().getEmail(),
                        this.getAssignee().getProfileImageUrl(),
                        this.getAssignee().getPhoneNumber()
                ),
                ProjectSimpleResponseDto.from(this.getProject())
        );
    }
}