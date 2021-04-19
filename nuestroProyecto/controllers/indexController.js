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
    
};
 
module.exports = controller; 