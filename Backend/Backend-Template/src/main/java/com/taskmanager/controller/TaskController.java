package com.taskmanager.task;

import com.taskmanager.common.ApiResponse;
import com.taskmanager.task.dto.CreateTaskRequest;
import com.taskmanager.task.dto.TaskResponse;
import com.taskmanager.task.dto.UpdateTaskRequest;
import com.taskmanager.task.dto.UpdateTaskStatusRequest;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@Tag(name = "Tasks", description = "Task Management APIs")
@SecurityRequirement(name = "Bearer Authentication")
public class TaskController {

    @Autowired
    private TaskService taskService;

    @PostMapping("/tasks")
    @Operation(summary = "Create a new task (ADMIN only)")
    public ResponseEntity<ApiResponse<TaskResponse>> createTask(
            @Valid @RequestBody CreateTaskRequest request,
            Authentication authentication) {
        TaskResponse task = taskService.createTask(request, authentication.getName());
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(ApiResponse.success("Task created successfully", task));
    }

    @GetMapping("/projects/{projectId}/tasks")
    @Operation(summary = "Get all tasks for a project")
    public ResponseEntity<ApiResponse<List<TaskResponse>>> getTasksByProject(@PathVariable Long projectId) {
        List<TaskResponse> tasks = taskService.getTasksByProject(projectId);
        return ResponseEntity.ok(ApiResponse.success("Tasks retrieved successfully", tasks));
    }

    @PutMapping("/tasks/{id}")
    @Operation(summary = "Update task (ADMIN only)")
    public ResponseEntity<ApiResponse<TaskResponse>> updateTask(
            @PathVariable Long id,
            @Valid @RequestBody UpdateTaskRequest request,
            Authentication authentication) {
        TaskResponse task = taskService.updateTask(id, request, authentication.getName());
        return ResponseEntity.ok(ApiResponse.success("Task updated successfully", task));
    }

    @PutMapping("/tasks/{id}/status")
    @Operation(summary = "Update task status")
    public ResponseEntity<ApiResponse<TaskResponse>> updateTaskStatus(
            @PathVariable Long id,
            @Valid @RequestBody UpdateTaskStatusRequest request,
            Authentication authentication) {
        TaskResponse task = taskService.updateTaskStatus(id, request, authentication.getName());
        return ResponseEntity.ok(ApiResponse.success("Task status updated successfully", task));
    }

    @PutMapping("/tasks/{taskId}/assign/{userId}")
    @Operation(summary = "Assign task to user (ADMIN only)")
    public ResponseEntity<ApiResponse<Void>> assignTask(
            @PathVariable Long taskId,
            @PathVariable Long userId,
            Authentication authentication) {
        taskService.assignTask(taskId, userId, authentication.getName());
        return ResponseEntity.ok(ApiResponse.success("Task assigned successfully", null));
    }

    @DeleteMapping("/tasks/{id}")
    @Operation(summary = "Delete task (ADMIN only)")
    public ResponseEntity<ApiResponse<Void>> deleteTask(
            @PathVariable Long id,
            Authentication authentication) {
        taskService.deleteTask(id, authentication.getName());
        return ResponseEntity.ok(ApiResponse.success("Task deleted successfully", null));
    }
}
