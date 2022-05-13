const caseService = require('../services/treatmentanswer.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        secondanswer: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        secondanswer: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        secondanswer: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        secondanswer: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};