using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using DataAccessLayer;

namespace BusinessLayer
{
    public class SeguimientoBL
    {
        private SeguimientoDAO dao = new SeguimientoDAO();

        public List<SeguimientoBE> obtenerPorParametros(SeguimientoBE seguimientoBE)
        {
            return dao.obtenerPorParametros(seguimientoBE);
        }
        public String ws_registroSeguimiento(SeguimientoBE s, String appID)
        {
            return dao.ws_registroSeguimiento(s, appID);
        }
        public List<SeguimientoBE> obtenerPorZonaRegion(SeguimientoBE seguimientoBE)
        {
            return dao.obtenerPorZonaRegion(seguimientoBE);
        }

        // Metodo para registrar la verificación por créditos de un seguimiento
        public Boolean registraVerificacion(int id)
        {
            return dao.registraVerificacion(id);
        }
    }
}
