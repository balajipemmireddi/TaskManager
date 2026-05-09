package com.taskmanager.project;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectMemberRepository extends JpaRepository<ProjectMember, Long> {
    
    long countByProjectId(Long projectId);
    
    boolean existsByProjectIdAndUserId(Long projectId, Long userId);
}
