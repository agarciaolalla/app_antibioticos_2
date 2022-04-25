const caseService = require('../services/case.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
       case: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        case: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        case: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        case: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};