const reducer = require('../../src/reducers/Demo/ToggleAllTitles');

describe('ToggleAllTitles', () => {

  it('should not change the passed state', (done) => {

    const state = Object.freeze({});
    reducer(state, {type: 'INVALID'});

    done();
  });
});
