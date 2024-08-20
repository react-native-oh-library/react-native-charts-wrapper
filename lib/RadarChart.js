import PropTypes from 'prop-types';
import React, {Component} from 'react';
import {
  Platform,
  requireNativeComponent,
  View
} from 'react-native';

import PieRadarChartBase from './PieRadarChartBase';
import {yAxisIface} from './AxisIface';
import {radarData} from './ChartDataConfig';
import RNRadarChartComponent from '../src/RadarChartNativeComponents'
class RadarChart extends React.Component {
  getNativeComponentName() {
    return 'RNRadarChart'
  }

  getNativeComponentRef() {
    return this.nativeComponentRef
  }

  render() {
    if(Platform.OS==='harmony'){
      return <RNRadarChartComponent  {...this.props} ref={ref => this.nativeComponentRef = ref} ></RNRadarChartComponent>
    }else{
      return <RNRadarChart {...this.props} ref={ref => this.nativeComponentRef = ref} />;
    }
   
  }
}

RadarChart.propTypes = {
  ...PieRadarChartBase.propTypes,

  yAxis: PropTypes.shape(yAxisIface),

  drawWeb: PropTypes.bool,
  skipWebLineCount: PropTypes.number,

  webLineWidth: PropTypes.number,
  webLineWidthInner: PropTypes.number,
  webAlpha: PropTypes.number,
  webColor: PropTypes.number,
  webColorInner: PropTypes.number,
  extraOffsets: PropTypes.shape({
    left: PropTypes.number,
    top: PropTypes.number, 
    right: PropTypes.number,
    bottom: PropTypes.number
  }),
  data: radarData
};

if(!Platform.OS==='harmony'){
  var RNRadarChart = requireNativeComponent('RNRadarChart', RadarChart, {
    nativeOnly: {onSelect: true, onChange: true}
  })
}

export default RadarChart