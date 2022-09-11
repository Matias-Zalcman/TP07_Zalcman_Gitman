using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_Gitman_Zalcman.Models;

namespace TP07_Gitman_Zalcman.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Play(string Idioma)
    {
        ViewBag.idioma = Idioma;
        return View();
    }

    public IActionResult Player(string Idioma)
    {
        ViewBag.idioma = Idioma;
        return View();
    }

    [HttpPost]
    public IActionResult Jugar(string Nombre, string Idioma)
    {
        JuegoQQSM.IniciarJuego(Nombre, Idioma);
        ViewBag.pregunta = JuegoQQSM.ObtenerPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        ViewBag.posPozo = JuegoQQSM.DevolverPosicionPozo();
        ViewBag.opcionSeleccionada = 'Z';
        ViewBag.listaDescarte = new List<char>();
        ViewBag.listaDescarte.Add(ViewBag.opcionSeleccionada);
        return View("Pregunta");
    }

    public IActionResult ComodinUsado(int comodin)
    {
        ViewBag.opcionSeleccionada = 'Z';
        ViewBag.listaDescarte = new List<char>();
        ViewBag.listaDescarte.Add(ViewBag.opcionSeleccionada);
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        switch(comodin)
        {
            case 1:
            ViewBag.listaDescarte = JuegoQQSM.Descartar50();
            break;

            case 2:
            JuegoQQSM.DoblarChance();
            break;

            case 3:
            char opcionCorrecta = JuegoQQSM.ObtenerOpcionCorrecta();
            bool preguntaSalteada = JuegoQQSM.RespuestaUsuario(opcionCorrecta);
            JuegoQQSM.SaltearPregunta();
            break;
        }
        ViewBag.pregunta = JuegoQQSM.ObtenerPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        ViewBag.posPozo = JuegoQQSM.DevolverPosicionPozo();
        if(comodin == 2)
        {
            return View("Pregunta2");
        }
        else
        {
            return View("Pregunta");
        }
    }

    public IActionResult PreguntaRespondida(char Opcion)
    {
        ViewBag.pregunta = JuegoQQSM.ObtenerPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        ViewBag.posPozo = JuegoQQSM.DevolverPosicionPozo();
        ViewBag.opcionSeleccionada = Opcion;
        if(JuegoQQSM.RespuestaUsuario(Opcion))
        {
            return View("RespuestapreguntaOk");
        }
        else
        {
            ViewBag.opcionCorrecta = JuegoQQSM.ObtenerOpcionCorrecta();
            return View("RespuestapreguntaMal");
        }
    }

    public IActionResult PreguntaRespondidaPrimerChance(char Opcion)
    {
        ViewBag.pregunta = JuegoQQSM.ObtenerPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        ViewBag.posPozo = JuegoQQSM.DevolverPosicionPozo();
        ViewBag.opcionSeleccionada = Opcion;
        ViewBag.listaDescarte = new List<char>();
        ViewBag.listaDescarte.Add(ViewBag.opcionSeleccionada);
        if(JuegoQQSM.RespuestaUsuario(Opcion))
        {
            return View("RespuestapreguntaOk");
        }
        else
        {
            return View("Pregunta");
        }
    }

    public IActionResult Avanzar()
    {
        JuegoQQSM.CambiarPregunta();
        ViewBag.pregunta = JuegoQQSM.ObtenerPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        ViewBag.posPozo = JuegoQQSM.DevolverPosicionPozo();
        ViewBag.opcionSeleccionada = 'Z';
        ViewBag.listaDescarte = new List<char>();
        ViewBag.listaDescarte.Add(ViewBag.opcionSeleccionada);
        return View("Pregunta");
    }

    public IActionResult FinDelJuego(bool error)
    {
        if(!error)
        {
            JuegoQQSM.Plantarse();
        }
        ViewBag.player = JuegoQQSM.DevolverJugador();
        return View("PantallaFindelJuego");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
