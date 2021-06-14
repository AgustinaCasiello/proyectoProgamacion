module.exports = (sequelize, dataTypes) => {
    const Comentarios = sequelize.define('Comentarios', {  
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER,
        },
        text: {
            type: dataTypes.STRING,
        },
        id_usuario: {
            type: dataTypes.INTEGER
        },
        id_producto: {
            type: dataTypes.INTEGER
        }

    },{
        tableName: "comentarios",
        timestamps: false, //"By default, Sequelize will add the attributes createdAt and updatedAt to your model so you will be able to know when the database entry went into the db and when it was updated last."
    });
    Comentarios.associate = (db) => {
        Comentarios.belongsTo(db.Producto, {
            as: 'Cprodu', //Para indicar como vamos a hacer referencia a esa relación más adelante, en donde querramos utilizarlo
            foreignKey: 'id_producto',
        });
        Comentarios.belongsTo(db.Usuario,{
            as: 'Cuser',
            foreignKey: 'id_usuario'
        });
    };

    return Comentarios; 
}