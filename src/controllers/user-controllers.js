const req = require("express/lib/request");
const dbconnection = require("../../database/dbconnection");
//TODO: add all inputs
const assert = require("assert");
const { type } = require("express/lib/response");
const { doesNotMatch } = require("assert");
const res = require("express/lib/response");

let controller = {
    passWordRecovery: (req, res) => {
        const email = req.body.emailAddress;
    },
};

module.exports = controller;
