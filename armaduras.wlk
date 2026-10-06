object casco {
    method puntosDeArmadura(portador) = 10
}

object escudo {
    method puntosDeArmadura(portador) = 5 + portador.destreza() * 0.1
}
