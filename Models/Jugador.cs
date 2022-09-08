namespace TP07_Gitman_Zalcman.Models;

public class Jugador
{
    private int _IdJugador;
    private string _Nombre;
    private DateTime _FechaHora;
    private int _PozoGanado;
    private bool _ComodinDobleChance;
    private bool _Comodin50;
    private bool _ComodinSaltear;
    private string _Idioma;

    public Jugador(int idJugador, string nombre, DateTime fechaHora, int pozoGanado, bool comodinDobleChance, bool comodin50, bool comodinSaltear, string idioma)
    {
        _IdJugador = idJugador;
        _Nombre = nombre;
        _FechaHora = fechaHora;
        _PozoGanado = pozoGanado;
        _ComodinDobleChance = comodinDobleChance;
        _Comodin50 = comodin50;
        _ComodinSaltear = comodinSaltear;
        _Idioma = idioma;
    }

    public Jugador()
    {

    }

    public int IdJugador
    {
        get { return _IdJugador; }
        set { _IdJugador = value; }
    }

    public string Nombre
    {
        get { return _Nombre; }
        set { _Nombre = value; }
    }

    public DateTime FechaHora
    {
        get { return _FechaHora; }
        set { _FechaHora = value; }
    }

    public int PozoGanado
    {
        get { return _PozoGanado; }
        set { _PozoGanado = value; }
    }

    public bool ComodinDobleChance
    {
        get { return _ComodinDobleChance; }
        set { _ComodinDobleChance = value; }
    }

    public bool Comodin50
    {
        get { return _Comodin50; }
        set { _Comodin50 = value; }
    }

    public bool ComodinSaltear
    {
        get { return _ComodinSaltear; }
        set { _ComodinSaltear = value; }
    }

    public string Idioma
    {
        get { return _Idioma; }
        set { _Idioma = value; }
    }
}