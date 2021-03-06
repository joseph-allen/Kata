/* Define your initial state here.
 *
 * If you change the type from object to something else, do not forget to update
 * src/container/App.js accordingly.
 */
import {TOGGLE_ALL_CODE} from '../../actions/const';

const initialState = {
  showCode: true
};

function reducer(state = initialState, action) {
  /* Keep the reducer clean - do not mutate the original state. */
  const nextState = Object.assign({}, state);

  switch (action.type) {

    case TOGGLE_ALL_CODE: {
      // Modify next state depending on the action and return it
      nextState.showCode = !state.showCode;
      return nextState;
    }

    default: {
      /* Return original state if no actions were consumed. */
      return state;
    }
  }
}

module.exports = reducer;
