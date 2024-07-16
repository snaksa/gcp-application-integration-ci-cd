const functions = require('@google-cloud/functions-framework');

functions.http('poc-function-deployment', async (req, res) => {
    console.log('Hello, world!!!');
    console.log({
        MY_SECRET: process.env.MY_SECRET,
        MY_ULTRA_SECRET: process.env.MY_ULTRA_SECRET
    })

    res.status(200).send({success: true});
});