import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';

import BarLineChartBase from './BarLineChartBase';
import {scatterData} from './ChartDataConfig';
import MoveEnhancer from './MoveEnhancer'
import ScaleEnhancer from "./ScaleEnhancer";
import HighlightEnhancer from "./HighlightEnhancer";
import ScrollEnhancer from "./ScrollEnhancer";
import RNScatterChartComponent from '../src/ScatterChartNativeComponents.ts'
class ScatterChart extends React.Component {
  getNativeComponentName() {
    return 'RNScatterChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
    return  <RNScatterChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNScatterChartComponent>
    }
    return <RNScatterChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
  }
}

ScatterChart.propTypes = {
  ...BarLineChartBase.propTypes,

  data: scatterData
};

if(!Platform.OS==='harmony'){
  var RNScatterChart = requireNativeComponent('RNScatterChart', ScatterChart, {
    nativeOnly: {onSelect: true, onChange: true}
  });
}


export default ScrollEnhancer(HighlightEnhancer(ScaleEnhancer(MoveEnhancer(ScatterChart))))
