const functions = require('@google-cloud/functions-framework');

functions.http('poc-function-deployment', async (req, res) => {
    console.log('Hello, world!!!');

    res.status(200).send({
        MY_SECRET: process.env.MY_SECRET,
    });
});