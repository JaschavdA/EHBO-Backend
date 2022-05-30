const nodemailer = require("nodemailer");
const generator = require("generate-password");

var transporter = nodemailer.createTransport({
    host: "smtp-mail.outlook.com",
    port: 587,
    auth: {
        user: "HIER EMAIL TOEVOEGEN",
        pass: "HIER WACHTWOORD TOEVOEGEN",
    },
});

var password = generator.generate({
    length: 20,
    symbols: true,
    numbers: true,
});

var mailOptions = {
    from: "Email",
    to: "Email",
    subject: "Email verzenden met NodeJS",
    text: `Eenmaalig wachtwoord: ${password}`,
};

transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
        console.log(error);
    } else {
        console.log("Email sent: " + info.response);
    }
});
