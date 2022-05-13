const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnosticfeedback.controller')
const router = Router();


router.get('/api/diagnosticfeedback', consultar);
router.post('/api/diagnosticfeedback/registro', guardar);
router.put('/api/diagnosticfeedback/modificar', modificar);
router.delete('/api/diagnosticfeedback/eliminar/:id', eliminar);



module.exports = router;