let express = require('express');
let router = express.Router();
let controllers = require('../controllers/indexController');

router.get('/search-results', controllers.buscar);

module.exports = router;