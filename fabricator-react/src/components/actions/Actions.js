import React from 'react';
import IconButton from 'material-ui/IconButton';
import Grid from 'material-ui/Grid';
import PropTypes from 'prop-types';
import Tooltip from 'material-ui/Tooltip';
import './actions.sass';


class Actions extends React.Component {
  render() {
    const showTitlesClasses = `actions_component__label ${this.props.showTitles ? 'active' : null}`;
    const showNotesClasses = `actions_component__label ${this.props.showNotes ? 'active' : null}`;
    const showCodeClasses = `actions_component__label ${this.props.showCode ? 'active' : null}`;

    return (
      <div className="actions-component">
        <Grid container spacing={24}>
          <Grid item>
            <div className={showTitlesClasses}>
              <Tooltip id="tooltip-icon" title="Toggle Titles">
                <IconButton onClick={this.props.ToggleAllTitles}>
                  <i className="material-icons">&#xE893;</i>
                </IconButton>
              </Tooltip>
            </div>
          </Grid>
          <Grid item>
            <div className={showNotesClasses}>
              <Tooltip id="tooltip-icon" title="Toggle Notes">
                <IconButton onClick={this.props.ToggleAllNotes}>
                  <i className="material-icons">&#xE8CD;</i>
                </IconButton>
              </Tooltip>
            </div>
          </Grid>
          <Grid item>
            <div className={showCodeClasses}>
              <Tooltip id="tooltip-icon" title="Toggle Code">
                <IconButton onClick={this.props.ToggleAllCode}>
                  <i className="material-icons">&#xE86F;</i>
                </IconButton>
              </Tooltip>
            </div>
          </Grid>
        </Grid>
      </div>
    );
  }
}

Actions.displayName = 'ActionsActions';
Actions.propTypes = {
  ToggleAllNotes: PropTypes.func,
  ToggleAllCode: PropTypes.func,
  ToggleAllTitles: PropTypes.func,
  showNotes: PropTypes.bool.isRequired,
  showCode: PropTypes.bool.isRequired,
  showTitles: PropTypes.bool.isRequired
};
Actions.defaultProps = {};

export default Actions;
