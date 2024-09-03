/**
 * MIT License
 *
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import { LimitLabelPosition, LimitLine, XAxis, YAxis } from '@ohos/mpchart'
import { RNC } from '@rnoh/react-native-openharmony/generated'

interface ILimitLines {
  limit: number,
  label?: string | undefined,
  lineColor?: number | undefined,
  lineWidth?: number | undefined,
  valueTextColor?: number | undefined,
  valueFont?: number | undefined,
  labelPosition?: 'LEFT_TOP' | 'LEFT_BOTTOM' | 'RIGHT_TOP' | 'RIGHT_BOTTOM' | undefined,
  lineDashPhase?: number | undefined,
  lineDashLengths?: number[] | undefined
}

type LimitLinesType = ILimitLines[]

type RNChart = RNC.RNBarChart.DescriptorWrapper |
RNC.RNLineChart.DescriptorWrapper |
RNC.RNBubbleChart.DescriptorWrapper |
RNC.RNCandleStickChart.DescriptorWrapper |
RNC.RNHorizontalBarChart.DescriptorWrapper |
RNC.RNScatterChart.DescriptorWrapper |
RNC.RNCombinedChart.DescriptorWrapper
type RNRadarChartType = RNC.RNRadarChart.DescriptorWrapper
type Axis = XAxis | YAxis

//设置公共axis方法
export const setAxis =
  <U extends RNChart>(axis: Axis, descriptorWrapper?: U, isyAxis?: string, isRadarCharts?: RNRadarChartType) => {

    if (!isRadarCharts) {
      let xAxis = descriptorWrapper?.props.xAxis
      let yAxisLeft = descriptorWrapper?.props.yAxis?.left
      let yAxisRight = descriptorWrapper?.props.yAxis?.right
      //是否绘制该组件 enabled
      if (axis instanceof XAxis && xAxis?.enabled != undefined) {
        axis?.setEnabled(xAxis?.enabled);
      } else if (yAxisLeft?.enabled != undefined && isyAxis === 'yAxisLeft') {
        axis?.setEnabled(yAxisLeft?.enabled);
      } else if (yAxisRight?.enabled != undefined && isyAxis === 'yAxisRight') {
        axis?.setEnabled(yAxisRight?.enabled);
      }

      //设置绘制此轴的标签 drawLabels
      if (axis instanceof XAxis && xAxis?.drawLabels != undefined) {
        axis?.setDrawLabels(xAxis?.drawLabels);
      } else if (yAxisLeft?.drawLabels != undefined && isyAxis === 'yAxisLeft') {
        axis?.setDrawLabels(yAxisLeft?.drawLabels);
      } else if (yAxisRight?.drawLabels != undefined && isyAxis === 'yAxisRight') {
        axis?.setDrawLabels(yAxisRight?.drawLabels);
      }

      //设置轴旁边的线 drawAxisLine
      if (axis instanceof XAxis && xAxis?.drawAxisLine != undefined) {
        axis.setDrawAxisLine(xAxis?.drawAxisLine);
      } else if (yAxisLeft?.drawAxisLine != undefined && isyAxis === 'yAxisLeft') {
        axis.setDrawAxisLine(yAxisLeft?.drawAxisLine);
      } else if (yAxisRight?.drawAxisLine != undefined && isyAxis === 'yAxisRight') {
        axis.setDrawAxisLine(yAxisRight?.drawAxisLine)
      }

      //是否启用此轴的网格线绘制。 drawGridLines
      if (axis instanceof XAxis && xAxis?.drawGridLines != undefined) {
        axis.setDrawGridLines(xAxis?.drawGridLines);
      } else if (yAxisLeft?.drawGridLines != undefined && isyAxis === 'yAxisLeft') {
        axis.setDrawGridLines(yAxisLeft?.drawGridLines);
      } else if (yAxisRight?.drawGridLines != undefined && isyAxis === 'yAxisRight') {
        axis.setDrawGridLines(yAxisRight?.drawGridLines);
      }

      //textColor 设置用于标签的文本颜色
      if (xAxis?.textColor != undefined && axis instanceof XAxis) {
        axis.setTextColor(xAxis?.textColor);
      } else if (yAxisLeft?.textColor != undefined && isyAxis === 'yAxisLeft') {
        axis.setTextColor(yAxisLeft.textColor);
      } else if (yAxisRight?.textColor != undefined && isyAxis === 'yAxisRight') {
        axis.setTextColor(yAxisRight?.textColor);
      }

      //textSize 设置用于标签的文本大小
      if (axis instanceof XAxis && xAxis?.textSize != undefined) {
        axis.setTextSize(xAxis?.textSize);
      } else if (yAxisLeft?.textSize != undefined && isyAxis === 'yAxisLeft') {
        axis.setTextSize(yAxisLeft?.textSize)
      } else if (yAxisRight?.textSize != undefined && isyAxis === 'yAxisRight') {
        axis.setTextSize(yAxisRight?.textSize)
      }

      // 设置此坐标轴的网格线（水平线）的颜色 gridColor
      if (axis instanceof XAxis && xAxis?.gridColor != undefined) {
        axis?.setGridColor(xAxis?.gridColor);
      } else if (yAxisLeft?.gridColor != undefined && isyAxis === 'yAxisLeft') {
        axis?.setGridColor(yAxisLeft?.gridColor);
      } else if (yAxisRight?.gridColor != undefined && isyAxis === 'yAxisRight') {
        axis?.setGridColor(yAxisRight?.gridColor);
      }

      // 设置远离每个轴绘制的栅格线的宽度 gridLineWidth

      if (axis instanceof XAxis && xAxis?.gridLineWidth != undefined) {
        axis.setGridLineWidth(xAxis?.gridLineWidth)
      } else if (yAxisLeft?.gridLineWidth != undefined && isyAxis === 'yAxisLeft') {
        axis.setGridLineWidth(yAxisLeft?.gridLineWidth)
      } else if (yAxisRight?.gridLineWidth != undefined && isyAxis === 'yAxisRight') {
        axis.setGridLineWidth(yAxisRight?.gridLineWidth)
      }

      if (axis instanceof XAxis && xAxis?.fontFamily != undefined) {
        if (xAxis.fontFamily === 'sans-serif') {
          axis.setTypeface(xAxis.fontFamily)
        }
        if (xAxis.fontFamily === 'serif') {
          axis.setTypeface(xAxis.fontFamily)
        }
        if (xAxis.fontFamily === 'monospace') {
          axis.setTypeface(xAxis.fontFamily)
        }
      } else if (yAxisLeft?.gridLineWidth != undefined && isyAxis === 'yAxisLeft') {
        if (yAxisLeft.fontFamily === 'sans-serif') {
          axis.setTypeface(yAxisLeft.fontFamily)
        }
        if (yAxisLeft.fontFamily === 'serif') {
          axis.setTypeface(yAxisLeft.fontFamily)
        }
        if (yAxisLeft.fontFamily === 'monospace') {
          axis.setTypeface(yAxisLeft.fontFamily)
        }
      } else if (yAxisRight?.gridLineWidth != undefined && isyAxis === 'yAxisRight') {
        if (yAxisRight.fontFamily === 'sans-serif') {
          axis.setTypeface(yAxisRight.fontFamily)
        }
        if (yAxisRight.fontFamily === 'serif') {
          axis.setTypeface(yAxisRight.fontFamily)
        }
        if (yAxisRight.fontFamily === 'monospace') {
          axis.setTypeface(yAxisRight.fontFamily)
        }
      }

      //设置图表周围边框的颜色。axisLineColor
      if (axis instanceof XAxis && xAxis?.axisLineColor != undefined) {
        axis?.setAxisLineColor(xAxis?.axisLineColor);
      } else if (yAxisLeft?.axisLineColor != undefined && isyAxis === 'yAxisLeft') {
        axis?.setAxisLineColor(yAxisLeft?.axisLineColor);
      } else if (yAxisRight?.axisLineColor != undefined && isyAxis === 'yAxisRight') {
        axis?.setAxisLineColor(yAxisRight?.axisLineColor);
      }

      //设置图表周围边框的宽度，单位为vp。 axisLineWidth
      if (xAxis instanceof XAxis && xAxis?.axisLineWidth != undefined) {
        axis?.setAxisLineWidth(xAxis?.axisLineWidth);
      } else if (yAxisLeft?.axisLineWidth != undefined && isyAxis === 'yAxisLeft') {
        axis?.setAxisLineWidth(yAxisLeft?.axisLineWidth);
      } else if (yAxisRight?.axisLineWidth != undefined && isyAxis === 'yAxisRight') {
        axis?.setAxisLineWidth(yAxisRight?.axisLineWidth);
      }

      // 设置以虚线模式绘制网格线 gridDashedLine

      if (axis instanceof XAxis && xAxis?.gridDashedLine != undefined) {
        let gridDashedLineX = xAxis?.gridDashedLine;
        axis?.enableGridDashedLine(gridDashedLineX?.lineLength, gridDashedLineX?.spaceLength, gridDashedLineX?.phase)
      } else if (yAxisLeft?.gridDashedLine != undefined && isyAxis === 'yAxisLeft') {
        let gridDashedLineYL = yAxisLeft?.gridDashedLine;
        axis?.enableGridDashedLine(gridDashedLineYL?.lineLength, gridDashedLineYL?.spaceLength, gridDashedLineYL?.phase)
      } else if (yAxisRight?.gridDashedLine != undefined && isyAxis === 'yAxisRight') {
        let gridDashedLineYR = yAxisRight?.gridDashedLine;
        axis?.enableGridDashedLine(gridDashedLineYR?.lineLength, gridDashedLineYR?.spaceLength, gridDashedLineYR?.phase)
      }

      //设置限制线 limitLines
      let limitLines: LimitLinesType | undefined;
      if (axis instanceof XAxis && xAxis?.limitLines != undefined) {
        limitLines = xAxis?.limitLines
      } else if (yAxisLeft?.limitLines != undefined && isyAxis === 'yAxisLeft') {
        limitLines = yAxisLeft.limitLines
      } else if (yAxisRight?.limitLines != undefined && isyAxis === 'yAxisRight') {
        limitLines = yAxisRight?.limitLines
      }
      limitLines?.forEach((i) => {
        const limitLine: LimitLine = new LimitLine(i.limit, i.label!);
        if (i.label) {
          limitLine.setLabel(i.label);
        }
        if (i.lineColor) {
          limitLine.setLineColor(i.lineColor);
        }
        if (i.lineWidth) {
          limitLine.setLineWidth(i.lineWidth);
        }
        if (i.valueTextColor) {
          limitLine.setTextColor(i.valueTextColor);
        }
        if (i.labelPosition) {
          if (i.labelPosition === 'LEFT_TOP') {
            limitLine.setLabelPosition(LimitLabelPosition.LEFT_TOP)
          } else if (i.labelPosition === 'LEFT_BOTTOM') {
            limitLine.setLabelPosition(LimitLabelPosition.LEFT_BOTTOM)
          } else if (i.labelPosition === 'RIGHT_TOP') {
            limitLine.setLabelPosition(LimitLabelPosition.RIGHT_TOP);
          } else if (i.labelPosition === 'RIGHT_BOTTOM') {
            limitLine.setLabelPosition(LimitLabelPosition.RIGHT_BOTTOM)
          }
        }
        if (i.lineDashPhase != undefined && i.lineDashLengths != undefined) {
          const lineDashPhase = i.lineDashPhase
          const lineLength = i.lineDashLengths[0];
          const spaseLength = i.lineDashLengths[1];
          limitLine.enableDashedLine(lineDashPhase, lineLength, spaseLength);
        }
        axis?.addLimitLine(limitLine);
      })


      //设置在实际数据之后绘制限制线 默认值：false
      if (axis instanceof XAxis && xAxis?.drawLimitLinesBehindData != undefined) {
        axis?.setDrawLimitLinesBehindData(xAxis?.drawLimitLinesBehindData);
      } else if (yAxisLeft?.drawLimitLinesBehindData != undefined && isyAxis === 'yAxisLeft') {
        axis.setDrawLimitLinesBehindData(yAxisLeft?.drawLimitLinesBehindData)
      } else if (yAxisRight?.drawLimitLinesBehindData != undefined && isyAxis === 'yAxisRight') {
        axis.setDrawLimitLinesBehindData(yAxisRight?.drawLimitLinesBehindData)
      }

      // 设置轴的最大标签数 axisMaximum
      if (axis instanceof XAxis && xAxis?.axisMaximum != undefined) {
        axis?.setAxisMaximum(xAxis?.axisMaximum);
      } else if (yAxisLeft?.axisMaximum != undefined && isyAxis === 'yAxisLeft') {
        axis?.setAxisMaximum(yAxisLeft?.axisMaximum);
      } else if (yAxisRight?.axisMaximum != undefined && isyAxis === 'yAxisRight') {
        axis?.setAxisMaximum(yAxisRight?.axisMaximum);
      }

      //设置轴的最小标签数 axisMinimum
      if (axis instanceof XAxis && xAxis?.axisMinimum != undefined) {
        axis?.setAxisMinimum(xAxis?.axisMinimum);
      } else if (yAxisLeft?.axisMinimum != undefined && isyAxis === 'yAxisLeft') {
        axis?.setAxisMinimum(yAxisLeft?.axisMinimum);
      } else if (yAxisRight?.axisMinimum != undefined && isyAxis === 'yAxisRight') {
        axis?.setAxisMinimum(yAxisRight?.axisMinimum);
      }

      // 设置轴放大时的最小间隔 granularity
      if (axis instanceof XAxis && xAxis?.granularity != undefined) {
        axis?.setGranularity(xAxis?.granularity);
      } else if (yAxisLeft?.granularity != undefined && isyAxis === 'yAxisLeft') {
        axis?.setGranularity(yAxisLeft?.granularity);
      } else if (yAxisRight?.granularity != undefined && isyAxis === 'yAxisRight') {
        axis?.setGranularity(yAxisRight?.granularity);
      }

      //启用/禁用轴值间隔的粒度控制 granularityEnabled
      if (axis instanceof XAxis && xAxis?.granularityEnabled != undefined) {
        axis?.setGranularityEnabled(xAxis?.granularityEnabled);
      } else if (yAxisLeft?.granularityEnabled != undefined && isyAxis === 'yAxisLeft') {
        axis?.setGranularityEnabled(yAxisLeft?.granularityEnabled);
      } else if (yAxisRight?.granularityEnabled != undefined && isyAxis === 'yAxisRight') {
        axis?.setGranularityEnabled(yAxisRight?.granularityEnabled);
      }

      //设置y轴的标签条目数max = 25, min = 2，默认值：6 labelCount
      if (axis instanceof XAxis && xAxis?.labelCount != undefined) {
        let labelCountForce: boolean | undefined = false;
        if (xAxis?.labelCountForce != undefined || xAxis?.labelCountForce != null) {
          labelCountForce = xAxis?.labelCountForce
        }
        axis?.setLabelCount(xAxis?.labelCount, labelCountForce);
      } else if (yAxisLeft?.labelCount != undefined && isyAxis === 'yAxisLeft') {
        let labelCountForce: boolean | undefined = false;
        if (yAxisLeft?.labelCountForce != undefined || yAxisLeft?.labelCountForce != null) {
          labelCountForce = yAxisLeft?.labelCountForce
        }
        axis?.setLabelCount(yAxisLeft?.labelCount, labelCountForce);
      } else if (yAxisRight?.labelCount != undefined && isyAxis === 'yAxisRight') {
        let labelCountForce: boolean | undefined = false;
        if (yAxisRight?.labelCountForce != undefined || yAxisRight?.labelCountForce != null) {
          labelCountForce = yAxisRight?.labelCountForce
        }
        axis?.setLabelCount(yAxisRight?.labelCount, labelCountForce);
      }

      // 将轴标签居中，而不是在其原始位置绘制它们 centerAxisLabels
      if (axis instanceof XAxis && xAxis?.centerAxisLabels != undefined) {
        axis?.setCenterAxisLabels(xAxis?.centerAxisLabels);
      } else if (yAxisLeft?.centerAxisLabels != undefined && isyAxis === 'yAxisLeft') {
        axis?.setCenterAxisLabels(yAxisLeft?.centerAxisLabels);
      } else if (yAxisRight?.centerAxisLabels != undefined && isyAxis === 'yAxisRight') {
        axis?.setCenterAxisLabels(yAxisRight?.centerAxisLabels);
      }
    } else {

      let xAxis = isRadarCharts?.props.xAxis
      let yAxis = isRadarCharts.props.yAxis

      if (yAxis?.enabled != undefined && isyAxis === 'yAxis') {
        axis.setEnabled(yAxis?.enabled)
      } else if (xAxis?.enabled != undefined) {
        axis?.setEnabled(xAxis?.enabled);
      }

      if (yAxis?.drawLabels != undefined && isyAxis === 'yAxis') {
        axis?.setDrawLabels(yAxis?.drawLabels)
      } else if (xAxis?.drawLabels != undefined) {
        axis?.setDrawLabels(xAxis?.drawLabels)
      }

      if (yAxis?.drawAxisLine != undefined && isyAxis === 'yAxis') {
        axis.setDrawAxisLine(yAxis?.drawAxisLine)
      } else if (xAxis?.drawAxisLine != undefined) {
        axis?.setDrawAxisLine(xAxis?.drawAxisLine)
      }

      if (yAxis?.drawGridLines != undefined && isyAxis === 'yAxis') {
        axis.setDrawGridLines(yAxis?.drawGridLines)
      } else if (xAxis?.drawGridLines != undefined) {
        axis?.setDrawGridLines(xAxis?.drawGridLines)
      }

      if (yAxis?.textColor != undefined && isyAxis === 'yAxis') {
        axis.setTextColor(yAxis?.textColor)
      } else if (xAxis?.textColor != undefined) {
        axis?.setTextColor(xAxis?.textColor)
      }

      if (yAxis?.textSize != undefined && isyAxis === 'yAxis') {
        axis.setTextSize(yAxis?.textSize)
      } else if (xAxis?.textSize != undefined) {
        axis?.setTextSize(xAxis?.textSize)
      }
      if (yAxis?.gridColor != undefined && isyAxis === 'yAxis') {
        axis.setGridColor(yAxis?.gridColor)
      } else if (xAxis?.gridColor != undefined) {
        axis?.setGridColor(xAxis?.gridColor)
      }

      if (yAxis?.gridLineWidth != undefined && isyAxis === 'yAxis') {
        axis.setGridLineWidth(yAxis?.gridLineWidth)
      } else if (xAxis?.gridLineWidth != undefined) {
        axis?.setGridLineWidth(xAxis?.gridLineWidth)
      }


      if (yAxis?.gridLineWidth != undefined && isyAxis === 'yAxis') {
        axis.setAxisLineColor(yAxis?.axisLineColor)
      } else if (xAxis?.axisLineColor != undefined) {
        axis?.setAxisLineColor(xAxis?.axisLineColor)
      }

      if (yAxis?.axisLineWidth != undefined && isyAxis === 'yAxis') {
        axis.setAxisLineWidth(yAxis?.axisLineWidth)
      } else if (xAxis?.axisLineWidth != undefined) {
        axis?.setAxisLineWidth(xAxis?.axisLineWidth)
      }

      if (yAxis?.gridDashedLine != undefined && isyAxis === 'yAxis') {
        let gridDashedLine = yAxis?.gridDashedLine;
        axis?.enableGridDashedLine(gridDashedLine?.lineLength, gridDashedLine?.spaceLength, gridDashedLine?.phase)
      } else if (xAxis?.axisLineWidth != undefined) {
        let gridDashedLine = xAxis?.gridDashedLine;
        axis?.enableGridDashedLine(gridDashedLine?.lineLength, gridDashedLine?.spaceLength, gridDashedLine?.phase)
      }
      let limitLines: LimitLinesType | undefined;
      if (yAxis?.limitLines != undefined && isyAxis === 'yAxis') {
        limitLines = yAxis.limitLines
      } else if (xAxis?.limitLines != undefined) {
        limitLines = xAxis.limitLines
      }
      limitLines?.forEach((i) => {
        const limitLine: LimitLine = new LimitLine(i.limit, i.label!);
        if (i.label) {
          limitLine.setLabel(i.label);
        }
        if (i.lineColor) {
          limitLine.setLineColor(i.lineColor);
        }
        if (i.lineWidth) {
          limitLine.setLineWidth(i.lineWidth);
        }
        if (i.valueTextColor) {
          limitLine.setTextColor(i.valueTextColor);
        }
        if (i.labelPosition) {
          if (i.labelPosition === 'LEFT_TOP') {
            limitLine.setLabelPosition(LimitLabelPosition.LEFT_TOP)
          } else if (i.labelPosition === 'LEFT_BOTTOM') {
            limitLine.setLabelPosition(LimitLabelPosition.LEFT_BOTTOM)
          } else if (i.labelPosition === 'RIGHT_TOP') {
            limitLine.setLabelPosition(LimitLabelPosition.RIGHT_TOP);
          } else if (i.labelPosition === 'RIGHT_BOTTOM') {
            limitLine.setLabelPosition(LimitLabelPosition.RIGHT_BOTTOM)
          }
        }
        if (i.lineDashPhase != undefined && i.lineDashLengths != undefined) {
          const lineDashPhase = i.lineDashPhase
          const lineLength = i.lineDashLengths[0];
          const spaseLength = i.lineDashLengths[1];
          limitLine.enableDashedLine(lineDashPhase, lineLength, spaseLength);
        }
        axis?.addLimitLine(limitLine);
      })

      if (yAxis?.drawLimitLinesBehindData != undefined && isyAxis === 'yAxis') {
        axis.setDrawLimitLinesBehindData(yAxis?.drawLimitLinesBehindData)
      } else if (xAxis?.drawLimitLinesBehindData != undefined) {
        axis?.setDrawLimitLinesBehindData(xAxis?.drawLimitLinesBehindData)
      }

      if (yAxis?.axisMaximum != undefined && isyAxis === 'yAxis') {
        axis.setAxisMaximum(yAxis?.axisMaximum)
      } else if (xAxis?.axisMaximum != undefined) {
        axis?.setAxisMaximum(xAxis?.axisMaximum)
      }

      if (yAxis?.axisMinimum != undefined && isyAxis === 'yAxis') {
        axis.setAxisMinimum(yAxis?.axisMinimum)
      } else if (xAxis?.axisMinimum != undefined) {
        axis?.setAxisMinimum(xAxis?.axisMinimum)
      }

      if (yAxis?.granularity != undefined && isyAxis === 'yAxis') {
        axis.setGranularity(yAxis?.granularity)
      } else if (xAxis?.granularity != undefined) {
        axis?.setGranularity(xAxis?.granularity)
      }

      if (yAxis?.granularityEnabled != undefined && isyAxis === 'yAxis') {
        axis.setGranularityEnabled(yAxis?.granularityEnabled)
      } else if (xAxis?.granularityEnabled != undefined) {
        axis?.setGranularityEnabled(xAxis?.granularityEnabled)
      }

      if (yAxis?.labelCount != undefined && isyAxis === 'yAxis') {
        let labelCountForce: boolean | undefined = false;
        if (yAxis?.labelCountForce != undefined || yAxis?.labelCountForce != null) {
          labelCountForce = yAxis?.labelCountForce
        }
        axis?.setLabelCount(yAxis?.labelCount, labelCountForce);
      } else if (xAxis?.labelCount != undefined) {
        let labelCountForce: boolean | undefined = false;
        if (xAxis?.labelCountForce != undefined || xAxis?.labelCountForce != null) {
          labelCountForce = xAxis?.labelCountForce
        }
        axis?.setLabelCount(xAxis?.labelCount, labelCountForce);
      }

      if (yAxis?.centerAxisLabels != undefined && isyAxis === 'yAxis') {
        axis.setCenterAxisLabels(yAxis?.centerAxisLabels)
      } else if (xAxis?.centerAxisLabels != undefined) {
        axis?.setCenterAxisLabels(xAxis?.centerAxisLabels)
      }
    }

    //参数有问题
    // if(props.xAxis?.fontFamily){
    //   axis?.setTypeface(props.xAxis.fontFamily);
    // }


    //ohos Charts未支持 LargeValueFormatter
    // if(props.xAxis?.valueFormatter){
    //   let valueForMatter = props.xAxis.valueFormatter;
    //   // axis?.setValueFormatter(new LargeValueFormatter())
    // }
    //since 未找到
    //timeUnit 未找到
  }
