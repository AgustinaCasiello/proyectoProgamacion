
module.exports = (sequelize, dataTypes) => {
    const Usuario = sequelize.define('Usuario', {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING,
        },
        contrasena : {
            type: dataTypes.STRING,
        },
        fecha : {
            type : dataTypes.DATE,
        },
        text : {
            type: dataTypes.STRING,
        }
    },{
        tableName: "usuarios",
        timestamps: false, //"By default, Sequelize will add the attributes createdAt and updatedAt to your model so you will be able to know when the database entry went into the db and when it was updated last."
    });
    Usuario.associate = (db) => {
        Usuario.hasMany(db.Comentarios,{
            as:'comentarioUser',
            foreignKey: 'id_usuario'
        });
        Usuario.hasMany(db.Producto,{
            as:'UserProdu',
            foreignKey: 'id_usuario'
        });

    }
    return Usuario; 
}