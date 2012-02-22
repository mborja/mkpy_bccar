using System;
using System.Text;

using DataAccessLayer;

namespace BusinessLayer
{
    public class ConnectionBL
    {
        private ConnectionDAO dao = new ConnectionDAO();

        public String getDataBaseName()
        {
            return dao.getDataBaseName();
        }

        public String getServerName()
        {
            return dao.getServerName();
        }

        public String getUserID()
        {
            return dao.getUserID();
        }

        public String getPassword()
        {
            return dao.getPassword();
        }
    }
}
