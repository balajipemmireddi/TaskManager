import axiosInstance from '../api/axiosInstance';

export const dashboardService = {
  getDashboard: async () => {
    const response = await axiosInstance.get('/dashboard');
    return response.data;
  },
};
