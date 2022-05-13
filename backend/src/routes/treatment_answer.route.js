const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/treatmentanswer.controller')
const router = Router();


router.get('/api/treatmentanswer', consultar);
router.post('/api/treatmentanswer/registro', guardar);
router.put('/api/treatmentanswer/modificar', modificar);
router.delete('/api/treatmentanswer/eliminar/:id', eliminar);



module.exports = router;