const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/thirdanswer.controller')
const router = Router();


router.get('/api/thirdanswer', consultar);
router.post('/api/thirdanswer/registro', guardar);
router.put('/api/thirdanswer/modificar', modificar);
router.delete('/api/thirdanswer/eliminar/:id', eliminar);



module.exports = router;