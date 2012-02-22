using System;
using System.Collections.Generic;
using System.Text;

namespace EntityLayer
{
    public class IncorporacionBE
    {
        public IncorporacionBE()
        {
        }

        // Inicio - Variables adicionales para consultas
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

        private String _primerNombre;
        public String PrimerNombre
        {
            get { return _primerNombre; }
            set { _primerNombre = value; }
        }

        private String _segundoNombre;
        public String SegundoNombre
        {
            get { return _segundoNombre; }
            set { _segundoNombre = value; }
        }

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

        private String _consultoraCodigo;
        public String ConsultoraCodigo
        {
            get { return _consultoraCodigo; }
            set { _consultoraCodigo = value; }
        }

        private String _campanhaInscripcion;
        public String CampanhaInscripcion
        {
            get { return _campanhaInscripcion; }
            set { _campanhaInscripcion = value; }
        }
        // Fin - Variables adicionales para consultas

        private int _incorporacionID;
        public int incorporacionID
        {
            get
            {
                return _incorporacionID;
            }
            set
            {
                _incorporacionID = value;
            }
        }

        private int _paisID;
        public int paisID
        {
            get
            {
                return _paisID;
            }
            set
            {
                _paisID = value;
            }
        }

        private int _gerenteZonaID;
        public int gerenteZonaID
        {
            get
            {
                return _gerenteZonaID;
            }
            set
            {
                _gerenteZonaID = value;
            }
        }

        private int _consultoraID;
        public int consultoraID
        {
            get
            {
                return _consultoraID;
            }
            set
            {
                _consultoraID = value;
            }
        }

        private int _tablaContactoID;
        public int tablaContactoID
        {
            get
            {
                return _tablaContactoID;
            }
            set
            {
                _tablaContactoID = value;
            }
        }

        private Int64 _tablaOtraMarcaID;
        public Int64 tablaOtraMarcaID
        {
            get
            {
                return _tablaOtraMarcaID;
            }
            set
            {
                _tablaOtraMarcaID = value;
            }
        }

        private int _tablaEstadoCivilID;
        public int tablaEstadoCivilID
        {
            get
            {
                return _tablaEstadoCivilID;
            }
            set
            {
                _tablaEstadoCivilID = value;
            }
        }

        private int _tablaNivelEducativoID;
        public int tablaNivelEducativoID
        {
            get
            {
                return _tablaNivelEducativoID;
            }
            set
            {
                _tablaNivelEducativoID = value;
            }
        }

        private int _tablaReferenciaFamiliarTipoVinculoID;
        public int tablaReferenciaFamiliarTipoVinculoID
        {
            get
            {
                return _tablaReferenciaFamiliarTipoVinculoID;
            }
            set
            {
                _tablaReferenciaFamiliarTipoVinculoID = value;
            }
        }

        private int _tablaReferenciaNoFamiliarTipoVinculoID;
        public int tablaReferenciaNoFamiliarTipoVinculoID
        {
            get
            {
                return _tablaReferenciaNoFamiliarTipoVinculoID;
            }
            set
            {
                _tablaReferenciaNoFamiliarTipoVinculoID = value;
            }
        }

        private String _territorioCodigo;
        public String territorioCodigo
        {
            get
            {
                return _territorioCodigo;
            }
            set
            {
                _territorioCodigo = value;
            }
        }

        private String _consultoraRecomendadoraCodigo;
        public String consultoraRecomendadoraCodigo
        {
            get
            {
                return _consultoraRecomendadoraCodigo;
            }
            set
            {
                _consultoraRecomendadoraCodigo = value;
            }
        }

        private String _apellidoPaterno;
        public String apellidoPaterno
        {
            get
            {
                return _apellidoPaterno;
            }
            set
            {
                _apellidoPaterno = value;
            }
        }

        private String _apellidoMaterno;
        public String apellidoMaterno
        {
            get
            {
                return _apellidoMaterno;
            }
            set
            {
                _apellidoMaterno = value;
            }
        }

        private String _nombres;
        public String nombres
        {
            get
            {
                return _nombres;
            }
            set
            {
                _nombres = value;
            }
        }

        private String _numeroDocumento;
        public String numeroDocumento
        {
            get
            {
                return _numeroDocumento;
            }
            set
            {
                _numeroDocumento = value;
            }
        }

        private String _telefonoCasa;
        public String telefonoCasa
        {
            get
            {
                return _telefonoCasa;
            }
            set
            {
                _telefonoCasa = value;
            }
        }

        private String _telefonoCelular;
        public String telefonoCelular
        {
            get
            {
                return _telefonoCelular;
            }
            set
            {
                _telefonoCelular = value;
            }
        }

        private String _email;
        public String email
        {
            get
            {
                return _email;
            }
            set
            {
                _email = value;
            }
        }

        private String _fechaNacimiento;
        public String fechaNacimiento
        {
            get
            {
                return _fechaNacimiento;
            }
            set
            {
                _fechaNacimiento = value;
            }
        }

        private String _solicitudDireccion;
        public String solicitudDireccion
        {
            get
            {
                return _solicitudDireccion;
            }
            set
            {
                _solicitudDireccion = value;
            }
        }

        private String _solicitudCodigoPostal;
        public String solicitudCodigoPostal
        {
            get
            {
                return _solicitudCodigoPostal;
            }
            set
            {
                _solicitudCodigoPostal = value;
            }
        }

        private String _solicitudReferencia;
        public String solicitudReferencia
        {
            get
            {
                return _solicitudReferencia;
            }
            set
            {
                _solicitudReferencia = value;
            }
        }

        private String _solicitudDivisionPolitica1;
        public String solicitudDivisionPolitica1
        {
            get
            {
                return _solicitudDivisionPolitica1;
            }
            set
            {
                _solicitudDivisionPolitica1 = value;
            }
        }

        private String _solicitudDivisionPolitica2;
        public String solicitudDivisionPolitica2
        {
            get
            {
                return _solicitudDivisionPolitica2;
            }
            set
            {
                _solicitudDivisionPolitica2 = value;
            }
        }

        private String _entregaDireccion;
        public String entregaDireccion
        {
            get
            {
                return _entregaDireccion;
            }
            set
            {
                _entregaDireccion = value;
            }
        }

        private String _entregaCodigoPostal;
        public String entregaCodigoPostal
        {
            get
            {
                return _entregaCodigoPostal;
            }
            set
            {
                _entregaCodigoPostal = value;
            }
        }

        private String _entregaReferencia;
        public String entregaReferencia
        {
            get
            {
                return _entregaReferencia;
            }
            set
            {
                _entregaReferencia = value;
            }
        }

        private String _entregaDivisionPolitica;
        public String entregaDivisionPolitica
        {
            get
            {
                return _entregaDivisionPolitica;
            }
            set
            {
                _entregaDivisionPolitica = value;
            }
        }

        private String _referenciaFamiliarApellidoPaterno;
        public String referenciaFamiliarApellidoPaterno
        {
            get
            {
                return _referenciaFamiliarApellidoPaterno;
            }
            set
            {
                _referenciaFamiliarApellidoPaterno = value;
            }
        }

        private String _referenciaFamiliarApellidoMaterno;
        public String referenciaFamiliarApellidoMaterno
        {
            get
            {
                return _referenciaFamiliarApellidoMaterno;
            }
            set
            {
                _referenciaFamiliarApellidoMaterno = value;
            }
        }

        private String _referenciaFamiliarNombres;
        public String referenciaFamiliarNombres
        {
            get
            {
                return _referenciaFamiliarNombres;
            }
            set
            {
                _referenciaFamiliarNombres = value;
            }
        }

        private String _referenciaFamiliarDireccion;
        public String referenciaFamiliarDireccion
        {
            get
            {
                return _referenciaFamiliarDireccion;
            }
            set
            {
                _referenciaFamiliarDireccion = value;
            }
        }

        private String _referenciaFamiliarTelefono;
        public String referenciaFamiliarTelefono
        {
            get
            {
                return _referenciaFamiliarTelefono;
            }
            set
            {
                _referenciaFamiliarTelefono = value;
            }
        }
        private String _referenciaFamiliarCelular;
        public String referenciaFamiliarCelular
        {
            get
            {
                return _referenciaFamiliarCelular;
            }
            set
            {
                _referenciaFamiliarCelular = value;
            }
        }

        private String _referenciaNoFamiliarApellidoPaterno;
        public String referenciaNoFamiliarApellidoPaterno
        {
            get
            {
                return _referenciaNoFamiliarApellidoPaterno;
            }
            set
            {
                _referenciaNoFamiliarApellidoPaterno = value;
            }
        }

        private String _referenciaNoFamiliarApellidoMaterno;
        public String referenciaNoFamiliarApellidoMaterno
        {
            get
            {
                return _referenciaNoFamiliarApellidoMaterno;
            }
            set
            {
                _referenciaNoFamiliarApellidoMaterno = value;
            }
        }

        private String _referenciaNoFamiliarNombres;
        public String referenciaNoFamiliarNombres
        {
            get
            {
                return _referenciaNoFamiliarNombres;
            }
            set
            {
                _referenciaNoFamiliarNombres = value;
            }
        }

        private String _referenciaNoFamiliarDireccion;
        public String referenciaNoFamiliarDireccion
        {
            get
            {
                return _referenciaNoFamiliarDireccion;
            }
            set
            {
                _referenciaNoFamiliarDireccion = value;
            }
        }

        private String _referenciaNoFamiliarTelefono;
        public String referenciaNoFamiliarTelefono
        {
            get
            {
                return _referenciaNoFamiliarTelefono;
            }
            set
            {
                _referenciaNoFamiliarTelefono = value;
            }
        }

        private String _referenciaNoFamiliarCelular;
        public String referenciaNoFamiliarCelular
        {
            get
            {
                return _referenciaNoFamiliarCelular;
            }
            set
            {
                _referenciaNoFamiliarCelular = value;
            }
        }

        private String _adicionalProfesion;
        public String adicionalProfesion
        {
            get
            {
                return _adicionalProfesion;
            }
            set
            {
                _adicionalProfesion = value;
            }
        }

        private String _adicionalLugarTrabajo;
        public String adicionalLugarTrabajo
        {
            get
            {
                return _adicionalLugarTrabajo;
            }
            set
            {
                _adicionalLugarTrabajo = value;
            }
        }

        private String _adicionalTelefonoTrabajo;
        public String adicionalTelefonoTrabajo
        {
            get
            {
                return _adicionalTelefonoTrabajo;
            }
            set
            {
                _adicionalTelefonoTrabajo = value;
            }
        }

        private String _adicionalHoraVisita;
        public String adicionalHoraVisita
        {
            get
            {
                return _adicionalHoraVisita;
            }
            set
            {
                _adicionalHoraVisita = value;
            }
        }

        private int _adicionalNumeroHijos;
        public int adicionalNumeroHijos
        {
            get
            {
                return _adicionalNumeroHijos;
            }
            set
            {
                _adicionalNumeroHijos = value;
            }
        }

        private int _adicionalNumeroInfantes;
        public int adicionalNumeroInfantes
        {
            get
            {
                return _adicionalNumeroInfantes;
            }
            set
            {
                _adicionalNumeroInfantes = value;
            }
        }

        private int _adicionalNumeroEscolares;
        public int adicionalNumeroEscolares
        {
            get
            {
                return _adicionalNumeroEscolares;
            }
            set
            {
                _adicionalNumeroEscolares = value;
            }
        }

        private int _adicionalNumeroNivelSuperior;
        public int adicionalNumeroNivelSuperior
        {
            get
            {
                return _adicionalNumeroNivelSuperior;
            }
            set
            {
                _adicionalNumeroNivelSuperior = value;
            }
        }

        private int _adicionalNumeroAdultos;
        public int adicionalNumeroAdultos
        {
            get
            {
                return _adicionalNumeroAdultos;
            }
            set
            {
                _adicionalNumeroAdultos = value;
            }
        }

        private String _recPin;
        public String recPin
        {
            get
            {
                return _recPin;
            }
            set
            {
                _recPin = value;
            }
        }

        private String _recIMSI;
        public String recIMSI
        {
            get
            {
                return _recIMSI;
            }
            set
            {
                _recIMSI = value;
            }
        }

        private String _recLongitud;
        public String recLongitud
        {
            get
            {
                return _recLongitud;
            }
            set
            {
                _recLongitud = value;
            }
        }

        private String _recLatitud;
        public String recLatitud
        {
            get
            {
                return _recLatitud;
            }
            set
            {
                _recLatitud = value;
            }
        }

        private String _recMargen;
        public String recMargen
        {
            get
            {
                return _recMargen;
            }
            set
            {
                _recMargen = value;
            }
        }

        private int _recNumeroSatelites;
        public int recNumeroSatelites
        {
            get
            {
                return _recNumeroSatelites;
            }
            set
            {
                _recNumeroSatelites = value;
            }
        }

        private String _recObservacion;
        public String recObservacion
        {
            get
            {
                return _recObservacion;
            }
            set
            {
                _recObservacion = value;
            }
        }

        private String _recFechaVisita;
        public String recFechaVisita
        {
            get
            {
                return _recFechaVisita;
            }
            set
            {
                _recFechaVisita = value;
            }
        }

        private String _fecRegIni;
        public String fecRegIni
        {
            get
            {
                return _fecRegIni;
            }
            set
            {
                _fecRegIni = value;
            }
        }

        private String _fecRegFin;
        public String fecRegFin
        {
            get
            {
                return _fecRegFin;
            }
            set
            {
                _fecRegFin = value;
            }
        }
        private String _fechaRegistro;
        public String fechaRegistro
        {
            get
            {
                return _fechaRegistro;
            }
            set
            {
                _fechaRegistro = value;
            }
        }

        private bool _modoGrabacion;
        public bool modoGrabacion
        {
            get
            {
                return _modoGrabacion;
            }
            set
            {
                _modoGrabacion = value;
            }
        }

        private int _modoGrabacionInt;
        public int ModoGrabacionInt
        {
            get { return _modoGrabacionInt; }
            set { _modoGrabacionInt = value; }
        }


        private bool _estadoVerificado;
        public bool estadoVerificado
        {
            get
            {
                return _estadoVerificado;
            }
            set
            {
                _estadoVerificado = value;
            }
        }

        private int _estadoVerificadoInt;
        public int EstadoVerificadoInt
        {
            get { return _estadoVerificadoInt; }
            set { _estadoVerificadoInt = value; }
        }

        private bool _estadoDescargado;
        public bool estadoDescargado
        {
            get
            {
                return _estadoDescargado;
            }
            set
            {
                _estadoDescargado = value;
            }
        }

        private bool _estadoActivo;
        public bool estadoActivo
        {
            get
            {
                return _estadoActivo;
            }
            set
            {
                _estadoActivo = value;
            }
        }
 
    }
}
