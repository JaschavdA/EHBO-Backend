const express = require("express");
const router = express.Router();
const shiftController = require("../controllers/shift-controller");
const authController = require("../controllers/auth-controller");

router.post(
    "/api/shift",
    authController.validateToken,
    shiftController.validateInput,
    shiftController.createShift
);

router.post(
    "/api/shift/signup",
    authController.validateToken,
    shiftController.validateInputShiftSignup,
    shiftController.signUpShift
);

module.exports = router;
