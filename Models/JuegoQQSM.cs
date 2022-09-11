using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace TP07_Gitman_Zalcman.Models;

public static class JuegoQQSM
{
    private static string _connectionString = @"Server=.;DataBase=JuegoQQSM;Trusted_Connection=True;";
    private static string _Idioma;
    private static int _PreguntaActual;
    private static char _RespuestaCorrectaActual;
    private static int _PosicionPozo;
    private static int _PozoAcumuladoSeguro;
    private static int _PozoAcumulado;
    private static bool _Comodin5050, _ComodinDobleChance, _ComodinSaltearPregunta;
    private static List<Pozo> _ListaPozo = new List<Pozo>();
    private static Jugador _Player = new Jugador();

    public static void IniciarJuego(string Nombre, string Idioma)
    {
        _Idioma = Idioma;
        _PreguntaActual = 1;
        _PosicionPozo = -1;
        _PozoAcumuladoSeguro = 0;
        _PozoAcumulado = 0;
        _Comodin5050 = true;
        _ComodinDobleChance = true;
        _ComodinSaltearPregunta = true;
        _Player = new Jugador(1, Nombre, DateTime.Now, _PozoAcumuladoSeguro, _ComodinDobleChance, _Comodin5050, _ComodinSaltearPregunta, _Idioma);
        int registrosAñadidos = 0;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Jugadores VALUES(@pNombre, @pFechaHora, @pPozoGanado, @pComodinDC, @pComodin50, @pComodinSaltear, @pIdioma)";
            registrosAñadidos = db.Execute(sql, new {pNombre = _Player.Nombre, pFechaHora = _Player.FechaHora, pPozoGanado = _Player.PozoGanado, pComodinDC = _Player.ComodinDobleChance, pComodin50 = _Player.Comodin50, pComodinSaltear = _Player.ComodinSaltear, pIdioma = _Player.Idioma});
        }
    }
    public static Pregunta ObtenerPregunta()
    {
        Pregunta Pregunta = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Preguntas.* FROM Preguntas WHERE Preguntas.Orden = @pPregunta and Preguntas.Idioma = @pIdioma";
            Pregunta = db.QueryFirstOrDefault<Pregunta>(sql, new {pPregunta = _PreguntaActual, pIdioma = _Idioma});
        }
        return Pregunta;
    }
    public static void CambiarPregunta()
    {
        _PreguntaActual++;
    }
    public static List<Respuesta> ObtenerRespuestas()
    {
        List<Respuesta> ListaRespuestas = new List<Respuesta>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Respuestas.* FROM Respuestas INNER JOIN Preguntas on Preguntas.IdPregunta = Respuestas.IdPregunta WHERE Preguntas.Orden = @pPregunta and Preguntas.Idioma = @pIdioma";
            ListaRespuestas = db.Query<Respuesta>(sql, new {pPregunta = _PreguntaActual, pIdioma = _Idioma}).ToList();
        }
        foreach(Respuesta respuesta in ListaRespuestas)
        {
            if(respuesta.Correcta)
            {
                _RespuestaCorrectaActual = respuesta.OpcionRespuesta;
            }
        }
        return ListaRespuestas;
    }
    public static char ObtenerOpcionCorrecta()
    {
        return _RespuestaCorrectaActual;
    }
    public static bool RespuestaUsuario(char Opcion)
    {
        if(Opcion == _RespuestaCorrectaActual)
        {
            _PosicionPozo++;
            _PozoAcumulado = _ListaPozo[_PosicionPozo].Importe;
            if(_ListaPozo[_PosicionPozo].ValorSeguro)
            {
                _PozoAcumuladoSeguro = _ListaPozo[_PosicionPozo].Importe;
                _Player.PozoGanado = _ListaPozo[_PosicionPozo].Importe;
                int registrosModificados = 0;
                string sql = "UPDATE Jugadores SET PozoGanado = @pPozo WHERE IdJugador = @pIdJug";
                using(SqlConnection db = new SqlConnection(_connectionString))
                {
                    registrosModificados = db.Execute(sql, new {pPozo = _Player.PozoGanado, pIdJug = _Player.IdJugador});
                }
            }
        }
        return (Opcion == _RespuestaCorrectaActual);
    }
    public static void Plantarse()
    {
        _PozoAcumuladoSeguro = _ListaPozo[_PosicionPozo].Importe;
        _Player.PozoGanado = _ListaPozo[_PosicionPozo].Importe;
        int registrosModificados = 0;
        string sql = "UPDATE Jugadores SET PozoGanado = @pPozo WHERE IdJugador = @pIdJug";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            registrosModificados = db.Execute(sql, new {pPozo = _Player.PozoGanado, pIdJug = _Player.IdJugador});
        }
    }
    public static List<Pozo> ListarPozo()
    {
        if(_ListaPozo.Count == 0)
        {
            _ListaPozo.Add(new Pozo(1000,false));
            _ListaPozo.Add(new Pozo(3000,false));
            _ListaPozo.Add(new Pozo(5000,false));
            _ListaPozo.Add(new Pozo(10000,false));
            _ListaPozo.Add(new Pozo(20000,false));
            _ListaPozo.Add(new Pozo(30000,true));
            _ListaPozo.Add(new Pozo(50000,false));
            _ListaPozo.Add(new Pozo(80000,false));
            _ListaPozo.Add(new Pozo(100000,false));
            _ListaPozo.Add(new Pozo(150000,false));
            _ListaPozo.Add(new Pozo(180000,false));
            _ListaPozo.Add(new Pozo(200000,true));
            _ListaPozo.Add(new Pozo(300000,false));
            _ListaPozo.Add(new Pozo(400000,false));
            _ListaPozo.Add(new Pozo(500000,false));
            _ListaPozo.Add(new Pozo(1000000,false));
            _ListaPozo.Add(new Pozo(1500000,false));
            _ListaPozo.Add(new Pozo(2000000,true));
        }
        return _ListaPozo;
    }
    public static int DevolverPosicionPozo()
    {
        return _PosicionPozo;
    }
    public static List<char> Descartar50()
    {
        List<char> ListaDescarte = new List<char>();
        if(_Comodin5050)
        {
            _Comodin5050 = false;
            _Player.Comodin50 = false;
            int registrosModificados = 0;
            string sql = "UPDATE Jugadores SET Comodin50 = @pComodin WHERE IdJugador = @pIdJug";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                registrosModificados = db.Execute(sql, new {pComodin = _Comodin5050, pIdJug = _Player.IdJugador});
            }
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                sql = "SELECT TOP 2 Respuestas.OpcionRespuesta FROM Respuestas INNER JOIN Preguntas on Preguntas.IdPregunta = Respuestas.IdPregunta WHERE Preguntas.Orden = @pPregunta and Preguntas.Idioma = @pIdioma and Respuestas.Correcta = 0";
                ListaDescarte = db.Query<char>(sql, new {pPregunta = _PreguntaActual, pIdioma = _Idioma}).ToList();
            }
        }
        return ListaDescarte;
    }
    public static void DoblarChance()
    {
        if(_ComodinDobleChance)
        {
            _ComodinDobleChance = false;
            _Player.ComodinDobleChance = false;
            int registrosModificados = 0;
            string sql = "UPDATE Jugadores SET ComodinDobleChance = @pComodin WHERE IdJugador = @pIdJug";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                registrosModificados = db.Execute(sql, new {pComodin = _ComodinDobleChance, pIdJug = _Player.IdJugador});
            }
        }
    }
    public static void SaltearPregunta()
    {
        if(_ComodinSaltearPregunta)
        {
            _ComodinSaltearPregunta = false;
            _Player.ComodinSaltear = false;
            int registrosModificados = 0;
            string sql = "UPDATE Jugadores SET ComodinSaltear = @pComodin WHERE IdJugador = @pIdJug";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                registrosModificados = db.Execute(sql, new {pComodin = _ComodinSaltearPregunta, pIdJug = _Player.IdJugador});
            }
            CambiarPregunta();
        }
    }
    public static Jugador DevolverJugador()
    {
        return _Player;
    }


}
