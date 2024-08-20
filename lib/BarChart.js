import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';

import BarLineChartBase from './BarLineChartBase';
import {barData} from './ChartDataConfig';
import MoveEnhancer from './MoveEnhancer'
import ScaleEnhancer from "./ScaleEnhancer";
import HighlightEnhancer from "./HighlightEnhancer";
import ScrollEnhancer from "./ScrollEnhancer";
import RNBarChartComponent from '../src/BarChartsComponent.ts'

class BarChart extends React.Component {
  getNativeComponentName() {
    return 'RNBarChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
     return <RNBarChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNBarChartComponent>
    }
    return <RNBarChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
  }
}

BarChart.propTypes = {
  ...BarLineChartBase.propTypes,

  drawValueAboveBar: PropTypes.bool,
  drawBarShadow: PropTypes.bool,
  highlightFullBarEnabled: PropTypes.bool,

  data: barData
}

if(!Platform.OS==='harmony'){
  var RNBarChart = requireNativeComponent('RNBarChart', BarChart, {
    nativeOnly: {onSelect: true, onChange: true}
  })
}


export default ScrollEnhancer(HighlightEnhancer(ScaleEnhancer(MoveEnhancer(BarChart))))
