const caseService = require('../services/secondquestion.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
       secondquestion: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        secondquestion: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        secondquestion: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        secondquestion: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};