let autos = require('../products/nuestrosProductos');


const controller = {
    index: (req,res) => {
        res.render('index');        
    },
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
    register: (req,res) => {
        res.render('register');
    },
    product: (req,res) => {
            let idProducto = req.params.id; 
            autos.populares.forEach(element => {
                if (element.id == idProducto) {
                    res.render('product', {product: element})
                } 
            });
    },
    profile: (req,res) => {
        res.render('profile', {title: 'Profile'});
    },
    productAdd: (req,res) => {
        res.render('productAdd', {title: 'ProductAdd'});
    },
    search: (req,res) => {
        res.render('search-results', {autos: autos.populares});
    },
    profileEdit: (req,res) => {
        res.render('profileEdit', {title: 'ProfileEdit'});
    },
};
 
module.exports = controller; 