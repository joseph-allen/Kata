import React from 'react';
import { shallow } from 'enzyme';
import Actions from 'components/actions/Actions.js';

describe('<Actions />', function () {

  let component;
  beforeEach(function () {
    component = shallow(<Actions />);
  });

  describe('when rendering the component', function () {

    it('should have a className of "actions-component"', function () {
      expect(component.hasClass('actions-component')).to.equal(true);
    });
  });
});
