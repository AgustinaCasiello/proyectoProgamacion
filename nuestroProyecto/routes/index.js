let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/', controllers.index)

module.exports = router;
