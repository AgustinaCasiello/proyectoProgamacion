
module.exports = (sequelize, dataTypes) => {
    const Produ = sequelize.define('Producto', {
        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },
        nombre: {
            type: dataTypes.STRING
        },
        fecha_creacion: {
            type: dataTypes.DATE
        }, 
        id_usuario:{
            type: dataTypes.INTEGER
        }
    },{
        tableName: "productos",
        timestamps: false,
        underscored: true,
    });

    return Produ; 
}
