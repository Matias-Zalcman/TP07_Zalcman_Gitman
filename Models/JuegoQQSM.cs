using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;

namespace TP07_Gitman_Zalcman.Models;

public static class JuegoQQSM
{
    private static string _connectionString = @"Server=.;DataBase=JuegoQQSM;Trusted_Connection=True;";
    private static int _PreguntaActual;
    private static char _RespuestaCorrectaActual;
    private static int _PosicionPozo;
    private static int _PozoAcumuladoSeguro;
    private static int _PozoAcumulado;
    private static bool _Comodin5050, _ComodinDobleChance, _ComodinSaltearPregunta;
    private static List<Pozo> _ListaPozo = new List<Pozo>();
    private static Jugador _Player = new Jugador();

    public static void IniciarJuego(string Nombre)
    {
        _PreguntaActual = 0;
        _PosicionPozo = 0;
        _PozoAcumuladoSeguro = 0;
        _PozoAcumulado = 0;
        _Comodin5050 = true;
        _ComodinDobleChance = true;
        _ComodinSaltearPregunta = true;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Jugadores VALUES(@pNombre, @pFechaHora, @pPozoGanado, @pComodinDC, @pComodin50, @pComodinSaltear)";
            db.Execute(sql, new {pNombre = Nombre, pFechaHora = DateTime.Now, pPozoGanado = _PozoAcumuladoSeguro, pComodinDC = _ComodinDobleChance, pComodin50 = _Comodin5050, pComodinSaltear = _ComodinSaltearPregunta});
        }
    }
    public static Pregunta ObtenerProximaPregunta()
    {
        if(_PreguntaActual == 4)
        {
            _PreguntaActual = 6;
        }
        else
        {
            _PreguntaActual++;
        }
        Pregunta Pregunta = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Preguntas.* FROM Preguntas WHERE Preguntas.IdPregunta = @pPregunta";
            Pregunta = db.QueryFirstOrDefault<Pregunta>(sql, new {pPregunta = _PreguntaActual});
        }
        return Pregunta;
    }
    public static List<Respuesta> ObtenerRespuestas()
    {
        List<Respuesta> ListaRespuestas = new List<Respuesta>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Respuestas.* FROM Respuestas WHERE Respuestas.IdPregunta = @pPregunta";
            ListaRespuestas = db.Query<Respuesta>(sql, new {pPregunta = _PreguntaActual}).ToList();
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
    public static bool RespuestaUsuario(char Opcion, char OpcionComodin)
    {
        if(OpcionComodin == 'A' || OpcionComodin == 'B' || OpcionComodin == 'C' || OpcionComodin == 'D')
        {
            Opcion = OpcionComodin;
            _ComodinDobleChance = false;
            _Player.ComodinDobleChance = false;
            int registrosModificados = 0;
            string sql = "UPDATE Jugadores SET ComodinDobleChance = @pComodin WHERE IdJugador = @pIdJug";
            using(SqlConnection db = new SqlConnection(_connectionString))
            {
                registrosModificados = db.Execute(sql, new {pComodin = _ComodinDobleChance, pIdJug = _Player.IdJugador});
            }
        }
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
                sql = "SELECT TOP 2 Respuestas.OpcionRespuesta FROM Respuestas WHERE Respuestas.IdPregunta = @pPregunta and Respuestas.Correcta = false";
                ListaDescarte = db.Query<char>(sql, new {pPregunta = _PreguntaActual}).ToList();
            }
        }
        return ListaDescarte;
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
            if(_PreguntaActual == 4)
            {
                _PreguntaActual = 6;
            }
            else
            {
                _PreguntaActual++;
            }
        }
    }
    public static Jugador DevolverJugador()
    {
        return _Player;
    }


}