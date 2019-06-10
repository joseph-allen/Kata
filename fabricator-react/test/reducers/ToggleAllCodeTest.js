const reducer = require('../../src/reducers/Demo/ToggleAllCode');

describe('ToggleAllCode', () => {

  it('should not change the passed state', (done) => {

    const state = Object.freeze({});
    reducer(state, {type: 'INVALID'});

    done();
  });
});
