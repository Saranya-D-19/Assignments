using Microsoft.Data.SqlClient;

namespace TechShop.Util
{
    public static class Connection
    {
        private static SqlConnection? connection;

        public static SqlConnection GetConnection()
        {
            if (connection == null || connection.State != System.Data.ConnectionState.Open)
            {
                string connectionString = Properties.GetConnectionString();
                connection = new SqlConnection(connectionString);
                connection.Open();
            }
            return connection;
        }

        public static void CloseConnection()
        {
            if (connection != null && connection.State == System.Data.ConnectionState.Open)
            {
                connection.Close();
                connection = null;
            }
        }
    }
}
