namespace TP07_Gitman_Zalcman.Models;

public class Pozo
{
    private int _Importe;
    private bool _ValorSeguro;

    public Pozo(int importe, bool valorSeguro)
    {
        _Importe = importe;
        _ValorSeguro = valorSeguro;
    }

    public int Importe
    {
        get { return _Importe; }
        set { _Importe = value; }
    }

    public bool ValorSeguro
    {
        get { return _ValorSeguro; }
        set { _ValorSeguro = value; }
    }
}