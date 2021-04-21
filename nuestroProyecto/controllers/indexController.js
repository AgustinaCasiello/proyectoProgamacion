let autos = require('../products/nuestrosProductos');
console.log(autos);

const controller = {
    index: (req,res) => {
        res.render('index', {title: 'Index'});
    },
    login: (req,res) => {
        res.render('login', {title: 'Login'});
    },
    register: (req,res) => {
        res.render('register');
    },
    product: (req,res) => {
        res.render('product', {title: 'product'});
    },
    profile: (req,res) => {
        res.render('profile', {title: 'Profile'});
    },
    productAdd: (req,res) => {
        res.render('productAdd', {title: 'ProductAdd'});
    },
    search: (req,res) => {
        res.render('search-results', {autos: autos.lista});
    },
    profileEdit: (req,res) => {
        res.render('profileEdit', {title: 'ProfileEdit'});
    },
    
    
};
 
module.exports = controller; 