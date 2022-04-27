const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/secondanswer.controller')
const router = Router();


router.get('/api/secondanswer', consultar);
router.post('/api/secondanswer/registro', guardar);
router.put('/api/secondanswer/modificar', modificar);
router.delete('/api/secondanswer/eliminar/:id', eliminar);



module.exports = router;