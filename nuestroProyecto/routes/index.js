let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

router.get('/', controllers.index);
router.post('/borrar', controllers.borrar);

router.get('/productEdit', controllers.editarGet);

//router.get('/login', controllers.login);
//router.post('/login', controllers.loginFiltrado);
router.get('/exit', controllers.exit);


//router.get('/product-add', controllers.productAdd);
//router.post('/product-add', controllers.crear);

//router.get('/product', controllers.product);
//router.get('/product/:id', controllers.product);
//router.get('/product/editar', controllers.editarGet);
//router.post('/product/editar', controllers.editarPost);

//router.get('/'profile-edit, controllers.profileEdit);

//router.get('/profile', controllers.profile);
//router.get('/profile/:id', controllers.profile);


//router.get('/register', controllers.register);
//router.post('/register', controllers.registerPost);

//router.get('/search-results', controllers.buscar);


module.exports = router;
