using System;
using System.Collections.Generic;
using System.Text;

using EntityLayer;
using DataAccessLayer;

namespace BusinessLayer
{
    public class IncorporacionBL
    {
        private IncorporacionDAO dao = new IncorporacionDAO();

        public List<IncorporacionConsultaBE> obtenerPorParametros(IncorporacionBE incorporacionBE)
        {
            return dao.obtenerPorParametros(incorporacionBE);
        }

        public List<IncorporacionConsultaBE> obtenerPorZonaRegion(String zonaCodigo, String regionCodigo, int modoGrabacion, int estadoVerificado)
        {
            return dao.obtenerPorZonaRegion(zonaCodigo, regionCodigo, modoGrabacion, estadoVerificado);
        }

        public String ws_registroIncorporacion(IncorporacionBE i, String appID)
        {
            return dao.ws_registroIncorporacion(i, appID);
        }

        // Metodo para registrar la verificación por créditos a una nueva incorporacion
        public Boolean registraVerificacion(int id)
        {
            return dao.registraVerificacion(id);
        }

        public List<IncorporacionConsultaBE> obtenerPorId(int Id)
        {
            return dao.obtenerPorId(Id);
        }

    }
}
