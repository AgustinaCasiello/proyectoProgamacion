let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.product)
router.get('/:id', controllers.product);
router.post('/editar', controllers.editarPost); //??

module.exports = router;