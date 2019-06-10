import React from 'react';
import PropTypes from 'prop-types';
import List, { ListItem, ListItemText } from 'material-ui/List';
import Divider from 'material-ui/Divider';
import Actions from '../actions/Actions.js';
import './menu.sass';

class Menu extends React.Component {

  render() {

    return (
      <div className="menu-component">
        <Actions
          ToggleAllNotes={this.props.ToggleAllNotes}
          ToggleAllCode={this.props.ToggleAllCode}
          ToggleAllTitles={this.props.ToggleAllTitles}
          showNotes={this.props.showNotes}
          showCode={this.props.showCode}
          showTitles={this.props.showTitles}
        />
        <List component="nav">
          {this.props.components.map((name, index) =>
            (<div // eslint-disable-line
              className="menu-component__option"
              onClick={() => this.props.SelectMenuItem(index)}>
              <ListItem key={index} button>
                <ListItemText primary={name} />
              </ListItem>
              <Divider />
            </div>)
          )}
        </List>
      </div>
    );
  }
}

Menu.displayName = 'MenuMenu';
Menu.propTypes = {
  ToggleAllNotes: PropTypes.func,
  ToggleAllCode: PropTypes.func,
  ToggleAllTitles: PropTypes.func,
  showNotes: PropTypes.bool.isRequired,
  showCode: PropTypes.bool.isRequired,
  showTitles: PropTypes.bool.isRequired
};
Menu.defaultProps = {};

export default Menu;
