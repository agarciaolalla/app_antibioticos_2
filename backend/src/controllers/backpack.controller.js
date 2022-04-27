const caseService = require('../services/backpack.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        backpack: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        backpack: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        backpack: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        backpack: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};