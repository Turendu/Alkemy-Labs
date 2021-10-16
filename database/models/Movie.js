const { DataTypes, Model } = require('sequelize');
const sequelize = require('../../config/database');

class Movie extends Model { }

Movie.init({
    title: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    created: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    rating: {
        type: DataTypes.INTEGER
    },
    character_id: {
        type: DataTypes.INTEGER,
        references: {
            model: "characters",
            key: "id"
        }
    },
    image: {
        type: DataTypes.STRING
    }
}, {
    sequelize,
    timestamps: false,
    modelName: 'Movie',
    tableName: 'movies'
});

module.exports.Movie = Movie;