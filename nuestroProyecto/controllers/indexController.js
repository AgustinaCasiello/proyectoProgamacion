let autos = require('../products/nuestrosProductos');


const controller = {
    index: (req,res) => {
        let misAutos = [];
        for (let i = 0; i < 4; i++) {
            misAutos.push(autos.lista[i])               
        }
        res.render('index', {nuestrosProductos: misAutos});        
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