const { Router } = require('express');
const { consultar, guardar, modificar, eliminar} = require('../controllers/diagnostictanswer.controller')
const router = Router();


router.get('/api/diagnostictanswer', consultar);
router.post('/api/diagnostictanswer/registro', guardar);
router.put('/api/diagnostictanswer/modificar', modificar);
router.delete('/api/diagnostictanswer/eliminar/:id', eliminar);



module.exports = router;