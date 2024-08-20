import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';

import BarLineChartBase from './BarLineChartBase';
import {candleData} from './ChartDataConfig';
import MoveEnhancer from './MoveEnhancer'
import ScaleEnhancer from "./ScaleEnhancer";
import HighlightEnhancer from "./HighlightEnhancer";
import ScrollEnhancer from "./ScrollEnhancer";
import RNCandleStickChartComponent from '../src/CandleNativeComponents.ts'
class CandleStickChart extends React.Component {
  getNativeComponentName() {
    return 'RNCandleStickChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
      return <RNCandleStickChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNCandleStickChartComponent>
    }
    return <RNCandleStickChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
  }

}

CandleStickChart.propTypes = {
  ...BarLineChartBase.propTypes,

  data: candleData
};
if(!Platform.OS==='harmony'){
  var RNCandleStickChart = requireNativeComponent('RNCandleStickChart', CandleStickChart, {
    nativeOnly: {onSelect: true, onChange: true}
  });
}


export default ScrollEnhancer(HighlightEnhancer(ScaleEnhancer(MoveEnhancer(CandleStickChart))))
