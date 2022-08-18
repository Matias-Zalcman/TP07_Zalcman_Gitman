namespace TP07_Gitman_Zalcman.Models;

public class Respuesta
{
    private int _IdRespuesta;
    private int _IdPregunta;
    private char _OpcionRespuesta;
    private string _TextoRespuesta;
    private bool _Correcta;

    public Respuesta(int idRespuesta, int idPregunta, char opcionRespuesta, string textoRespuesta, bool correcta)
    {
        _IdRespuesta = idRespuesta;
        _IdPregunta = idPregunta;
        _OpcionRespuesta = opcionRespuesta;
        _TextoRespuesta = textoRespuesta;
        _Correcta = correcta;
    }

    public Respuesta()
    {

    }

    public int IdRespuesta
    {
        get { return _IdRespuesta; }
        set { _IdRespuesta = value; }
    }

    public int IdPregunta
    {
        get { return _IdPregunta; }
        set { _IdPregunta = value; }
    }

    public char OpcionRespuesta
    {
        get { return _OpcionRespuesta; }
        set { _OpcionRespuesta = value; }
    }

    public string TextoRespuesta
    {
        get { return _TextoRespuesta; }
        set { _TextoRespuesta = value; }
    }

    public bool Correcta
    {
        get { return _Correcta; }
        set { _Correcta = value; }
    }
}