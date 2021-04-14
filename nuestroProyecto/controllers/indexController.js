//const electrodomesticos = require('../products/nuestrosProductos');
const controller = {
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
};
 
module.exports = controller; 