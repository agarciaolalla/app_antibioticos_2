const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/first_treatment_feedback.controller')
const router = Router();


router.get('/api/first_treatment_feedback', consultar);
router.post('/api/first_treatment_feedback/registro', guardar);
router.put('/api/first_treatment_feedback/modificar', modificar);
router.delete('/api/first_treatment_feedback/eliminar/:id', eliminar);



module.exports = router;