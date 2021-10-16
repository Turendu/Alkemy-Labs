const { DataTypes, Model } = require('sequelize');
const sequelize = require('../../config/database');

class Character extends Model { }

Character.init({
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    age: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    weight: {
        type: DataTypes.STRING
    },
    history: {
        type: DataTypes.STRING
    },
    movie_id: {
        type: DataTypes.INTEGER,
        references: {
            model: "movies",
            key: "id"
        }
    },
    image: {
        type: DataTypes.STRING
    }
}, {
    sequelize,
    timestamps: false,
    modelName: 'Character',
    tableName: 'characters'
});


module.exports.Character = Character;