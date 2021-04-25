let autos = require('../products/nuestrosProductos');


const controller = {
    index: (req,res) => {
        res.render('index', {autos: autos.lista});        
    },
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
    register: (req,res) => {
        res.render('register');
    },
    product: (req,res) => {
            let idProducto = req.params.id; 
            autos.lista.forEach(element => {
                if (element.id == idProducto) {
                    res.render('product',{ product: element})
                } 
            });
    },
    profile: (req,res) => {
        res.render('profile', {title: 'Profile'});
    },
    productAdd: (req,res) => {
        res.render('product-add', {title: 'ProductAdd'});
    },
    search: (req,res) => {
        res.render('search-results', {autos: autos.lista});
    },
    profileEdit: (req,res) => {
        res.render('profile-edit', {title: 'ProfileEdit'});
    },
};
 
module.exports = controller; 