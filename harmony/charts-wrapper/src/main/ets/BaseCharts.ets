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
  BarChartModel,
  Legend,
  LineChartModel,
  LegendHorizontalAlignment,
  LegendVerticalAlignment,
  LegendOrientation,
  LegendDirection,
  LegendForm,
  Description,
  XAxis,
  BubbleChartModel,
  CandleStickChartModel,
  ScatterChartModel,
  XAxisPosition,
  CombinedChartModel,
  PieChartModel,
  RadarChartModel,
  HorizontalBarChartModel,
  LegendEntry,
  JArrayList,
  IAxisValueFormatter,
  AxisBase,
} from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setAxis } from './AxisBase';

type model = BarChartModel |
LineChartModel |
BubbleChartModel |
CandleStickChartModel |
ScatterChartModel |
CombinedChartModel |
PieChartModel |
RadarChartModel |
HorizontalBarChartModel

type RNChart = RNC.RNBarChart.DescriptorWrapper |
RNC.RNLineChart.DescriptorWrapper |
RNC.RNBubbleChart.DescriptorWrapper |
RNC.RNCandleStickChart.DescriptorWrapper |
RNC.RNHorizontalBarChart.DescriptorWrapper |
RNC.RNScatterChart.DescriptorWrapper |
RNC.RNCombinedChart.DescriptorWrapper |
RNC.RNRadarChart.DescriptorWrapper |
RNC.RNPieChart.DescriptorWrapper

type RNBaseChart = RNC.RNBarChart.DescriptorWrapper |
RNC.RNLineChart.DescriptorWrapper |
RNC.RNBubbleChart.DescriptorWrapper |
RNC.RNCandleStickChart.DescriptorWrapper |
RNC.RNHorizontalBarChart.DescriptorWrapper |
RNC.RNScatterChart.DescriptorWrapper |
RNC.RNCombinedChart.DescriptorWrapper
type RNRadar = RNC.RNRadarChart.DescriptorWrapper

export const setBaseProps =
  <T extends model, U extends RNChart, K extends RNBaseChart = RNBaseChart>(descriptorWrapper: U, model: T,
    BaseDescriptorWrapper?: K, isRadar?: RNRadar) => {
    let props = descriptorWrapper.props

    //设置动画 animation
    if (props.animation?.durationX != undefined) {
      model.animateX(props.animation.durationX);
    }
    if (props.animation?.durationY != undefined) {
      model.animateY(props.animation.durationY);
    }
    if (props.animation?.durationX != undefined && props.animation?.durationY != undefined) {
      model.animateXY(props.animation.durationX, props.animation.durationY);
    }


    // 设置描述部件Description
    let description: Description | null = model.getDescription();
    if (description != undefined) {


      if (props.chartDescription?.enabled != undefined) {
        description.setEnabled(props.chartDescription?.enabled);
      }
      // 设置要显示为说明的文本. text
      if (props.chartDescription?.text != undefined) {
        description.setText(props.chartDescription.text);
      }

      // 设置用于标签的文本颜色 textColor
      if (props.chartDescription?.textColor != undefined) {
        description.setTextColor(props.chartDescription.textColor);
      }

      // 设置标签文本的大小，单位为密度像素，最小值为6f，最大值为24f，默认值为10f textSize
      if (props.chartDescription?.textSize != undefined) {
        description.setTextSize(props.chartDescription.textSize);
      }

      // 设置说明文本在屏幕上的自定义位置（以像素为单位)  position
      if (props.chartDescription?.positionX != undefined) {
        description.setPosition(props.chartDescription.positionX, props.chartDescription?.positionY)
      }
      model.setDescription(description);
    }

    // 设置图例部件legend
    let legend: Legend | null = model.getLegend();

    if (legend || props.legend) {
      // 设置是否显示图例 enabled
      if (props.legend?.enabled != undefined) {
        legend?.setEnabled(props.legend.enabled);
      }

      //设置图例文本的颜色  textColor
      if (props.legend?.textColor != undefined) {
        legend?.setTextColor(props.legend?.textColor);
      }

      //设置图例文本的大小 textSize
      if (props.legend?.textSize != undefined) {
        legend?.setTextSize(props.legend?.textSize);
      }
      if (props.legend?.textSize != undefined) {
        legend?.setTextSize(props.legend?.textSize);
      }

      // 设置图例文字是否换行 wordWrapEnabled
      if (props.legend?.wordWrapEnabled != undefined) {
        legend?.setWordWrapEnabled(props.legend?.wordWrapEnabled);
      }
      // 设置整个图表视图的最大相对大小 maxSizePercent
      if (props.legend?.maxSizePercent != undefined) {
        legend?.setMaxSizePercent(props.legend?.maxSizePercent);
      }

      // 设置图例的水平对齐方式 HorizontalAlignment
      if (props.legend?.horizontalAlignment === "LEFT") {
        legend?.setHorizontalAlignment(LegendHorizontalAlignment.LEFT);
      } else if (props.legend?.horizontalAlignment === "RIGHT") {
        legend?.setHorizontalAlignment(LegendHorizontalAlignment.RIGHT);
      } else if (props.legend?.horizontalAlignment === "CENTER") {
        legend?.setHorizontalAlignment(LegendHorizontalAlignment.CENTER);
      }

      // 设置图例的垂直对齐方式 verticalAlignment
      if (props.legend?.verticalAlignment === "TOP") {
        legend?.setVerticalAlignment(LegendVerticalAlignment.TOP);
      } else if (props.legend?.verticalAlignment === "CENTER") {
        legend?.setVerticalAlignment(LegendVerticalAlignment.CENTER);
      } else if (props.legend?.verticalAlignment === "BOTTOM") {
        legend?.setVerticalAlignment(LegendVerticalAlignment.BOTTOM);
      }

      //设置图例的方向 orientation
      if (props.legend?.orientation === "HORIZONTAL") {
        legend?.setOrientation(LegendOrientation.HORIZONTAL);
      } else if (props.legend?.orientation === "VERTICAL") {
        legend?.setOrientation(LegendOrientation.VERTICAL);
      }
      if (props.legend?.drawInside != undefined) {
        legend?.setDrawInside(props.legend?.drawInside);
      }

      //设置图例的文本方向 direction
      if (props.legend?.direction === "RIGHT_TO_LEFT") {
        legend?.setDirection(LegendDirection.RIGHT_TO_LEFT);
      } else if (props.legend?.direction === "LEFT_TO_RIGHT") {
        legend?.setDirection(LegendDirection.LEFT_TO_RIGHT);
      }

      //设置图例形式的形式/形状 from
      if (props.legend?.form === "NONE") {
        legend?.setForm(LegendForm.NONE);
      } else if (props.legend?.form === "EMPTY") {
        legend?.setForm(LegendForm.EMPTY);
      } else if (props.legend?.form === "DEFAULT") {
        legend?.setForm(LegendForm.DEFAULT);
      } else if (props.legend?.form === "SQUARE") {
        legend?.setForm(LegendForm.SQUARE);
      } else if (props.legend?.form === "CIRCLE") {
        legend?.setForm(LegendForm.CIRCLE);
      } else if (props.legend?.form === "LINE") {
        legend?.setForm(LegendForm.LINE);
      }

      //设置图例格式的大小 formSize
      if (props.legend?.formSize != undefined) {
        legend?.setFormSize(props.legend.formSize);
      }

      //设置横轴上图例条目的间距 xEntrySpace
      if (props.legend?.xEntrySpace != undefined) {
        legend?.setXEntrySpace(props.legend.xEntrySpace);
      }

      //设置竖轴上图例条目的间距 yEntrySpace
      if (props.legend?.yEntrySpace != undefined) {
        legend?.setYEntrySpace(props.legend?.yEntrySpace);
      }

      //图例部件图标到文字的间距 formToTextSpace
      if (props.legend?.formToTextSpace != undefined) {
        legend?.setFormToTextSpace(props.legend?.formToTextSpace);
      }

      //图例部件字体
      if (props.legend?.fontFamily === 'sans-serif') {
        legend?.setTypeface(props.legend.fontFamily)
      } else if (props.legend?.fontFamily === 'serif') {
        legend?.setTypeface(props.legend.fontFamily)
      } else if (props.legend?.fontFamily === 'monospace') {
        legend?.setTypeface(props.legend.fontFamily)
      }


      //Custom labels & colors
      if (props.legend?.custom) {
        let color = props.legend.custom.colors;
        let label = props.legend.custom.labels;
        let legendEntries: JArrayList<LegendEntry> = new JArrayList<LegendEntry>();
        for (let i = 0; i < color!.length; i++) {
          legendEntries[i] = new LegendEntry();
          legendEntries[i].formColor = color![i];
          legendEntries[i].label = label![i];
        }
        legend?.setCustom(legendEntries);

      }
    }

    //设置启用日志 logEnabled
    if (props.logEnabled != undefined) {
      model.setLogEnabled(props.logEnabled)
    }

    //设置高亮 highlightPerTapEnabled
    if (props.highlightPerTapEnabled != undefined) {
      model.setHighlightPerTapEnabled(props.highlightPerTapEnabled);
    }

    // 设置无数据文本 noDataText
    if (props.noDataText != undefined) {
      model.setNoDataText(props.noDataText);
    }

    // 设置无数据文本颜色 noDataTextColor
    if (props.noDataTextColor != undefined) {
      model.setNoDataTextColor(props.noDataTextColor);
    }

    // 设置触摸 touchEnabled
    if (props.touchEnabled != undefined) {
      model.setTouchEnabled(props.touchEnabled);
    }

    //设置拖拽减速 dragDecelerationEnabled
    if (props.dragDecelerationEnabled != undefined) {
      model.setDragDecelerationEnabled(props.dragDecelerationEnabled);
    }

    // dragDecelerationFrictionCoef 阻力减速摩擦系数
    if (props.dragDecelerationFrictionCoef != undefined) {
      model.setDragDecelerationFrictionCoef(props.dragDecelerationFrictionCoef)
    }

    //设置X轴
    if (!(model instanceof PieChartModel)) {
      let xAxis: XAxis | null = model.getXAxis();
      // 设置X轴的公共props
      if (model instanceof RadarChartModel) {
        setAxis(xAxis as XAxis, BaseDescriptorWrapper, "yAxis", isRadar)
      } else {
        setAxis(xAxis as XAxis, BaseDescriptorWrapper)
      }

      // 设置绘制X轴标签的角度（以度为单位） labelRotationAngle
      if (props.xAxis?.labelRotationAngle != undefined) {
        xAxis?.setLabelRotationAngle(props.xAxis.labelRotationAngle);
      }


      // 如果设置为true，图表将避免第一个和最后一个标签条目 avoidFirstLastClipping
      // 在图表中“剪切”图表或屏幕的边缘
      if (props.xAxis?.avoidFirstLastClipping != undefined) {
        xAxis?.setAvoidFirstLastClipping(props.xAxis.avoidFirstLastClipping)
      }

      // 设置X轴标签的位置 position
      if (props.xAxis?.position === 'TOP') {
        xAxis?.setPosition(XAxisPosition.TOP)
      } else if (props.xAxis?.position === 'TOP_INSIDE') {
        xAxis?.setPosition(XAxisPosition.TOP_INSIDE);
      } else if (props.xAxis?.position === 'BOTTOM') {
        xAxis?.setPosition(XAxisPosition.BOTTOM);
      } else if (props.xAxis?.position === 'BOTH_SIDED') {
        xAxis?.setPosition(XAxisPosition.BOTH_SIDED);
      } else if (props.xAxis?.position === 'BOTTOM_INSIDE') {
        xAxis?.setPosition(XAxisPosition.BOTTOM_INSIDE);
      }

      // 为该轴上的标签设置使用的y轴偏移量 yOffset
      if (props.xAxis?.yOffset != undefined) {
        xAxis?.setYOffset(props.xAxis.yOffset)
      }

    }
    if (props.highlights != undefined) {
      props.highlights.forEach((highlight) => {
        let x = highlight.x;
        let dataSetIndex = highlight.dataSetIndex;
        let stackIndex = highlight.stackIndex;
        model.highlightValue(x, dataSetIndex, stackIndex)
      })
    }
  }

