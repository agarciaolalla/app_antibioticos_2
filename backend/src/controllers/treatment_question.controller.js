const caseService = require('../services/treatment_question.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        treatment_question: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        treatment_question: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        treatment_question: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        treatment_question: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};