package com.taskmanager.task;

import com.taskmanager.common.TaskStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
    
    List<Task> findByProjectId(Long projectId);
    
    long countByAssignedToId(Long userId);
    
    long countByAssignedToIdAndStatus(Long userId, TaskStatus status);
    
    @Query("SELECT COUNT(t) FROM Task t WHERE t.assignedTo.id = :userId AND t.status != 'DONE' AND t.dueDate < :today")
    long countOverdueTasks(@Param("userId") Long userId, @Param("today") LocalDate today);
}
