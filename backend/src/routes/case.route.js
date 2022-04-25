const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/case.controller')
const router = Router();


router.get('/api/case', consultar);
router.post('/api/case/registro', guardar);
router.put('/api/case/modificar', modificar);
router.delete('/api/case/eliminar/:id', eliminar);



module.exports = router;