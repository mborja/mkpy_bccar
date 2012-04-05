using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer
{
    public class IncorporacionConsultaBE
    {
        public IncorporacionConsultaBE()
        {
        }

        // Inicio - Variables para consultas
        private int _cantidad;
        public int cantidad
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }

        private String _modoGrabacionString;
        public String modoGrabacionString
        {
            get { return _modoGrabacionString; }
            set { _modoGrabacionString = value; }
        }
        private String _estadoVerificadoString;
        public String estadoVerificadoString
        {
            get { return _estadoVerificadoString; }
            set { _estadoVerificadoString = value; }
        }

        // Fin - Variables para consultas

        // Inicio - Variables de Gerente de Zona
        private int _gerenteID;
        public int gerenteID
        {
            get { return _gerenteID; }
            set { _gerenteID = value; }
        }

        private String _regionCodigo;
        public String regionCodigo
        {
            get { return _regionCodigo; }
            set { _regionCodigo = value; }
        }

        private String _zonaCodigo;
        public String zonaCodigo
        {
            get { return _zonaCodigo; }
            set { _zonaCodigo = value; }
        }
        // Fin - Variables de Gerente de Zona

        // Inicio - Variables de Incorporacion
        private int _incorporacionID;
        public int incorporacionID
        {
            get { return _incorporacionID; }
            set { _incorporacionID = value; }
        }

        private int _consultoraID;
        public int consultoraID
        {
            get { return _consultoraID; }
            set { _consultoraID = value; }
        }

        private String _fechaRegistro;
        public String fechaRegistro
        {
            get { return _fechaRegistro; }
            set { _fechaRegistro = value; }
        }

        private String _fechaActualizacion;
        public String fechaActualizacion
        {
            get { return _fechaActualizacion; }
            set { _fechaActualizacion = value; }
        }

        private String _campanhaInscripcion;
        public String campanhaInscripcion
        {
            get { return _campanhaInscripcion; }
            set { _campanhaInscripcion = value; }
        }

        private String _numeroDocumento;
        public String numeroDocumento
        {
            get { return _numeroDocumento; }
            set { _numeroDocumento = value; }
        }

        private String _apellidoPaterno;
        public String apellidoPaterno
        {
            get { return _apellidoPaterno; }
            set { _apellidoPaterno = value; }
        }

        private String _apellidoMaterno;
        public String apellidoMaterno
        {
            get { return _apellidoMaterno; }
            set { _apellidoMaterno = value; }
        }

        private String _nombres;
        public String nombres
        {
            get { return _nombres; }
            set { _nombres = value; }
        }

        private String _consultoraCodigo;
        public String consultoraCodigo
        {
            get { return _consultoraCodigo; }
            set { _consultoraCodigo = value; }
        }

        private bool _modoGrabacion;
        public bool modoGrabacion
        {
            get { return _modoGrabacion; }
            set { _modoGrabacion = value; }
        }

        private bool _estadoVerificado;
        public bool estadoVerificado
        {
            get { return _estadoVerificado; }
            set { _estadoVerificado = value; }
        }

        private bool _estadoActivo;
        public bool estadoActivo
        {
            get { return _estadoActivo; }
            set { _estadoActivo = value; }
        }
        private char _tipo;
        public char tipo
        {
            get
            {
                return _tipo;
            }
            set
            {
                _tipo = value;
            }
        }
        // Fin - Variables de Incorporacion
    }
}
