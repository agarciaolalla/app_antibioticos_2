const caseService = require('../services/last_treatment_feedback.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        last_treatment_feedback: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        last_treatment_feedback: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        last_treatment_feedback: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        last_treatment_feedback: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};