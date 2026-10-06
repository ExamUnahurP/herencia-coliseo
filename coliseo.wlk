object coliseo {
    const rounds = 3

    // Sirve para grupo vs grupo, grupo vs gladiador suelto o gladiador vs gladiador
    method organizarCombate(unContendiente, otroContendiente) {
        unContendiente.registrarCombate()
        otroContendiente.registrarCombate()
        rounds.times({ n => self.disputarRound(unContendiente, otroContendiente) })
    }

    method disputarRound(unContendiente, otroContendiente) {
        if (unContendiente.puedeCombatir() && otroContendiente.puedeCombatir()) {
            unContendiente.campeon().pelear(otroContendiente.campeon())
        }
    }

    // Sirve para un grupo o para un gladiador suelto
    method curar(unContendiente) {
        unContendiente.curar()
    }
}
