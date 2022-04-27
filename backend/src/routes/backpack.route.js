const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/backpack.controller')
const router = Router();


router.get('/api/backpack', consultar);
router.post('/api/backpack/registro', guardar);
router.put('/api/backpack/modificar', modificar);
router.delete('/api/backpack/eliminar/:id', eliminar);



module.exports = router;