const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/last_treatment_feedback.controller')
const router = Router();


router.get('/api/last_treatment_feedback', consultar);
router.post('/api/last_treatment_feedback/registro', guardar);
router.put('/api/last_treatment_feedback/modificar', modificar);
router.delete('/api/last_treatment_feedback/eliminar/:id', eliminar);



module.exports = router;