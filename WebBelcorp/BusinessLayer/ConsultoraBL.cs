using System;
using System.Collections.Generic;
using System.Text;

using DataAccessLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class ConsultoraBL
    {
        private ConsultoraDAO dao = new ConsultoraDAO();

        public String crear(ConsultoraBE consultoraBE)
        {
            return dao.crear(consultoraBE);
        }

    }
}
