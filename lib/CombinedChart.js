import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';

import BarLineChartBase from './BarLineChartBase';
import {combinedData} from './ChartDataConfig';
import MoveEnhancer from './MoveEnhancer'
import ScaleEnhancer from "./ScaleEnhancer";
import HighlightEnhancer from "./HighlightEnhancer";
import ScrollEnhancer from "./ScrollEnhancer";
import RNCombinedChartComponent from '../src/CombinedChartNativeComponents.ts'
class CombinedChart extends React.Component {
  getNativeComponentName() {
    return 'RNCombinedChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
      return <RNCombinedChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNCombinedChartComponent>
    }
    return <RNCombinedChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
  }

}

CombinedChart.propTypes = {
  ...BarLineChartBase.propTypes,
  drawOrder: PropTypes.arrayOf(PropTypes.oneOf(['BAR', 'BUBBLE', 'LINE', 'CANDLE', 'SCATTER'])),
  drawValueAboveBar: PropTypes.bool,
  highlightFullBarEnabled: PropTypes.bool,
  drawBarShadow: PropTypes.bool,
  data: combinedData
};

if(!Platform.OS==='harmony'){
  var RNCombinedChart = requireNativeComponent('RNCombinedChart', CombinedChart, {
    nativeOnly: {onSelect: true, onChange: true}
  });
}


export default ScrollEnhancer(HighlightEnhancer(ScaleEnhancer(MoveEnhancer(CombinedChart))))
