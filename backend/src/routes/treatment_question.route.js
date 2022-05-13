const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/treatment_question.controller')
const router = Router();


router.get('/api/treatment_question', consultar);
router.post('/api/treatment_question/registro', guardar);
router.put('/api/treatment_question/modificar', modificar);
router.delete('/api/treatment_question/eliminar/:id', eliminar);



module.exports = router;