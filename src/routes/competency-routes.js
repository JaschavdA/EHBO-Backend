const express = require("express");
const router = express.Router();
const authController = require("../controllers/auth-controller");
const competencyController = require("../controllers/competency-controller");

router.get(
    "/api/competency",
    authController.validateToken,
    competencyController.getAllCompetencies
);

router.get(
    "/api/competency/:competencyID",
    authController.validateToken,
    competencyController.getCompetencyByID
);

module.exports = router;
