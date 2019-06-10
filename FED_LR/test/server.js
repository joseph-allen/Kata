const server = require('../server');
const assert = require('chai').assert;
const http = require('http');

describe('/', function () {
  it('should return 200 at the root', function (done) {
    http.get('http://localhost:1234/api', function (res) {
      assert.equal(200, res.statusCode);
      done();
    });
  });

  it('should return 5 length array term as JSON when passed', function (done) {
    http.get('http://localhost:1234/api/manchester', function (res) {
      var data = '';

      res.on('data', function (chunk) {
        data += chunk;
      });

      res.on('end', function () {
        assert.equal(5, JSON.parse(data).length);
        done();
      });
    });
  });

  it('should say "test" at root', function (done) {
    http.get('http://localhost:1234/api', function (res) {
      var data = '';

      res.on('data', function (chunk) {
        data += chunk;
      });

      res.on('end', function () {
        assert.equal(JSON.stringify({ message: 'root test' }), data);
        done();
      });
    });
  });


});