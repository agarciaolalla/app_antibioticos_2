const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnosticquestion.controller')
const router = Router();


router.get('/api/diagnosticquestion', consultar);
router.post('/api/diagnosticquestion/registro', guardar);
router.put('/api/diagnosticquestion/modificar', modificar);
router.delete('/api/diagnosticquestion/eliminar/:id', eliminar);



module.exports = router;