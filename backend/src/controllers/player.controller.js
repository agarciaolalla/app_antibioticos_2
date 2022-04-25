const playerService = require('../services/player.service');

const agregarplayer = async (req, res) => {
    console.log(req.body);
    res.json({
       player: await playerService.guardarplayer(req.body)

    })

}

const consultarplayer = async(req, res) => {
    res.json({
        player: await playerService.consultarplayer()
    })
}

const modificarplayer = async(req, res) => {
    res.json({
        player: await playerService.modificarplayer(req.body)
    })
}

const eliminarplayer = async(req, res) => {
    res.json({
        player: await playerService.eliminarplayer(req.params.id)
    })
}



module.exports = {consultarplayer, agregarplayer, modificarplayer, eliminarplayer};