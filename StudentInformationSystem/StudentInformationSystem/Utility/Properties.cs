namespace SIS.Utility
{
    public static class Properties
    {
        public static string GetConnectionString()
        {
            // Make sure the DB name and server are correct
            return "Server=DESKTOP-N03VLVF;Database=SIS_DB;Integrated Security=True;TrustServerCertificate=True";
        }
    }
}
