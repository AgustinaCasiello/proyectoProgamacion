let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.productAdd)

router.post('/', controllers.crear)

module.exports = router; 