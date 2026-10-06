import grupos.*

class Gladiador {
    var vida = self.vidaInicial()

    method vidaInicial() = 100
    method vida() = vida
    method fuerza()
    method destreza()
    method poderDeAtaque()
    method defensa()
    method nombreDeGrupoCon(colega)

    method puedeCombatir() = vida > 0

    method atacar(otro) {
        const danio = (self.poderDeAtaque() - otro.defensa()).max(0)
        otro.recibirDanio(danio)
    }

    method recibirDanio(cantidad) {
        vida = (vida - cantidad).max(0)
    }

    method pelear(otro) {
        self.atacar(otro)
        if (otro.puedeCombatir()) otro.atacar(self)
    }

    method armarGrupoCon(colega) {
        return new Grupo(nombre = self.nombreDeGrupoCon(colega), miembros = [self, colega])
    }

    method curar() {
        vida = self.vidaInicial()
    }

    // Protocolo compartido con Grupo para poder enfrentarse en el coliseo
    method campeon() = self
    method registrarCombate() {}
}

class Mirmillon inherits Gladiador {
    const fuerza
    var arma
    var armadura

    override method fuerza() = fuerza
    override method destreza() = 15
    override method poderDeAtaque() = arma.poderDeAtaque() + fuerza
    override method defensa() = armadura.puntosDeArmadura(self) + self.destreza()
    override method nombreDeGrupoCon(colega) = "mirmillolandia"

    method cambiarArma(nuevaArma) {
        arma = nuevaArma
    }

    method cambiarArmadura(nuevaArmadura) {
        armadura = nuevaArmadura
    }
}

class Dimachaerus inherits Gladiador {
    var destreza
    const armas = []

    override method fuerza() = 10
    override method destreza() = destreza
    override method poderDeAtaque() = self.fuerza() + armas.sum({ a => a.poderDeAtaque() })
    override method defensa() = destreza / 2
    override method nombreDeGrupoCon(colega) {
        return "D-" + (self.poderDeAtaque() + colega.poderDeAtaque())
    }

    override method atacar(otro) {
        super(otro)
        destreza += 1
    }

    method agregarArma(unArma) {
        armas.add(unArma)
    }

    method quitarArma(unArma) {
        armas.remove(unArma)
    }
}
