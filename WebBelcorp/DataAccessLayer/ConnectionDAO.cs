using System;
using System.Collections.Generic;
using System.Text;

using System.Data.SqlClient;
using System.Configuration;

namespace DataAccessLayer
{
    public class ConnectionDAO
    {
        private SqlConnectionStringBuilder sqlConnectionStringBuilder;

        public ConnectionDAO()
        {
            sqlConnectionStringBuilder = new SqlConnectionStringBuilder();
            sqlConnectionStringBuilder.ConnectionString = getConnectionString();
        }

        public SqlConnection getConnection()
        {
            return new SqlConnection(getConnectionString());
        }

        public String getConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["BelcorpDBConn"].ConnectionString;
        }

        // Métodos independientes para la exportación de reportes a excel / pdf
        public String getDataBaseName()
        {
            return sqlConnectionStringBuilder.InitialCatalog;
        }

        public String getServerName()
        {
            return sqlConnectionStringBuilder.DataSource;
        }

        public String getUserID()
        {
            return sqlConnectionStringBuilder.UserID;
        }

        public String getPassword()
        {
            return sqlConnectionStringBuilder.Password;
        }
    }
}
