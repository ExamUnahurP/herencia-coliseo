class Grupo {
    const nombre
    const miembros = []
    var peleas = 0

    method nombre() = nombre
    method cantidadDePeleas() = peleas
    method cantidadDeMiembros() = miembros.size()
    method contiene(unGladiador) = miembros.contains(unGladiador)

    method agregar(unGladiador) {
        miembros.add(unGladiador)
    }

    method quitar(unGladiador) {
        miembros.remove(unGladiador)
    }

    method miembrosQuePuedenCombatir() = miembros.filter({ m => m.puedeCombatir() })

    // Protocolo compartido con Gladiador para poder enfrentarse en el coliseo
    method puedeCombatir() = miembros.any({ m => m.puedeCombatir() })
    method campeon() = self.miembrosQuePuedenCombatir().max({ m => m.fuerza() })
    method registrarCombate() {
        peleas += 1
    }

    method curar() {
        miembros.forEach({ m => m.curar() })
    }
}
