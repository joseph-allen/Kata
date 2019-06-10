import React from 'react';
import { shallow } from 'enzyme';
import Demo from 'components/Demo/Demo.js';

describe('<Demo />', function () {

  let component;
  beforeEach(function () {
    component = shallow(<Demo label={'test'} showNotes={false}/>);
  });

  describe('when rendering the component', function () {

    it('should have a className of "demo-component"', function () {
      expect(component.hasClass('demo-component')).to.equal(true);
    });
  });
});
