using Microsoft.Data.SqlClient;
using SIS.Utility;

namespace SIS.Util
{
    public static class Connection
    {
        public static SqlConnection GetConnection()
        {
            string connectionString = Properties.GetConnectionString();
            return new SqlConnection(connectionString);
        }
    }
}
