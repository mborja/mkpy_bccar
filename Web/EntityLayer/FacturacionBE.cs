using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer
{
    public class FacturacionBE
    {
        public FacturacionBE()
        { }

        private int _facturacionID;
        public int FacturacionID
        {
            get { return _facturacionID; }
            set { _facturacionID = value; }
        }
        

        private int _paisID;
        public int PaisID
        {
            get { return _paisID; }
            set { _paisID = value; }
        }

        private String _campanha; //campaign> los nombres de los campos en DB y aquí debieron ser en inglés
        public String Campanha
        {
            get { return _campanha; }
            set { _campanha = value; }
        }

        private String _companhiaCodigo; // companyCode
        public String CompanhiaCodigo
        {
            get { return _companhiaCodigo; }
            set { _companhiaCodigo = value; }
        }

        private String _regionCodigo;
        public String RegionCodigo
        {
            get { return _regionCodigo; }
            set { _regionCodigo = value; }
        }

        private String _zonaCodigo;
        public String ZonaCodigo
        {
            get { return _zonaCodigo; }
            set { _zonaCodigo = value; }
        }

        private String _fecha;
        public String Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private bool _estadoActivo;
        public bool EstadoActivo
        {
            get { return _estadoActivo; }
            set { _estadoActivo = value; }
        }
    }
}
