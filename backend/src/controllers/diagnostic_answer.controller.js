const caseService = require('../services/diagnostic_answer.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        diagnostic_answer: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        diagnostic_answer: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        diagnostic_answer: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        diagnostic_answer: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};