const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/initial_info.controller')
const router = Router();


router.get('/api/initial_info', consultar);
router.post('/api/initial_info/registro', guardar);
router.put('/api/initial_info/modificar', modificar);
router.delete('/api/initial_info/eliminar/:id', eliminar);



module.exports = router;