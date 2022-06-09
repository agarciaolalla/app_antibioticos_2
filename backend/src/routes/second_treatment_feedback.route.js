const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/second_treatment_feedback.controller')
const router = Router();


router.get('/api/second_treatment_feedback', consultar);
router.post('/api/second_treatment_feedback/registro', guardar);
router.put('/api/second_treatment_feedback/modificar', modificar);
router.delete('/api/second_treatment_feedback/eliminar/:id', eliminar);



module.exports = router;