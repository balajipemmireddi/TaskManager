import axiosInstance from '../api/axiosInstance';

export const projectService = {
  createProject: async (data) => {
    const response = await axiosInstance.post('/projects', data);
    return response.data;
  },

  getAllProjects: async () => {
    const response = await axiosInstance.get('/projects');
    return response.data;
  },

  getProjectById: async (id) => {
    const response = await axiosInstance.get(`/projects/${id}`);
    return response.data;
  },

  updateProject: async (id, data) => {
    const response = await axiosInstance.put(`/projects/${id}`, data);
    return response.data;
  },

  deleteProject: async (id) => {
    const response = await axiosInstance.delete(`/projects/${id}`);
    return response.data;
  },

  addMember: async (projectId, userId) => {
    const response = await axiosInstance.post(`/projects/${projectId}/members/${userId}`);
    return response.data;
  },
};
