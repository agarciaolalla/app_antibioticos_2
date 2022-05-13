const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/firsttreatmentfeedback.controller')
const router = Router();


router.get('/api/firsttreatmentfeedback', consultar);
router.post('/api/firsttreatmentfeedback/registro', guardar);
router.put('/api/firsttreatmentfeedback/modificar', modificar);
router.delete('/api/firsttreatmentfeedback/eliminar/:id', eliminar);



module.exports = router;