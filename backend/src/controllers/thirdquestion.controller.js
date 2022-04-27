const caseService = require('../services/thirdquestion.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
        thirdquestion: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        thirdquestion: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        thirdquestion: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        thirdquestion: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};