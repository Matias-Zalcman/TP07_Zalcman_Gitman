namespace TP07_Gitman_Zalcman.Models;

public class Pregunta
{
    private int _IdPregunta;
    private string _TextoPregunta;
    private int _NivelDificultad;

    public Pregunta(int idPregunta, string textoPregunta, int nivelDificultad)
    {
        _IdPregunta = idPregunta;
        _TextoPregunta = textoPregunta;
        _NivelDificultad = nivelDificultad;
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
}