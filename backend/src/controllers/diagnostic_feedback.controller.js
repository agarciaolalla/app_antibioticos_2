const caseService = require('../services/diagnosticfeedback.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        firstanswer: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        firstanswer: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        firstanswer: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        firstanswer: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};