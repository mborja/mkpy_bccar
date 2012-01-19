using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer
{
    public class ConsultoraIncorporacionGerenteZonaBE
    {
        private ConsultoraBE _consultora;
        private IncorporacionBE _incorporacion;
        private GerenteZonaBE _gerenteZona;

        public ConsultoraIncorporacionGerenteZonaBE()
        {
            _consultora = new ConsultoraBE();
            _incorporacion = new IncorporacionBE();
            _gerenteZona = new GerenteZonaBE();
        }

        public ConsultoraBE consultora
        {
            get
            {
                return _consultora;
            }
            set
            {
                _consultora = value;
            }
        }

        public IncorporacionBE incorporacion
        {
            get
            {
                return _incorporacion;
            }
            set
            {
                _incorporacion = value;
            }
        }

        public GerenteZonaBE gerenteZona
        {
            get
            {
                return _gerenteZona;
            }
            set
            {
                _gerenteZona = value;
            }
        }

    }
}
