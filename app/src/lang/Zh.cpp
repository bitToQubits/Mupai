#include "Zh.h"

Zh::Zh(QObject *parent)
    : Lang{parent}
{
    setObjectName("Zh");
    home("Hogar");
    basic_input("Entrada básica");
    form("Formas");
    surface("Superficie");
    popus("Ventanas emergentes");
    navigation("Navegación");
    theming("Tema");
    media("Medio");
    dark_mode("Luces apagadas");
    sys_dark_mode("Modo oscuro del sistema");
    search("Buscar");
    about("Acerca de");
    settings("Configuración");
    locale("Configuración regional");
    navigation_view_display_mode("Modo de visualización de la vista de navegación");
}
