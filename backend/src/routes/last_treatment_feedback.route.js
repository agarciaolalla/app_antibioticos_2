const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/lasttreatmentfeedback.controller')
const router = Router();


router.get('/api/lasttreatmentfeedback', consultar);
router.post('/api/lasttreatmentfeedback/registro', guardar);
router.put('/api/lasttreatmentfeedback/modificar', modificar);
router.delete('/api/lasttreatmentfeedback/eliminar/:id', eliminar);



module.exports = router;