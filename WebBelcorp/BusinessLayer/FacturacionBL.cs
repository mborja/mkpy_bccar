using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using DataAccessLayer;

namespace BusinessLayer
{
    public class FacturacionBL
    {
        private FacturacionDAO dao = new FacturacionDAO();

        public String crear(FacturacionBE facturacionBE)
        {
            return dao.crear(facturacionBE);
        }
    }
}
