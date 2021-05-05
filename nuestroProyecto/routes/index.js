let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

let db = require('../database/models')

router.get('/', controllers.index)

module.exports = router;
