package com.example.gathering.notification.domain;

import com.example.gathering.user.domain.User;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "notifications")
@Getter
@NoArgsConstructor
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @Column(columnDefinition = "TEXT")
    private String message;

    @Enumerated(EnumType.STRING)
    private NotificationType type;

    private boolean isRead = false;

    private LocalDateTime createdAt;

    @ManyToOne(fetch = FetchType.LAZY) // 이 부분을 살짝 고민했었는데요, 그냥 한 명의 사용자는 여러 개의 알림을 가질 수 있는 것으로 구현하려고 합니다.
    @JoinColumn(name = "recipient_id") // 즉, 만약 같은 내용의 알림이라도 알림의 id값은 다른 것으로 취급하도록 합니다.
    private User recipient;

    @PrePersist
    public void prePersist() {
        this.createdAt = LocalDateTime.now();
    }

    public void markAsRead() {
        this.isRead = true;
    }
}
