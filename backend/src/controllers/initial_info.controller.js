const caseService = require('../services/initial_info.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        initial_info: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        initial_info: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        initial_info: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        initial_info: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};