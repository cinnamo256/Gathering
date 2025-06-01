package com.example.gathering.communication.board.domain;

public enum PostStatus {
    DRAFT,        // 임시 저장 (작성 중, 아직 공개되지 않음)
    PUBLISHED,    // 게시 완료 (팀원들에게 공개됨)
    ARCHIVED,     // 보관됨 (더 이상 편집/댓글 불가능, 과거 자료용)
    DELETED       // 삭제됨 (소프트 딜리트: 실제 DB에서 삭제하지 않고 숨김 처리)
}