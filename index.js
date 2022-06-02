//API base URL: https://share-a-meal-2022.herokuapp.com/

const express = require("express");
const app = express();
require("dotenv").config();
const port = process.env.PORT;

const bodyParser = require("body-parser");
const userRouter = require("./src/routes/user-routes");
const authRouter = require("./src/routes/auth-routes");
const lessonRouter = require("./src/routes/lesson-routes");
const competencyRouter = require("./src/routes/competency-routes");
const shiftRouter = require("./src/routes/shift-routes");
const res = require("express/lib/response");

app.use(function (req, res, next) {
    // Website you wish to allow to connect
    res.setHeader("Access-Control-Allow-Origin", "*");

    // Request methods you wish to allow
    res.setHeader(
        "Access-Control-Allow-Methods",
        "GET, POST, OPTIONS, PUT, PATCH, DELETE"
    );

    // Request headers you wish to allow
    res.setHeader("Access-Control-Allow-Headers", "*");

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader("Access-Control-Allow-Credentials", true);

    // Pass to next layer of middleware
    next();
});
app.use(bodyParser.json());
app.use(authRouter);
app.use(userRouter);
app.use(lessonRouter);
app.use(competencyRouter);
app.use(shiftRouter);

app.all("*", (req, res) => {
    const method = req.method;
    console.log(`Called ${method} method`);
});

app.all("*", (req, res) => {
    res.status(404).json({
        status: 404,
        result: "End point not found",
    });
});

app.use((err, req, res, next) => {
    res.status(err.status).json(err);
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});

module.exports = app;
