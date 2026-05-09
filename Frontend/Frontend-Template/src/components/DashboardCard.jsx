const DashboardCard = ({ title, value, icon, color = 'blue', trend }) => {
  const colorClasses = {
    blue: 'from-blue-500 to-blue-600',
    green: 'from-green-500 to-green-600',
    yellow: 'from-yellow-500 to-yellow-600',
    red: 'from-red-500 to-red-600',
    purple: 'from-purple-500 to-purple-600',
  };

  return (
    <div className="bg-white rounded-lg shadow-md hover:shadow-xl transition-all duration-300 overflow-hidden transform hover:-translate-y-1">
      <div className={`bg-gradient-to-r ${colorClasses[color]} p-4`}>
        <div className="flex items-center justify-between">
          <span className="text-4xl">{icon}</span>
          <div className="text-right">
            <p className="text-white text-opacity-90 text-sm font-medium">{title}</p>
            <p className="text-white text-3xl font-bold mt-1">{value}</p>
          </div>
        </div>
      </div>
      {trend && (
        <div className="px-4 py-2 bg-gray-50">
          <p className="text-xs text-gray-600">
            <span className={trend.startsWith('+') ? 'text-green-600 font-semibold' : trend.startsWith('-') ? 'text-red-600 font-semibold' : 'text-gray-600'}>
              {trend}
            </span>
            {trend.includes('%') && ' from last week'}
          </p>
        </div>
      )}
    </div>
  );
};

export default DashboardCard;
