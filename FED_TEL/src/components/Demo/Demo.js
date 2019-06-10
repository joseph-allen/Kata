import React from 'react';
import PropTypes from 'prop-types';
import Typography from 'material-ui/Typography';
import SyntaxHighlighter from 'react-syntax-highlighter';
import { docco } from 'react-syntax-highlighter/styles/hljs';
import './demo.sass';

class Demo extends React.Component {
  render() {
    // Render notes when the showNotes prop is true
    const notes = this.props.showNotes ? (
      <div className="demo-component__notes">
        <Typography variant="body1" gutterBottom>
          {this.props.component_notes}
        </Typography>
      </div>
    ) : null;

    // Render code when the showCode prop is true
    const code = this.props.showCode ? (
      <div className="demo-component__code">
        <SyntaxHighlighter
          language="htmlbars"
          style={docco}
        >
          {this.props.component_code}
        </SyntaxHighlighter>
      </div>
    ) : null;

    // Render code when the showCode prop is true
    const title = this.props.showTitles ? (
      <div className="demo-component__title">
        <Typography variant="title" gutterBottom>
          {this.props.component_title}
        </Typography>
      </div>
    ) : null;

    // Render code when the showCode prop is true
    const component = (<div
      className="demo-component__component"
      dangerouslySetInnerHTML={{__html: this.props.component_code}} // eslint-disable-line
    />);

    return (
      <div className="demo-component">
        {title}
        {notes}
        {component}
        {code}
      </div>
    );
  }
}

Demo.displayName = 'Demo';
Demo.propTypes = {
  component_title: PropTypes.string.isRequired,
  component_notes: PropTypes.string.isRequired,
  component_code: PropTypes.string.isRequired,
  showNotes: PropTypes.bool.isRequired,
  showCode: PropTypes.bool.isRequired,
  showTitles: PropTypes.bool.isRequired
};
Demo.defaultProps = {};

export default Demo;
