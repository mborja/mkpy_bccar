using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using DataAccessLayer;

namespace BusinessLayer
{
    public class GerenteZonaBL
    {
        private GerenteZonaDAO dao = new GerenteZonaDAO();

        public String crear(GerenteZonaBE gerenteZonaBE)
        {
            return dao.crear(gerenteZonaBE);
        }
    }
}
