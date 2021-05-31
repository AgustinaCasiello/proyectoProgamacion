let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

router.get('/profile-edit', controllers.profileEdit);

router.get('/profile', controllers.profile);
router.get('/profile/:id', controllers.profile);


router.get('/register', controllers.register);
router.post('/register', controllers.registerPost);

router.get('/login', controllers.login);
router.post('/login', controllers.loginFiltrado);

module.exports = router;