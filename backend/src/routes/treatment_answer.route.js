const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/treatment_answer.controller')
const router = Router();


router.get('/api/treatment_answer', consultar);
router.post('/api/treatment_answer/registro', guardar);
router.put('/api/treatment_answer/modificar', modificar);
router.delete('/api/treatment_answer/eliminar/:id', eliminar);



module.exports = router;