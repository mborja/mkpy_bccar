using System;
using System.Collections.Generic;
using System.Text;

using DataAccessLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class ReingresoBL
    {
        private ReingresoDAO dao = new ReingresoDAO();

        public List<ReingresoBE> obtenerPorParametros(ReingresoBE reingresoBE)
        {
            return dao.obtenerPorParametros(reingresoBE);
        }

        public List<ReingresoBE> obtenerPorZonaRegion(ReingresoBE reingresoBE)
        {
            return dao.obtenerPorZonaRegion(reingresoBE);
        }

        public String ws_registroReingreso(ReingresoBE r, String appID)
        {
            return dao.ws_registroReingreso(r, appID);
        }

        // Metodo para registrar la verificación por créditos a una nueva incorporacion
        public Boolean registraVerificacion(int id)
        {
            return dao.registraVerificacion(id);
        }

    }
}
