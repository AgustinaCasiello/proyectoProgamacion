let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

router.get('/product-add', controllers.productAdd);
router.post('/product-add', controllers.crear);

router.get('/', controllers.product);
router.get('/product/:id?', controllers.product);
router.get('/productEdit', controllers.editarGet);
router.get('/editar', controllers.editarGet);
router.post('/editar', controllers.editarPost);
router.post('/borrar', controllers.borrar);


router.get('/search-results', controllers.buscar);

module.exports = router;