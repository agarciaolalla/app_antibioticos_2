const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnostic_feedback.controller')
const router = Router();


router.get('/api/diagnostic_feedback', consultar);
router.post('/api/diagnostic_feedback/registro', guardar);
router.put('/api/diagnostic_feedback/modificar', modificar);
router.delete('/api/diagnostic_feedback/eliminar/:id', eliminar);



module.exports = router;