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
        _PreguntaActual = 1;
        using(SqlConnection dn = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Respuesta.OpcionRespuesta FROM Respuesta WHERE Respuesta.IdPregunta = @pPregunta and Respuesta.Correcta = 1";
            _RespuestaCorrectaActual = db.QueryFirstOrDefault<char>(sql, new {pPregunta = _PreguntaActual});
        }
        _PosicionPozo = 0;
        _PozoAcumuladoSeguro = 0;
        _PozoAcumulado = 0;
        _Comodin5050 = true;
        _ComodinDobleChance = true;
        _ComodinSaltearPregunta = true;
        using(SqlConnection dn = new SqlConnection(_connectionString))
        {
            string sql = "INSERT INTO Jugador VALUES(@pNombre, @pFechaHora, @pPozoGanado, @pComodinDC, @pComodin50, @pComodinSaltear)";
            db.Execute<char>(sql, new {pNombre = Nombre, pFechaHora = DateTime.Now, pPozoGanado = _PozoAcumuladoSeguro, pComodinDC = _ComodinDobleChance, pComodin50 = _Comodin5050, pComodinSaltear = _ComodinSaltearPregunta});
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
        using(SqlConnection dn = new SqlConnection(_connectionString))
        {
            string sql = "SELECT Pregunta.* FROM Pregunta WHERE Pregunta.IdPregunta = @pPregunta";
            Pregunta = db.QueryFirstOrDefault<Pregunta>(sql, new {pPregunta = _PreguntaActual});
        }
        return Pregunta;
    }
    public static List<Respuesta> ObtenerRespuestas()
    {
        
    }

}