let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.login);
router.post('/', controllers.loginFiltrado);


module.exports = router; 