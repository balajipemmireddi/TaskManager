import { useState, useEffect } from 'react';
import { dashboardService } from '../services/dashboardService';
import DashboardCard from '../components/DashboardCard';
import Loader from '../components/Loader';

const DashboardPage = () => {
  const [dashboard, setDashboard] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchDashboard();
  }, []);

  const fetchDashboard = async () => {
    try {
      const response = await dashboardService.getDashboard();
      if (response.success) {
        setDashboard(response.data);
      }
    } catch (err) {
      setError('Failed to load dashboard data');
    } finally {
      setLoading(false);
    }
  };

  const calculateProgress = () => {
    if (!dashboard || dashboard.totalTasks === 0) return 0;
    return Math.round((dashboard.completedTasks / dashboard.totalTasks) * 100);
  };

  const getProgressColor = (progress) => {
    if (progress >= 75) return 'bg-green-500';
    if (progress >= 50) return 'bg-blue-500';
    if (progress >= 25) return 'bg-yellow-500';
    return 'bg-red-500';
  };

  if (loading) return <Loader />;

  if (error) {
    return (
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
          {error}
        </div>
      </div>
    );
  }

  const progress = calculateProgress();

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      {/* Header with Welcome Message */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-600 mt-2">Welcome back! Here's your project overview.</p>
      </div>

      {/* Overall Progress Card */}
      <div className="bg-gradient-to-r from-blue-500 to-purple-600 rounded-lg shadow-lg p-6 mb-8 text-white">
        <div className="flex items-center justify-between mb-4">
          <div>
            <h2 className="text-2xl font-bold">Overall Progress</h2>
            <p className="text-blue-100 mt-1">
              {dashboard?.completedTasks || 0} of {dashboard?.totalTasks || 0} tasks completed
            </p>
          </div>
          <div className="text-5xl font-bold">{progress}%</div>
        </div>
        <div className="w-full bg-white bg-opacity-30 rounded-full h-4 overflow-hidden">
          <div
            className="bg-white h-full rounded-full transition-all duration-500 ease-out"
            style={{ width: `${progress}%` }}
          ></div>
        </div>
      </div>

      {/* Stats Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <DashboardCard
          title="Total Tasks"
          value={dashboard?.totalTasks || 0}
          icon="📋"
          color="blue"
          trend="+12%"
        />
        <DashboardCard
          title="Completed Tasks"
          value={dashboard?.completedTasks || 0}
          icon="✅"
          color="green"
          trend="+8%"
        />
        <DashboardCard
          title="Pending Tasks"
          value={dashboard?.pendingTasks || 0}
          icon="⏳"
          color="yellow"
          trend="-5%"
        />
        <DashboardCard
          title="Overdue Tasks"
          value={dashboard?.overdueTasks || 0}
          icon="⚠️"
          color="red"
          trend={dashboard?.overdueTasks > 0 ? 'Needs attention' : 'All good'}
        />
      </div>

      {/* Task Distribution */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Priority Distribution */}
        <div className="bg-white rounded-lg shadow-md p-6">
          <h3 className="text-lg font-semibold text-gray-800 mb-4">Task Priority Distribution</h3>
          <div className="space-y-4">
            <div>
              <div className="flex justify-between text-sm mb-1">
                <span className="text-red-600 font-medium">🔴 High Priority</span>
                <span className="text-gray-600">
                  {Math.round(((dashboard?.totalTasks || 1) * 0.2))} tasks
                </span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-red-500 h-2 rounded-full" style={{ width: '20%' }}></div>
              </div>
            </div>
            <div>
              <div className="flex justify-between text-sm mb-1">
                <span className="text-yellow-600 font-medium">🟡 Medium Priority</span>
                <span className="text-gray-600">
                  {Math.round(((dashboard?.totalTasks || 1) * 0.5))} tasks
                </span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-yellow-500 h-2 rounded-full" style={{ width: '50%' }}></div>
              </div>
            </div>
            <div>
              <div className="flex justify-between text-sm mb-1">
                <span className="text-green-600 font-medium">🟢 Low Priority</span>
                <span className="text-gray-600">
                  {Math.round(((dashboard?.totalTasks || 1) * 0.3))} tasks
                </span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-2">
                <div className="bg-green-500 h-2 rounded-full" style={{ width: '30%' }}></div>
              </div>
            </div>
          </div>
        </div>

        {/* Quick Stats */}
        <div className="bg-white rounded-lg shadow-md p-6">
          <h3 className="text-lg font-semibold text-gray-800 mb-4">Quick Insights</h3>
          <div className="space-y-4">
            <div className="flex items-center justify-between p-3 bg-blue-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <span className="text-2xl">📊</span>
                <div>
                  <p className="text-sm text-gray-600">Completion Rate</p>
                  <p className="text-lg font-semibold text-gray-900">{progress}%</p>
                </div>
              </div>
            </div>
            <div className="flex items-center justify-between p-3 bg-green-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <span className="text-2xl">🎯</span>
                <div>
                  <p className="text-sm text-gray-600">Tasks This Week</p>
                  <p className="text-lg font-semibold text-gray-900">
                    {dashboard?.pendingTasks || 0}
                  </p>
                </div>
              </div>
            </div>
            <div className="flex items-center justify-between p-3 bg-purple-50 rounded-lg">
              <div className="flex items-center space-x-3">
                <span className="text-2xl">⚡</span>
                <div>
                  <p className="text-sm text-gray-600">Productivity Score</p>
                  <p className="text-lg font-semibold text-gray-900">
                    {progress >= 75 ? 'Excellent' : progress >= 50 ? 'Good' : 'Needs Improvement'}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DashboardPage;
