const functions = require('@google-cloud/functions-framework');
const {func} = require('./src/utils')

functions.http('poc-function-deployment', async (req, res) => {
    console.log('Hello, world!!!');
    func();

    res.status(200).send({success: true});
});