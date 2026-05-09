package com.taskmanager.dashboard;

import com.taskmanager.common.TaskStatus;
import com.taskmanager.dashboard.dto.DashboardResponse;
import com.taskmanager.exception.ResourceNotFoundException;
import com.taskmanager.task.TaskRepository;
import com.taskmanager.user.User;
import com.taskmanager.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
public class DashboardService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    public DashboardResponse getDashboard(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        long totalTasks = taskRepository.countByAssignedToId(user.getId());
        long completedTasks = taskRepository.countByAssignedToIdAndStatus(user.getId(), TaskStatus.DONE);
        long pendingTasks = totalTasks - completedTasks;
        long overdueTasks = taskRepository.countOverdueTasks(user.getId(), LocalDate.now());

        return new DashboardResponse(totalTasks, completedTasks, pendingTasks, overdueTasks);
    }
}
