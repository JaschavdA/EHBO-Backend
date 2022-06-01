const req = require("express/lib/request");
const dbconnection = require("../../database/dbconnection");
const assert = require("assert");
const { type } = require("express/lib/response");
const { doesNotMatch } = require("assert");
const res = require("express/lib/response");
const { rmSync } = require("fs");
const { error } = require("console");
// const saltRounds = 10;
// const bcrypt = require("bcrypt");

let competencyController = {
    getAllCompetencies: (req, res) => {
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
                res.status(500).json({
                    status: 500,
                    message: "could not connect to database",
                });
            } else {
                connection.query(
                    "SELECT * FROM competency",
                    function (error, results, fields) {
                        connection.release();
                        if (error) {
                            res.status(500).json({
                                status: 500,
                                message: "Internal server error",
                            });
                        } else {
                            res.status(200).json({
                                status: 200,
                                result: results,
                            });
                        }
                    }
                );
            }
        });
    },

    getCompetencyByID: (req, res) => {
        const id = req.params.competencyID;
        dbconnection.getConnection(function (err, connection) {
            if (err) {
                console.log(err);
                res.status(500).json({
                    status: 500,
                    message: "could not connect to database",
                });
            } else {
                connection.query(
                    "SELECT * FROM competency WHERE ID = ?",
                    [id],
                    function (error, results, fields) {
                        connection.release();
                        if (error) {
                            console.log(error);
                            res.status(500).json({
                                status: 500,
                                message: "Internal server error",
                            });
                        } else if (results.length > 0) {
                            res.status(200).json({
                                status: 200,
                                result: results,
                            });
                        } else {
                            res.status(404).json({
                                status: 200,
                                message: `competency with ID: ${id} was not found`,
                            });
                        }
                    }
                );
            }
        });
    },
};

module.exports = competencyController;
