/* eslint-disable import/newline-after-import */
/* Exports all the actions from a single point.

Allows to import actions like so:

import {action1, action2} from '../actions/'
*/
/* Populated by react-webpack-redux:action */
import SelectMenuItem from '../actions/SelectMenuItem/SelectMenuItem.js';
import ToggleAllTitles from '../actions/ToggleAllTitles/ToggleAllTitles.js';
import ToggleAllCode from '../actions/ToggleAllCode/ToggleAllCode.js';
import ToggleAllNotes from '../actions/ToggleAllNotes/ToggleAllNotes.js';
const actions = {
  ToggleAllNotes,
  ToggleAllCode,
  ToggleAllTitles,
  SelectMenuItem
};
module.exports = actions;
