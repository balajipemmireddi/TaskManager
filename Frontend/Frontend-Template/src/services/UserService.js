import axiosInstance from '../api/axiosInstance';

export const userService = {
  getAllUsers: async () => {
    const response = await axiosInstance.get('/users');
    return response.data;
  },
};
