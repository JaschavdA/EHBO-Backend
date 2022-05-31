const req = require("express/lib/request");
const jwtSecretKey = process.env.JWT_Key;
const jwt = require("jsonwebtoken");
const dbconnection = require("../../database/dbconnection");
//TODO: add all inputs
const assert = require("assert");
const { use } = require("chai");
const bcrypt = require("bcrypt");

let lessonController = {
    getAllLessons: (req, res) => {
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                res.status(500).json({
                    status: 500,
                    message: "could not connect with database",
                });
            }

            connection.query(
                "SELECT * FROM lesson;",
                function (error, results, fields) {
                    if (error) {
                        console.log(error);
                        res.status(500).json({
                            status: 500,
                            message: "internal server error",
                        });
                    }

                    res.status(200).json({
                        status: 200,
                        result: results,
                    });
                }
            );
        });
    },

    getLessonsByLessonID: (req, res) => {
        dbconnection.getConnection(function (err, connection) {
            const id = req.params.lessonID;
            if (err) {
                res.status(500).json({
                    status: 500,
                    message: "could not connect with database",
                });
            }

            connection.query(
                "SELECT * FROM lesson WHERE LessonID = ?;",
                [id],
                function (error, results, fields) {
                    if (error) {
                        console.log(error);
                        res.status(500).json({
                            status: 500,
                            message: "internal server error",
                        });
                    }

                    if (results.length < 1) {
                        res.status(404).json({
                            status: 404,
                            message: `Lesson with ID ${id} was not found`,
                        });
                    } else {
                        res.status(200).json({
                            status: 200,
                            result: results,
                        });
                    }
                }
            );
        });
    },
};

module.exports = lessonController;
