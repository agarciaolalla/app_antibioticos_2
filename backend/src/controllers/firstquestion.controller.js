const caseService = require('../services/firstquestion.service');

const guardar = async (req, res) => {
    console.log(req.body);
    res.json({
       firstquestion: await caseService.guardar(req.body)
    })
}

const consultar = async(req, res) => {
    res.json({
        firstquestion: await caseService.consultar()
    })
}

const modificar = async(req, res) => {
    res.json({
        firstquestion: await caseService.modificar(req.body)
    })
}

const eliminar = async(req, res) => {
    res.json({
        firstquestion: await caseService.eliminar(req.params.id)
    })
}



module.exports = {consultar, guardar, modificar, eliminar};