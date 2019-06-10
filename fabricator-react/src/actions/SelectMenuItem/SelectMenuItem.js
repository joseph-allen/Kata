import { SELECT_MENU_ITEM } from './../const';

function action(index) {
  return {
    type: SELECT_MENU_ITEM,
    index
  };
}

module.exports = action;
