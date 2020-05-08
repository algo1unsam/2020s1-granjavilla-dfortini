import wollok.game.*

object hector {

	var property position = new Position(x = 3, y = 3)
	const property image = "player.png"

	method sembrar(cultivo) {
		if (not game.colliders(self).isEmpty()) {
			self.error("Ya esta ocupado")
		}
		cultivo.sembrarDondeEsta(self)
	}

	method regar() {
		try {
			const cultivo = game.uniqueCollider(self)
			cultivo.regar()
		} catch e {
			self.error("No hay nada para regar")
		}
	}

}

object aspersor {

	var property position = new Position(x = 4, y = 4)

	method image() {
		return "aspersor.png"
	}

	method regar() {
		self.posicionesVecinas().forEach({posicionVecina => self.regarCultivoAt(posicionVecina)})
	}

	method regarCultivoAt(posicionVecina) {
		const obj = if(!game.getObjectsIn(posicionVecina).isEmpty()) game.getObjectsIn(posicionVecina).first() else null
		if (obj != null) obj.regar()
	}

	method posicionesVecinas() {
		return [ position.up(1).left(1), position.up(1), position.up(1).right(1), position.left(1), position.right(1), 
			position.down(1), position.down(1).left(1), position.right(1) 
		]
	}

}

