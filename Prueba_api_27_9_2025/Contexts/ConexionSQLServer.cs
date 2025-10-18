using Microsoft.Data.SqlClient;
using System.Data.Common;

namespace Prueba.Contexts
{
    public class ConexionSQLServer
    {
        private readonly string _connectionString;

        public ConexionSQLServer(string connectionString)
        {
            _connectionString = connectionString ?? throw new ArgumentNullException(nameof(connectionString));
        }

        // Retorna una nueva conexión cada vez que se llama
        public DbConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
