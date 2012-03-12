using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer
{
    public class ReingresoBE
    {
        public ReingresoBE()
        {
        }

        // Inicio - variables adicionales para consultas
        private String _pin;
        public String Pin
        {
            get { return _pin; }
            set { _pin = value; }
        }

        private String _imsi;
        public String Imsi
        {
            get { return _imsi; }
            set { _imsi = value; }
        }

        private String _campanha;
        public String Campanha
        {
            get { return _campanha; }
            set { _campanha = value; }
        }

        private String _fecha;
        public String Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        // Fin - variables adicionales para consultas

        private int _reingresoID;
        public int reingresoID
        {
            get { return _reingresoID; }
            set { _reingresoID = value; }
        }

        private int _paisID;
        public int paisID
        {
            get { return _paisID; }
            set { _paisID = value; }
        }

        private int _gerenteZonaID;
        public int gerenteZonaID
        {
            get { return _gerenteZonaID; }
            set { _gerenteZonaID = value; }
        }

        private int _consultoraID;
        public int consultoraID
        {
            get { return _consultoraID; }
            set { _consultoraID = value; }
        }

        private String _campanhaInscripcion;
        public String campanhaInscripcion
        {
            get { return _campanhaInscripcion; }
            set { _campanhaInscripcion = value; }
        }
        

        private String _consultoraCodigo;
        public String consultoraCodigo
        {
            get { return _consultoraCodigo; }
            set { _consultoraCodigo = value; }
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

        private String _documentoNumero;
        public String documentoNumero
        {
            get { return _documentoNumero; }
            set { _documentoNumero = value; }
        }

        private String _telefono1;
        public String telefono1
        {
            get { return _telefono1; }
            set { _telefono1 = value; }
        }

        private String _telefono2;
        public String telefono2
        {
            get { return _telefono2; }
            set { _telefono2 = value; }
        }

        private String _recPin;
        public String recPin
        {
            get { return _recPin; }
            set { _recPin = value; }
        }

        private String _recImsi;
        public String recImsi
        {
            get { return _recImsi; }
            set { _recImsi = value; }
        }

        private String _recLongitud;
        public String recLongitud
        {
            get { return _recLongitud; }
            set { _recLongitud = value; }
        }

        private String _recLatitud;
        public String recLatitud
        {
            get { return _recLatitud; }
            set { _recLatitud = value; }
        }

        private String _recMargen;
        public String recMargen
        {
            get { return _recMargen; }
            set { _recMargen = value; }
        }

        private int _recNumeroSatelites;
        public int recNumeroSatelites
        {
            get { return _recNumeroSatelites; }
            set { _recNumeroSatelites = value; }
        }

        private String _recObservacion;
        public String recObservacion
        {
            get { return _recObservacion; }
            set { _recObservacion = value; }
        }

        private String _recFechaVisita;
        public String recFechaVisita
        {
            get { return _recFechaVisita; }
            set { _recFechaVisita = value; }
        }

        private String _recFechaReingreso;
        public String recFechaReingreso
        {
            get { return _recFechaReingreso; }
            set { _recFechaReingreso = value; }
        }

        private String _recFechaReingresoIni;
        public String recFechaReingresoIni
        {
            get { return _recFechaReingresoIni; }
            set { _recFechaReingresoIni = value; }
        }

        private String _recFechaReingresoFin;
        public String recFechaReingresoFin
        {
            get { return _recFechaReingresoFin; }
            set { _recFechaReingresoFin = value; }
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

        // Inicio variables auxiliares
        private int _estadoVerificadoInt;
        public int estadoVerificadoInt
        {
            get { return _estadoVerificadoInt; }
            set { _estadoVerificadoInt = value; }
        }

        private int _estadoActivoInt;
        public int estadoActivoInt
        {
            get { return _estadoActivoInt; }
            set { _estadoActivoInt = value; }
        }
        // Fin variables auxiliares
        
        // Variables adicionales para consulta
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

        private String _campanhaPrimeraCompra;
        public String campanhaPrimeraCompra
        {
            get { return _campanhaPrimeraCompra; }
            set { _campanhaPrimeraCompra = value; }
        }

        private int _cantidad;
        public int cantidad
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }
        private String _estadoVerificadoString;
        public String estadoVerificadoString
        {
            get { return _estadoVerificadoString; }
            set { _estadoVerificadoString = value; }
        }

    }
}
