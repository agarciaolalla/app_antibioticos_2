const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnostic_question.controller')
const router = Router();


router.get('/api/diagnostic_question', consultar);
router.post('/api/diagnostic_question/registro', guardar);
router.put('/api/diagnostic_question/modificar', modificar);
router.delete('/api/diagnostic_question/eliminar/:id', eliminar);



module.exports = router;