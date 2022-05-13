const caseService = require('../services/diagnostic_question.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        diagnostic_question: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        diagnostic_question: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        diagnostic_question: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        diagnostic_question: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};