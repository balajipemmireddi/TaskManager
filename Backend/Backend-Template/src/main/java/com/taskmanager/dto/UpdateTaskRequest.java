package com.taskmanager.task.dto;

import com.taskmanager.common.Priority;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateTaskRequest {

    private String title;
    private String description;
    private Priority priority;
    private LocalDate dueDate;
}
