let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.search)

module.exports = router; 