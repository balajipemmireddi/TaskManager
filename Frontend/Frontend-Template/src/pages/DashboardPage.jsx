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

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <DashboardCard
          title="Total Tasks"
          value={dashboard?.totalTasks || 0}
          icon="📋"
          color="blue"
        />
        <DashboardCard
          title="Completed Tasks"
          value={dashboard?.completedTasks || 0}
          icon="✅"
          color="green"
        />
        <DashboardCard
          title="Pending Tasks"
          value={dashboard?.pendingTasks || 0}
          icon="⏳"
          color="yellow"
        />
        <DashboardCard
          title="Overdue Tasks"
          value={dashboard?.overdueTasks || 0}
          icon="⚠️"
          color="red"
        />
      </div>

      <div className="mt-8 bg-white rounded-lg shadow-md p-6">
        <h2 className="text-xl font-semibold text-gray-800 mb-4">Quick Actions</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <a
            href="/projects"
            className="block p-4 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors"
          >
            <h3 className="font-semibold text-blue-900">View Projects</h3>
            <p className="text-sm text-blue-700 mt-1">Manage your projects</p>
          </a>
          <a
            href="/tasks"
            className="block p-4 bg-green-50 hover:bg-green-100 rounded-lg transition-colors"
          >
            <h3 className="font-semibold text-green-900">View Tasks</h3>
            <p className="text-sm text-green-700 mt-1">Check your tasks</p>
          </a>
          <a
            href="/projects/create"
            className="block p-4 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors"
          >
            <h3 className="font-semibold text-purple-900">Create Project</h3>
            <p className="text-sm text-purple-700 mt-1">Start a new project</p>
          </a>
        </div>
      </div>
    </div>
  );
};

export default DashboardPage;
