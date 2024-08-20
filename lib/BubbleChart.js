import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';
import ScrollEnhancer from "./ScrollEnhancer";

import BarLineChartBase from './BarLineChartBase';
import {bubbleData} from './ChartDataConfig';
import MoveEnhancer from './MoveEnhancer'
import ScaleEnhancer from "./ScaleEnhancer";
import HighlightEnhancer from "./HighlightEnhancer";

import RNBubbleChartComponent from '../src/BubbleChartNativeCompnents'
class BubbleChart extends React.Component {
  getNativeComponentName() {
    return 'RNBubbleChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
      return <RNBubbleChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNBubbleChartComponent>
    }
    return <RNBubbleChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
  }
}

BubbleChart.propTypes = {
  ...BarLineChartBase.propTypes,

  data: bubbleData
};

if(!Platform==='harmony'){
  var RNBubbleChart = requireNativeComponent('RNBubbleChart', BubbleChart, {
    nativeOnly: {onSelect: true, onChange: true}
  });
}


export default ScrollEnhancer(HighlightEnhancer(ScaleEnhancer(MoveEnhancer(BubbleChart))))

