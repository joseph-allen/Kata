const reducer = require('../../src/reducers/Demo/ToggleAllNotes');

describe('ToggleAllNotes', () => {

  it('should not change the passed state', (done) => {

    const state = Object.freeze({});
    reducer(state, {type: 'INVALID'});

    done();
  });
});
