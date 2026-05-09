package com.taskmanager.project;

import com.taskmanager.common.Role;
import com.taskmanager.exception.ResourceNotFoundException;
import com.taskmanager.exception.UnauthorizedAccessException;
import com.taskmanager.project.dto.CreateProjectRequest;
import com.taskmanager.project.dto.ProjectResponse;
import com.taskmanager.user.User;
import com.taskmanager.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private ProjectMemberRepository projectMemberRepository;

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public ProjectResponse createProject(CreateProjectRequest request, String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (user.getRole() != Role.ADMIN) {
            throw new UnauthorizedAccessException("Only ADMIN can create projects");
        }

        Project project = new Project();
        project.setTitle(request.getTitle());
        project.setDescription(request.getDescription());
        project.setCreatedBy(user);

        project = projectRepository.save(project);

        return mapToResponse(project);
    }

    public List<ProjectResponse> getAllProjects() {
        return projectRepository.findAll().stream()
                .map(this::mapToResponse)
                .collect(Collectors.toList());
    }

    public ProjectResponse getProjectById(Long id) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found"));
        return mapToResponse(project);
    }

    @Transactional
    public ProjectResponse updateProject(Long id, CreateProjectRequest request, String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (user.getRole() != Role.ADMIN) {
            throw new UnauthorizedAccessException("Only ADMIN can update projects");
        }

        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found"));

        project.setTitle(request.getTitle());
        project.setDescription(request.getDescription());

        project = projectRepository.save(project);
        return mapToResponse(project);
    }

    @Transactional
    public void deleteProject(Long id, String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (user.getRole() != Role.ADMIN) {
            throw new UnauthorizedAccessException("Only ADMIN can delete projects");
        }

        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found"));

        projectRepository.delete(project);
    }

    @Transactional
    public void addMember(Long projectId, Long userId, String email) {
        User admin = userRepository.findByEmail(email)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (admin.getRole() != Role.ADMIN) {
            throw new UnauthorizedAccessException("Only ADMIN can add members");
        }

        Project project = projectRepository.findById(projectId)
                .orElseThrow(() -> new ResourceNotFoundException("Project not found"));

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (projectMemberRepository.existsByProjectIdAndUserId(projectId, userId)) {
            throw new RuntimeException("User is already a member of this project");
        }

        ProjectMember member = new ProjectMember();
        member.setProject(project);
        member.setUser(user);

        projectMemberRepository.save(member);
    }

    private ProjectResponse mapToResponse(Project project) {
        ProjectResponse response = new ProjectResponse();
        response.setId(project.getId());
        response.setTitle(project.getTitle());
        response.setDescription(project.getDescription());
        response.setCreatedBy(project.getCreatedBy().getName());
        response.setMembersCount((int) projectMemberRepository.countByProjectId(project.getId()));
        return response;
    }
}
