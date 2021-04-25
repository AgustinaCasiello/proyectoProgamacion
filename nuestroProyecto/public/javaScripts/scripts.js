let express = require('express');
let router = express.Router();
let controllers = require('../../views/partials/head.ejs');

router.get('/', controllers.index)

module.exports = router;