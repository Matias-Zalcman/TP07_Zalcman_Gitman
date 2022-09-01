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

    public IActionResult Player()
    {
        return View();
    }

    [HttpPost]
    public IActionResult Jugar(string Nombre)
    {
        JuegoQQSM.IniciarJuego(Nombre);
        ViewBag.pregunta = JuegoQQSM.ObtenerProximaPregunta();
        ViewBag.listaRespuestas = JuegoQQSM.ObtenerRespuestas();
        ViewBag.player = JuegoQQSM.DevolverJugador();
        ViewBag.listaPozo = JuegoQQSM.ListarPozo();
        return View("Pregunta");
    }

    public IActionResult PreguntaRespondida(char Opcion1, char Opcion2)
    {
        if(JuegoQQSM.RespuestaUsuario(Opcion1,Opcion2))
        {
            return View("RespuestapreguntaOk");
        }
        else
        {
            return View("RespuestapreguntaMal");
        }
    }

    public IActionResult FinDelJuego()
    {
        ViewBag.player = JuegoQQSM.DevolverJugador();
        return View("PantallaFindelJuego");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
