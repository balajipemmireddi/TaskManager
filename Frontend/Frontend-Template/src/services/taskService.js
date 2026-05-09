import axiosInstance from '../api/axiosInstance';

export const taskService = {
  createTask: async (data) => {
    const response = await axiosInstance.post('/tasks', data);
    return response.data;
  },

  getTasksByProject: async (projectId) => {
    const response = await axiosInstance.get(`/projects/${projectId}/tasks`);
    return response.data;
  },

  updateTask: async (id, data) => {
    const response = await axiosInstance.put(`/tasks/${id}`, data);
    return response.data;
  },

  updateTaskStatus: async (id, status) => {
    const response = await axiosInstance.put(`/tasks/${id}/status`, { status });
    return response.data;
  },

  assignTask: async (taskId, userId) => {
    const response = await axiosInstance.put(`/tasks/${taskId}/assign/${userId}`);
    return response.data;
  },

  deleteTask: async (id) => {
    const response = await axiosInstance.delete(`/tasks/${id}`);
    return response.data;
  },
};
