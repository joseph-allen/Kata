import React from 'react';
import { MuiThemeProvider, createMuiTheme } from 'material-ui/styles';
import blue from 'material-ui/colors/blue';
import Grid from 'material-ui/Grid';
import Typography from 'material-ui/Typography';
import Demo from './Demo/Demo.js';
import Menu from './Menu/Menu.js';
import './app.scss';
import config from './config.json';

const theme = createMuiTheme({
  palette: {
    primary: blue,
  },
});

class AppComponent extends React.Component {
  render() {
    return (
      <div className="index">
        <MuiThemeProvider theme={theme}>
          <Grid container spacing={24}>
            <Grid item xs={3}>
              <Menu
                ToggleAllNotes={this.props.actions.ToggleAllNotes}
                ToggleAllCode={this.props.actions.ToggleAllCode}
                ToggleAllTitles={this.props.actions.ToggleAllTitles}
                SelectMenuItem={this.props.actions.SelectMenuItem}
                components={config.map(component => component.component_title)}
                selectedMenuIndex={this.props.SelectMenuItem.selectedMenuIndex}
                showNotes={this.props.ToggleAllNotes.showNotes}
                showCode={this.props.ToggleAllCode.showCode}
                showTitles={this.props.ToggleAllTitles.showTitles}
              />
            </Grid>
            <Grid item xs={9}>
              <Typography variant="headline" gutterBottom>
                Components
              </Typography>
              <Demo
                component_title={
                  config[this.props.SelectMenuItem.selectedMenuIndex].component_title
                }
                component_notes={
                  config[this.props.SelectMenuItem.selectedMenuIndex].component_notes
                }
                component_code={
                  config[this.props.SelectMenuItem.selectedMenuIndex].component_code
                }
                showNotes={this.props.ToggleAllNotes.showNotes}
                showCode={this.props.ToggleAllCode.showCode}
                showTitles={this.props.ToggleAllTitles.showTitles}
              />
            </Grid>
          </Grid>
        </MuiThemeProvider>
      </div>
    );
  }
}

AppComponent.propTypes = {};
AppComponent.defaultProps = {};

export default AppComponent;
