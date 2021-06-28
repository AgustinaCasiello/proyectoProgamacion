module.exports = (sequelize, dataTypes) => {
    const Produ = sequelize.define('Producto', { // → nombre que voy a usar dentro del controlador
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER,
        },
        nombre: {
            type: dataTypes.STRING,
        },
        image_URL: {
            type: dataTypes.STRING,
        },
        fecha_creacion: {
            type: dataTypes.DATE,
        }, 
        id_usuario:{
            type: dataTypes.INTEGER,
        },
        descripcion: {
            type: dataTypes.STRING,
        },
    },{
        tableName: "productos", //Tiene que ser igual a lo que veo en workbrench / tabla de SQL
        timestamps: false, //"By default, Sequelize will add the attributes createdAt and updatedAt to your model so you will be able to know when the database entry went into the db and when it was updated last."
    });
    Produ.associate = (db) => {
        Produ.belongsTo(db.Usuario, {
            as: 'userP', //Para indicar como vamos a hacer referencia a esa relación más adelante, en donde querramos utilizarlo
            foreignKey: 'id_usuario',
        });
        Produ.hasMany(db.Comentario,{
            as:'comentarioP',
            foreignKey: 'id_producto'
        });
    };

    return Produ; 
}
