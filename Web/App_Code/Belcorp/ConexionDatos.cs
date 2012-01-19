using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// cadenas de conexion para la base de datos.
/// </summary>
public class ConexionDatos {
    string StrCx;
    public char[] splitchar = { ',' };
    public char[] splitcharWs = { '|' };
    private SqlConnectionStringBuilder sqlStringBuilder;

	public ConexionDatos()
	{ 
        ConnectionStringSettingsCollection connectionStrings = System.Web.Configuration.WebConfigurationManager.ConnectionStrings as ConnectionStringSettingsCollection;
        StrCx = connectionStrings["BelcorpDBConn"].ConnectionString;

        sqlStringBuilder = new SqlConnectionStringBuilder();
        sqlStringBuilder.ConnectionString = getConnectionString();
	}

    public String getConnectionString()
    {
        String connectionString = ConfigurationManager.ConnectionStrings["BelcorpDBConn"].ConnectionString;
        return connectionString;
    }

    public SqlConnection getConnection()
    {
        return new SqlConnection(getConnectionString());
    }

    public string APPID()
    {
        return "0xcc76ecb46671657aL";
    }

    public DataTable AccesoDatos(string sSQL)
    {
        using (SqlConnection connection = new SqlConnection(StrCx))
        {
            connection.Open();
            SqlCommand command = new SqlCommand(sSQL, connection);

            SqlDataAdapter mySqlDataAdapter = new SqlDataAdapter();
            mySqlDataAdapter.SelectCommand = command;
            DataSet myDataSet = new DataSet();
            string dataTableName = "roles";
            mySqlDataAdapter.Fill(myDataSet, dataTableName);
            DataTable myDataTable = myDataSet.Tables[dataTableName];
          return myDataTable;
        }
        //return null;

    }
    public string AccesoDatosIngreso(string sSQL)
    {
       
        try
        {
            using (SqlConnection connection = new SqlConnection(StrCx))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sSQL, connection);
                SqlDataReader reader = command.ExecuteReader();
                reader.Close();
                return "1|";
            }
        }
        catch (Exception e)
        {
            EventLogger ev = new EventLogger();
            ev.Save("error al intentar guardar la informacion ", e);
            return "0|"+e;
            //return "0|" + "error al intentar acceder a la base de datos.";
        }
    }

    public static  string AccesoDatosReader(string cadena, string campo)
    {
        string dato = "-1";
        ConnectionStringSettingsCollection connectionStrings = 
            System.Web.Configuration.WebConfigurationManager.ConnectionStrings as ConnectionStringSettingsCollection;
        SqlConnection Conn = new SqlConnection(connectionStrings["BelcorpDBConn"].ConnectionString);
        
            Conn.Open();
            SqlCommand cmd = new SqlCommand(cadena, Conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            { 
                while (rdr.Read())
                { 
                    dato = rdr[campo].ToString();
                }
            
            Conn.Close();
        }
        return dato;
    }

    // Métodos independientes para la exportación de reportes a excel / pdf
    public String getDataBaseName()
    {
        return sqlStringBuilder.InitialCatalog;
    }

    public String getServerName()
    {
        return sqlStringBuilder.DataSource;
    }

    public String getUserID()
    {
        return sqlStringBuilder.UserID;
    }

    public String getPassword()
    {
        return sqlStringBuilder.Password;
    }
}
