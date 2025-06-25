package org.example.gdgprojectbackend.todo.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.example.gdgprojectbackend.project.domain.Project;

import java.time.LocalDate;

public enum TodoStatus {
    PENDING,             // 할당만 된 상태
    // IN_PROGRESS,         // 팀원이 체크(처리 중)한 상태
    AWAITING_REVIEW,     // 팀장 승인 대기 중
    APPROVED,            // 팀장이 승인 완료
    REJECTED,            // 팀장이 거절
    COMPLETED            // 최종 완료 (예: 승인이 끝난 상태)
}
