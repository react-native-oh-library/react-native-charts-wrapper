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

import {
  AxisDependency,
  BarChartModel,
  BubbleChartModel,
  CandleStickChartModel,
  CombinedChartModel,
  HorizontalBarChartModel,
  LineChartModel,
  ScatterChartModel,
  YAxis,
  YAxisLabelPosition
} from '@ohos/mpchart'
import { RNC } from '@rnoh/react-native-openharmony/generated'
import { setAxis } from './AxisBase'


export type model = BarChartModel |
LineChartModel |
BubbleChartModel |
CandleStickChartModel |
ScatterChartModel |
CombinedChartModel |
HorizontalBarChartModel

type RNChart = RNC.RNBarChart.DescriptorWrapper |
RNC.RNLineChart.DescriptorWrapper |
RNC.RNBubbleChart.DescriptorWrapper |
RNC.RNCandleStickChart.DescriptorWrapper |
RNC.RNHorizontalBarChart.DescriptorWrapper |
RNC.RNScatterChart.DescriptorWrapper |
RNC.RNCombinedChart.DescriptorWrapper

export const setBarLineChart = <T extends model, U extends RNChart>(descriptorWrapper: U, model: T) => {
  let props = descriptorWrapper.props

  // 设置最大高光距离 maxHighlightDistance
  if (props.maxHighlightDistance != undefined) {
    model.setMaxHighlightDistance(props.maxHighlightDistance);
  }

  // 是否设置网格背景颜色 drawGridBackground
  if (props.drawGridBackground != undefined) {
    model.setDrawGridBackground(props.drawGridBackground);
  }

  //设置网格背景颜色 gridBackgroundColor
  if (props.gridBackgroundColor != undefined) {
    model.setGridBackgroundColor(props.gridBackgroundColor)
  }

  //是否设置边框 drawBorders
  if (props.drawBorders != undefined) {
    model.setDrawBorders(props.drawBorders);
  }

  //设置边框颜色 borderColor
  if (props.borderColor != undefined) {
    model.setBorderColor(props.borderColor);
  }

  //设置边框宽度 borderWidth
  if (props.borderWidth != undefined) {
    model.setBorderWidth(props.borderWidth);
  }

  //设置最小偏移 minOffset
  if (props.minOffset != undefined) {
    model.setMinOffset(props.minOffset);
  }

  //设置值的最大条目数量 maxVisibleValueCount
  if (props.maxVisibleValueCount != undefined) {
    model.setMaxVisibleValueCount(props.maxVisibleValueCount);
  }

  // 限制通过捏合和缩放可以看到的最大和最小x范围 visibleRange
  if (props.visibleRange != undefined) {
    if (props.visibleRange.x) {
      model.setVisibleXRangeMinimum(props.visibleRange.x.min);
      model.setVisibleXRangeMaximum(props.visibleRange.x.max);
    }
    if (props.visibleRange.y) {
      if (props.visibleRange.y.left) {
        model.setVisibleYRangeMinimum(props.visibleRange.y.left.min, AxisDependency.LEFT);
        model.setVisibleYRangeMaximum(props.visibleRange.y.left.max, AxisDependency.LEFT);
      }
      if (props.visibleRange.y.right) {
        model.setVisibleYRangeMinimum(props.visibleRange.y.right.min, AxisDependency.RIGHT);
        model.setVisibleYRangeMaximum(props.visibleRange.y.right.max, AxisDependency.RIGHT)
      }
    }
  }

  // 是否设置Y轴的自动缩放标记 autoScaleMinMaxEnabled
  if (props.autoScaleMinMaxEnabled != undefined) {
    model.setAutoScaleMinMaxEnabled(props.autoScaleMinMaxEnabled);
  }

  //设置图表在旋转（方向更改）后是否应保持其位置（缩放/滚动） keepPositionOnRotation
  if (props.keepPositionOnRotation != undefined) {
    model.setKeepPositionOnRotation(props.keepPositionOnRotation)
  }

  // 设置false,可防止值通过点击手势突出显示 highlightPerDragEnabled
  if (props.highlightPerTapEnabled != undefined) {
    model.setHighlightPerTapEnabled(props.highlightPerTapEnabled);
  }

  //是否启用缩放 scaleEnabled
  if (props.scaleEnabled != undefined) {
    model.setScaleEnabled(props.scaleEnabled);
  }

  // 是否启用X轴缩放 scaleXEnabled
  if (props.scaleXEnabled != undefined) {
    model.setScaleXEnabled(props.scaleXEnabled);
  }

  //是否启用Y轴缩放 scaleXEnabled
  if (props.scaleYEnabled != undefined) {
    model.setScaleYEnabled(props.scaleYEnabled)
  }

  //是否设置拖动 dragEnabled
  if (props.dragEnabled != undefined) {
    model.setDragEnabled(props.dragEnabled);
  }

  //  如果设置为true，则x和y轴都可以用2个手指同时缩放，如果为false，
  //  x轴和y轴可以单独缩放。pinchZoom
  if (props.pinchZoom != undefined) {
    model.setPinchZoom(props.pinchZoom);
  }

  //doubleTapToZoomEnabled 将此属性设置为true可通过双击图表启用放大功能。
  if (props.doubleTapToZoomEnabled != undefined) {
    model.setDoubleTapToZoomEnabled(props.doubleTapToZoomEnabled)
  }

  //设置y轴 yAxis
  if (props.yAxis) {
    let yAxisLeft: YAxis | null = model.getAxisLeft();
    let yAxisRight: YAxis | null = model.getAxisRight();
    // 设置Y轴的公共props
    if (yAxisLeft && !yAxisRight) {
      setAxis(yAxisLeft as YAxis, descriptorWrapper, 'yAxisLeft')
    } else if (!yAxisLeft && yAxisRight) {
      setAxis(yAxisRight as YAxis, descriptorWrapper, 'yAxisRight')
    } else {
      setAxis(yAxisLeft as YAxis, descriptorWrapper, 'yAxisLeft')
      setAxis(yAxisRight as YAxis, descriptorWrapper, 'yAxisRight')
    }

    //设置左侧Y轴和右侧Y轴
    if (props.yAxis.left != undefined || props.yAxis.right != undefined) {

      //设置为true，则反转y轴，这意味着低值位于图表底部 inverted
      if (props.yAxis.left?.inverted != undefined && !yAxisRight) {
        yAxisLeft?.setInverted(props.yAxis.left.inverted);
      } else if (props.yAxis.right?.inverted != undefined && !yAxisLeft) {
        yAxisRight?.setInverted(props.yAxis.right.inverted);
      } else if (props.yAxis.left?.inverted != undefined && props.yAxis.right?.inverted != undefined) {
        yAxisLeft?.setInverted(props.yAxis.left.inverted);
        yAxisRight?.setInverted(props.yAxis.right.inverted);
      }

      // 设置顶轴间距，以占满量程的百分比为单位。默认值10f spaceTop
      if (props.yAxis.left?.spaceTop != undefined && !yAxisRight) {
        yAxisLeft?.setSpaceTop(props.yAxis.left.spaceTop);
      } else if (props.yAxis.right?.spaceTop != undefined && !yAxisLeft) {
        yAxisRight?.setSpaceTop(props.yAxis.right.spaceTop);
      } else if (props.yAxis.left?.spaceTop != undefined && props.yAxis.right?.spaceTop != undefined) {
        yAxisLeft?.setSpaceTop(props.yAxis.left?.spaceTop);
        yAxisRight?.setSpaceTop(props.yAxis.right?.spaceTop);
      }

      // 设置底轴间距，以占满量程的百分比为单位。默认值10f spaceBottom
      if (props.yAxis.left?.spaceBottom != undefined && !yAxisRight) {
        yAxisLeft?.setSpaceBottom(props.yAxis.left.spaceBottom);
      } else if (props.yAxis.right?.spaceBottom != undefined && !yAxisLeft) {
        yAxisRight?.setSpaceBottom(props.yAxis.right.spaceBottom);
      } else if (props.yAxis.left?.spaceBottom != undefined && props.yAxis.right?.spaceBottom != undefined) {
        yAxisLeft?.setSpaceBottom(props.yAxis.left?.spaceBottom);
        yAxisRight?.setSpaceBottom(props.yAxis.right?.spaceBottom);
      }

      // 设置y标签的位置 position
      if (props.yAxis.left?.position === 'OUTSIDE_CHART' && !yAxisRight) {
        yAxisLeft?.setPosition(YAxisLabelPosition.OUTSIDE_CHART);
      } else if (props.yAxis.left?.position === 'INSIDE_CHART' && !yAxisRight) {
        yAxisLeft?.setPosition(YAxisLabelPosition.INSIDE_CHART);
      } else if (props.yAxis.right?.position === 'OUTSIDE_CHART' && !yAxisLeft) {
        yAxisRight?.setPosition(YAxisLabelPosition.OUTSIDE_CHART);
      } else if (props.yAxis.right?.position === 'INSIDE_CHART' && !yAxisLeft) {
        yAxisRight?.setPosition(YAxisLabelPosition.INSIDE_CHART);
      } else if (props.yAxis.left?.position === 'OUTSIDE_CHART' && props.yAxis.right?.position === 'OUTSIDE_CHART') {
        yAxisLeft?.setPosition(YAxisLabelPosition.OUTSIDE_CHART);
        yAxisRight?.setPosition(YAxisLabelPosition.OUTSIDE_CHART);
      } else if (props.yAxis.left?.position === 'INSIDE_CHART' && props.yAxis.right?.position === 'INSIDE_CHART') {
        yAxisLeft?.setPosition(YAxisLabelPosition.INSIDE_CHART);
        yAxisRight?.setPosition(YAxisLabelPosition.INSIDE_CHART);
      }

      // 设置轴可以采用的最大宽度（单位为vp）。 maxWidth
      if (props.yAxis.left?.maxWidth != undefined && !yAxisRight) {
        yAxisLeft?.setMaxWidth(props.yAxis.left.maxWidth);
      } else if (props.yAxis.right?.maxWidth != undefined && !yAxisLeft) {
        yAxisRight?.setMaxWidth(props.yAxis.right.maxWidth);
      } else if (props.yAxis.left?.maxWidth != undefined && props.yAxis.right?.maxWidth != undefined) {
        yAxisLeft?.setMaxWidth(props.yAxis.left?.maxWidth);
        yAxisRight?.setMaxWidth(props.yAxis.right?.maxWidth);
      }


      // 设置轴可以采用的最小宽度（单位为vp）。 minWidth
      if (props.yAxis.left?.minWidth != undefined && !yAxisRight) {
        yAxisLeft?.setMinWidth(props.yAxis.left.minWidth);
      } else if (props.yAxis.right?.minWidth != undefined && !yAxisLeft) {
        yAxisRight?.setMinWidth(props.yAxis.right.minWidth);
      } else if (props.yAxis.left?.minWidth != undefined && props.yAxis.right?.minWidth != undefined) {
        yAxisLeft?.setMinWidth(props.yAxis.left?.minWidth);
        yAxisRight?.setMinWidth(props.yAxis.right?.minWidth);
      }

      //网格线是否启用。默认值：false zeroLine.enabled
      if (props.yAxis.left?.zeroLine?.enabled != undefined && !yAxisRight) {
        yAxisLeft?.setDrawZeroLine(props.yAxis.left.zeroLine?.enabled);
      } else if (props.yAxis.right?.zeroLine?.enabled != undefined && !yAxisLeft) {
        yAxisRight?.setDrawZeroLine(props.yAxis.right.zeroLine?.enabled);
      } else if (props.yAxis.left?.zeroLine?.enabled != undefined &&
        props.yAxis.right?.zeroLine?.enabled != undefined) {
        yAxisLeft?.setDrawZeroLine(props.yAxis.left?.zeroLine?.enabled);
        yAxisRight?.setDrawZeroLine(props.yAxis.right?.zeroLine?.enabled);
      }

      //设置网格线的宽度 zeroLine.lineWidth
      if (props.yAxis.left?.zeroLine?.lineWidth != undefined && !yAxisRight) {
        yAxisLeft?.setZeroLineWidth(props.yAxis.left.zeroLine?.lineWidth);
      } else if (props.yAxis.right?.zeroLine?.lineWidth != undefined && !yAxisLeft) {
        yAxisRight?.setZeroLineWidth(props.yAxis.right.zeroLine?.lineWidth);
      } else if (props.yAxis.left?.zeroLine?.lineWidth != undefined &&
        props.yAxis.right?.zeroLine?.lineWidth != undefined) {
        yAxisLeft?.setZeroLineWidth(props.yAxis.left?.zeroLine?.lineWidth);
        yAxisRight?.setZeroLineWidth(props.yAxis.right.zeroLine?.lineWidth);
      }

      //设置网格线的颜色 zeroLine.lineColor
      if (props.yAxis.left?.zeroLine?.lineColor != undefined && !yAxisRight) {
        yAxisLeft?.setZeroLineColor(props.yAxis.left.zeroLine?.lineColor);
      } else if (props.yAxis.right?.zeroLine?.lineColor != undefined && !yAxisLeft) {
        yAxisRight?.setZeroLineColor(props.yAxis.right.zeroLine?.lineColor);
      } else if (props.yAxis.left?.zeroLine?.lineColor != undefined &&
        props.yAxis.right?.zeroLine?.lineColor != undefined) {
        yAxisLeft?.setZeroLineColor(props.yAxis.left?.zeroLine?.lineColor);
        yAxisRight?.setZeroLineColor(props.yAxis.right?.zeroLine?.lineColor);
      }
    }
  }

  // 按给定的比例因子放大或缩小 zoom
  if (props.zoom != undefined) {
    let zoom = props.zoom
    model.zoom(zoom.scaleX, zoom.scaleY, zoom.xValue, zoom.yValue)
    if (props.zoom.axisDependency === 'LEFT') {
      model.zoom(zoom.scaleX, zoom.scaleY, zoom.xValue, zoom.yValue, AxisDependency.LEFT)
    } else {
      model.zoom(zoom.scaleX, zoom.scaleY, zoom.xValue, zoom.yValue, AxisDependency.RIGHT)
    }
  }

  // 设置当前ViewPort的自定义偏移 viewPortOffsets
  if (props.viewPortOffsets != undefined) {
    let viewPortOffsets = props.viewPortOffsets
    model.setViewPortOffsets(viewPortOffsets.top, viewPortOffsets.bottom, viewPortOffsets.left, viewPortOffsets.right)
  }

  //extraOffsets 设置附加到图表视图的额外偏移量（围绕图表视图）自动计算偏移量。
  if (props.extraOffsets != undefined) {
    let extraOffsets = props.extraOffsets;
    model.setExtraOffsets(extraOffsets.left, extraOffsets.top, extraOffsets.right, extraOffsets.bottom)
  }
}