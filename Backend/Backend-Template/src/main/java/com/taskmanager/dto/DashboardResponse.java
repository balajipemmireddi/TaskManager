package com.taskmanager.dashboard.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DashboardResponse {

    private Long totalTasks;
    private Long completedTasks;
    private Long pendingTasks;
    private Long overdueTasks;
}
