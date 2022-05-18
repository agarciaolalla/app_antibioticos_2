const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/treatment_feedback.controller')
const router = Router();


router.get('/api/treatment_feedback', consultar);
router.post('/api/treatment_feedback/registro', guardar);
router.put('/api/treatment_feedback/modificar', modificar);
router.delete('/api/treatment_feedback/eliminar/:id', eliminar);



module.exports = router;