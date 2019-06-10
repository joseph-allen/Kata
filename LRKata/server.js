//include packages
const express = require('express');
const bodyParser = require('body-parser')
const http = require("http");

//start app
const app = express();

//set port
var port = process.env.PORT || 1234;

var router = express.Router();

// middleware to use for all requests
router.use(function(req, res, next) {
    // do logging
    console.log('Something is happening.');
    next();
});

router.get('/', function(req, res) {
    res.json({ message: 'root test' });   
});

router.route('/:term').get(function(req, outputRes) {

    const url = 'http://lr-node-kata.herokuapp.com/search/' + req.params.term;
    let output = {};

    http.get(url, function(res) {
        console.log("Got response: " + res.statusCode);

        let test = '';

        res.on("data", function(chunk) {
             test = chunk;
        });

        res.on('end', function () {
            output = JSON.parse(test);
            output = output.map(function(item){
                return 'http://lr-node-kata.herokuapp.com/details/?id=' + item;
            })
            console.log('END',output);
            //not sure what to do?
            mapToOutput(output)
            
            outputRes.json(output);
        });
        
    }).on('error', function(e) {
        console.log("Got error: " + e.message);
    }).end();

});

function mapToOutput(arr){
    console.log('MEOW',arr[0]);
    let url = '';
    let output = [];
    arr = arr.map(function(item){
        url = item;
        let test = getIDDetail(url);
        output.push(getIDDetail(url));
        return getIDDetail(url);
    })

    console.log('arr',arr);
}

function getIDDetail(url){
        let tempItem = {};

        http.get(url, function(res) {
            console.log("Got response: " + res.statusCode);

            res.on("data", function(chunk) {
                tempItem = JSON.parse(chunk);
                console.log('puss puss',tempItem);
            });

            res.on('end', function () {
                return tempItem;
            });
        
        }).on('error', function(e) {
            console.log("Got error: " + e.message);
        }).end();

        return tempItem;
}

//API routes prefixed with /api
app.use('/api', router);

app.listen(port);
console.log('check out localhost on port ' + port);