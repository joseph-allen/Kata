/* CAUTION: When using the generators, this file is modified in some places.
 *          This is done via AST traversal - Some of your formatting may be lost
 *          in the process - no functionality should be broken though.
 *          This modifications only run once when the generator is invoked - if
 *          you edit them, they are not updated again.
 */
import React, {
  Component,
  PropTypes
} from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import {
  ToggleAllNotes,
  ToggleAllCode,
  ToggleAllTitles,
  SelectMenuItem
} from '../actions/';
import Main from '../components/App';
/* Populated by react-webpack-redux:reducer */
class App extends Component {
  render() {
    const {actions, ToggleAllNotes, ToggleAllCode, ToggleAllTitles, SelectMenuItem} = this.props;// eslint-disable-line
    return (
      <Main
        actions={actions}
        ToggleAllNotes={ToggleAllNotes}
        ToggleAllCode={ToggleAllCode}
        ToggleAllTitles={ToggleAllTitles}
        SelectMenuItem={SelectMenuItem}/>
    );
  }
}
/* Populated by react-webpack-redux:reducer
 *
 * HINT: if you adjust the initial type of your reducer, you will also have to
 *       adjust it here.
 */
App.propTypes = {
  actions: PropTypes.shape({
    ToggleAllNotes: PropTypes.func.isRequired,
    ToggleAllCode: PropTypes.func.isRequired,
    ToggleAllTitles: PropTypes.func.isRequired,
    SelectMenuItem: PropTypes.func.isRequired
  }),
  ToggleAllNotes: PropTypes.shape({}),
  ToggleAllCode: PropTypes.shape({}),
  ToggleAllTitles: PropTypes.shape({}),
  SelectMenuItem: PropTypes.shape({})
};
function mapStateToProps(state) {
  // eslint-disable-line no-unused-vars
  /* Populated by react-webpack-redux:reducer */
  const props = {
    ToggleAllNotes: state.ToggleAllNotes,
    ToggleAllCode: state.ToggleAllCode,
    ToggleAllTitles: state.ToggleAllTitles,
    SelectMenuItem: state.SelectMenuItem
  };
  return props;
}
function mapDispatchToProps(dispatch) {
  /* Populated by react-webpack-redux:action */
  const actions = {
    ToggleAllNotes,
    ToggleAllCode,
    ToggleAllTitles,
    SelectMenuItem
  };
  const actionMap = { actions: bindActionCreators(actions, dispatch) };
  return actionMap;
}
export default connect(mapStateToProps, mapDispatchToProps)(App);
