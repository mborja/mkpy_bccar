using System;
using System.Collections.Generic;
using System.Text;



namespace EntityLayer
{
    public class SeguimientoBE
    {
        public SeguimientoBE()
        { }

        // Inicio - Variables adicionales para consultas
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

        private String _zonaCodigo;
        public String ZonaCodigo
        {
            get { return _zonaCodigo; }
            set { _zonaCodigo = value; }
        }

        private String _consultoraCodigo;
        public String ConsultoraCodigo
        {
            get { return _consultoraCodigo; }
            set { _consultoraCodigo = value; }
        }

        private int _consultoraID;
        public int consultoraID
        {
            get { return _consultoraID; }
            set { _consultoraID = value; }
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
        
        // Fin - Variables adicionales para consultas

        private int _seguimientoID;
        public int SeguimientoID
        {
            get { return _seguimientoID; }
            set { _seguimientoID = value; }
        }

        private int _paisID;
        public int PaisID
        {
            get { return _paisID; }
            set { _paisID = value; }
        }

        private int _gerenteZonaID;
        public int GerenteZonaID
        {
            get { return _gerenteZonaID; }
            set { _gerenteZonaID = value; }
        }

        private String _campanha;
        public String Campanha
        {
            get { return _campanha; }
            set { _campanha = value; }
        }

        private String _fechaIngreso;
        public String FechaIngreso
        {
            get { return _fechaIngreso; }
            set { _fechaIngreso = value; }
        }

        private String _fecha;
        public String Fecha
        {
            get { return _fecha; }
            set { _fecha = value; }
        }

        private String _observacion;
        public String Observacion
        {
            get { return _observacion; }
            set { _observacion = value; }
        }

        private String _recordPin;
        public String RecordPin
        {
            get { return _recordPin; }
            set { _recordPin = value; }
        }

        private String _recordImsi;
        public String RecordImsi
        {
            get { return _recordImsi; }
            set { _recordImsi = value; }
        }

        private String _recordLongitud;
        public String RecordLongitud
        {
            get { return _recordLongitud; }
            set { _recordLongitud = value; }
        }

        private String _recordLatitud;
        public String RecordLatitud
        {
            get { return _recordLatitud; }
            set { _recordLatitud = value; }
        }

        private String _recordMargen;
        public String RecordMargen
        {
            get { return _recordMargen; }
            set { _recordMargen = value; }
        }

        private String _recordNumeroSatelites;
        public String RecordNumeroSatelites
        {
            get { return _recordNumeroSatelites; }
            set { _recordNumeroSatelites = value; }
        }

        private String _recordObservacion;
        public String RecordObservacion
        {
            get { return _recordObservacion; }
            set { _recordObservacion = value; }
        }

        private String _recordFechaVisita;
        public String RecordFechaVisita
        {
            get { return _recordFechaVisita; }
            set { _recordFechaVisita = value; }
        }

        private bool _estadoVerificado;
        public bool EstadoVerificado
        {
            get { return _estadoVerificado; }
            set { _estadoVerificado = value; }
        }

        private bool _estadoActivo;
        public bool EstadoActivo
        {
            get { return _estadoActivo; }
            set { _estadoActivo = value; }
        }

        private String _regionCodigo;
        public String regionCodigo
        {
            get { return _regionCodigo; }
            set { _regionCodigo = value; }
        }

        private int _estadoVerificadoInt;
        public int estadoVerificadoInt
        {
            get { return _estadoVerificadoInt; }
            set { _estadoVerificadoInt = value; }
        }

        private int _cantidad;
        public int cantidad
        {
            get { return _cantidad; }
            set { _cantidad = value; }
        }
    }

}
