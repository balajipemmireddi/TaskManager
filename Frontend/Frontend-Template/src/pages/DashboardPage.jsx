import { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/authContext';
import { dashboardService } from '../services/dashboardService';
import DashboardCard from '../components/DashboardCard';
import Loader from '../components/Loader';

const DashboardPage = () => {
  const { isAdmin } = useAuth();
  const navigate = useNavigate();
  const [dashboard, setDashboard] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [permissionError, setPermissionError] = useState('');

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

  const handleCreateProjectClick = (e) => {
    if (!isAdmin()) {
      e.preventDefault();
      setPermissionError('Only administrators can create projects. Please contact your admin.');
      setTimeout(() => setPermissionError(''), 5000); // Clear error after 5 seconds
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
      
      {permissionError && (
        <div className="mb-6 bg-yellow-100 border border-yellow-400 text-yellow-800 px-4 py-3 rounded flex items-start">
          <span className="text-2xl mr-3">⚠️</span>
          <div>
            <p className="font-semibold">Access Denied</p>
            <p className="text-sm">{permissionError}</p>
          </div>
        </div>
      )}
      
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
          <Link
            to="/projects"
            className="block p-4 bg-blue-50 hover:bg-blue-100 rounded-lg transition-colors"
          >
            <h3 className="font-semibold text-blue-900">View Projects</h3>
            <p className="text-sm text-blue-700 mt-1">Manage your projects</p>
          </Link>
          <Link
            to="/projects"
            className="block p-4 bg-green-50 hover:bg-green-100 rounded-lg transition-colors"
          >
            <h3 className="font-semibold text-green-900">View Tasks</h3>
            <p className="text-sm text-green-700 mt-1">Check your tasks</p>
          </Link>
          {isAdmin() ? (
            <Link
              to="/projects/create"
              className="block p-4 bg-purple-50 hover:bg-purple-100 rounded-lg transition-colors"
            >
              <h3 className="font-semibold text-purple-900">Create Project</h3>
              <p className="text-sm text-purple-700 mt-1">Start a new project</p>
            </Link>
          ) : (
            <button
              onClick={handleCreateProjectClick}
              className="block w-full text-left p-4 bg-gray-50 hover:bg-gray-100 rounded-lg transition-colors cursor-not-allowed opacity-60"
            >
              <h3 className="font-semibold text-gray-700">Create Project</h3>
              <p className="text-sm text-gray-600 mt-1">Admin only</p>
            </button>
          )}
        </div>
      </div>
    </div>
  );
};

export default DashboardPage;
