namespace TP07_Gitman_Zalcman.Models;

public class Pregunta
{
    private int _IdPregunta;
    private string _TextoPregunta;
    private int _NivelDificultad;
    private int _Orden;
    private string _Idioma;

    public Pregunta(int idPregunta, string textoPregunta, int nivelDificultad, int orden, string idioma)
    {
        _IdPregunta = idPregunta;
        _TextoPregunta = textoPregunta;
        _NivelDificultad = nivelDificultad;
        _Orden = orden;
        _Idioma = idioma;
    }

    public Pregunta()
    {

    }

    public int IdPregunta
    {
        get { return _IdPregunta; }
        set { _IdPregunta = value; }
    }

    public string TextoPregunta
    {
        get { return _TextoPregunta; }
        set { _TextoPregunta = value; }
    }

    public int NivelDificultad
    {
        get { return _NivelDificultad; }
        set { _NivelDificultad = value; }
    }

    public int Orden
    {
        get { return _Orden; }
        set { _Orden = value; }
    }

    public string Idioma
    {
        get { return _Idioma; }
        set { _Idioma = value; }
    }
}