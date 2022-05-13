const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnostic_answer.controller')
const router = Router();


router.get('/api/diagnostic_answer', consultar);
router.post('/api/diagnostic_answer/registro', guardar);
router.put('/api/diagnostic_answer/modificar', modificar);
router.delete('/api/diagnostic_answer/eliminar/:id', eliminar);



module.exports = router;