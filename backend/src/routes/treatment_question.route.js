const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/treatmentquestion.controller')
const router = Router();


router.get('/api/treatmentquestion', consultar);
router.post('/api/treatmentquestion/registro', guardar);
router.put('/api/treatmentquestion/modificar', modificar);
router.delete('/api/treatmentquestion/eliminar/:id', eliminar);



module.exports = router;