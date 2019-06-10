/* Define your initial state here.
 *
 * If you change the type from object to something else, do not forget to update
 * src/container/App.js accordingly.
 */
import {SELECT_MENU_ITEM} from '../actions/const';

const initialState = {
  selectedMenuIndex: 0
};

function reducer(state = initialState, action) {
  /* Keep the reducer clean - do not mutate the original state. */
  const nextState = Object.assign({}, state);

  switch (action.type) {
    case SELECT_MENU_ITEM: {
      // Modify next state depending on the action and return it
      nextState.selectedMenuIndex = action.index;
      return nextState;
    }
    default: {
      /* Return original state if no actions were consumed. */
      return state;
    }
  }
}

module.exports = reducer;
