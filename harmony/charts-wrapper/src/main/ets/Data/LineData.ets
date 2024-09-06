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
  EntryOhos,
  ILineDataSet,
  JArrayList,
  LineData,
  LineDataSet,
  Mode,
  CombinedData,
  ChartColorStop
} from '@ohos/mpchart';
import { RNC } from '@rnoh/react-native-openharmony/generated';

export const setLineData = (isLine: string, descriptorWrapper: RNC.RNLineChart.DescriptorWrapper,
  ComDescriptorWrapper?: RNC.RNCombinedChart.DescriptorWrapper, CombinedData?: CombinedData): LineData | null => {

  let dataSetList: JArrayList<ILineDataSet> = new JArrayList<ILineDataSet>();
  let label: string | undefined


  if (descriptorWrapper && isLine === 'Line') {
    let dataSetProps = descriptorWrapper.props.data;
    dataSetProps.dataSets?.forEach((data) => {
      let values: JArrayList<EntryOhos> = new JArrayList<EntryOhos>();
      data.values?.forEach((v) => {
        values.add(new EntryOhos(v.x, v.y));
      })
      label = data.label


      let dataSet: LineDataSet = new LineDataSet(values, label!);
      let config = data.config
      //设置用于绘制突出显示指示器的颜色 highlightColor
      if (config?.highlightColor != undefined) {
        dataSet.setHighLightColor(config?.highlightColor)
      }

      //设置应该用于此数据集的唯一颜色 color
      if (config?.color != undefined) {
        dataSet.setColorByColor(config?.color);
      }

      //设置应该用于此数据集，由多个颜色组成 colors
      if (config?.colors != undefined) {
        dataSet.setColorsByArr(config?.colors);
      }

      //设置是否高亮 highlightEnabled
      if (config?.highlightEnabled != undefined) {
        dataSet.setHighlightEnabled(config?.highlightEnabled);
      }

      //设置是否绘制值 drawValues
      if (config?.drawValues != undefined) {
        dataSet.setDrawValues(config?.drawValues);
      }

      //设置值的文本大小 valueTextSize
      if (config?.valueTextSize != undefined) {
        dataSet.setValueTextSize(config?.valueTextSize);
      }

      //设置值的文本颜色 valueTextColor
      if (config?.valueTextColor != undefined) {
        dataSet.setValueTextColor(config.valueTextColor);
      }

      //设置值是否可见 visible
      if (config?.visible != undefined) {
        dataSet.setVisible(config.visible);
      }
      // 参数有点问题  valueFormatter
      // if(config?.valueFormatter === 'largeValue'){
      //   dataSet.setValueFormatter(IValueFormatter);
      //
      // }

      //设置轴依赖关系 axisDependency
      if (config?.axisDependency === 'LEFT') {
        dataSet.setAxisDependency(AxisDependency.LEFT);
      } else if (config?.axisDependency === 'RIGHT') {
        dataSet.setAxisDependency(AxisDependency.RIGHT);
      }

      //设置绘制的圆的半径。最小是1f。 circleRadius
      if (config?.circleRadius != undefined) {
        dataSet.setCircleRadius(config.circleRadius);
      }

      //将此值设置为true以启用此的圆圈指示器的绘制数据 默认为true drawCircles
      if (config?.drawCircles != undefined) {
        dataSet.setDrawCircles(config.drawCircles);
      }

      //设置lineDataSet的绘制模式
      if (config?.mode != undefined) {
        if (config.mode === 'LINEAR') {
          dataSet.setMode(Mode.LINEAR);
        } else if (config.mode === 'STEPPED') {
          dataSet.setMode(Mode.STEPPED);
        } else if (config.mode === 'CUBIC_BEZIER') {
          dataSet.setMode(Mode.CUBIC_BEZIER)
        } else if (config.mode === 'HORIZONTAL_BEZIER') {
          dataSet.setMode(Mode.HORIZONTAL_BEZIER);
        }
      }

      //drawCubicIntensity 暂无

      //设置应该用于此数据集的唯一颜色。 circleColor
      if (config?.circleColor != undefined) {
        dataSet.setCircleColor(config.circleColor);
      }

      //设置应该用于此数据集的颜色集。 circleColors
      if (config?.circleColors != undefined) {
        dataSet.setCircleColors(config.circleColors);
      }

      // circleHoleColor 设置线条圆的内圆的颜色。
      if (config?.circleHoleColor != undefined) {
        dataSet.setCircleHoleColor(config.circleHoleColor)
      }

      //将其设置为true以允许在每个数据圆中绘制一个孔。drawCircleHole
      if (config?.drawCircleHole != undefined) {
        dataSet.setDrawCircleHole(config.drawCircleHole);
      }

      // 启用以虚线模式绘制线条。dashedLine
      if (config?.dashedLine != undefined) {
        let lineLength = config.dashedLine.lineLength;
        let spaceLength = config.dashedLine.spaceLength;
        let phase = config.dashedLine.phase;
        dataSet.enableDashedLine(lineLength, spaceLength, phase);
      }

      // 启用/禁用垂直突出显示指示器。如果禁用，则不绘制指示器。 drawVerticalHighlightIndicator
      if (config?.drawVerticalHighlightIndicator != undefined) {
        dataSet.setDrawVerticalHighlightIndicator(config?.drawVerticalHighlightIndicator)
      }

      // 启用/禁用水平突出显示指示器。如果禁用，则不绘制指示器。 drawHorizontalHighlightIndicator
      if (config?.drawHorizontalHighlightIndicator != undefined) {
        dataSet.setDrawHorizontalHighlightIndicator(config.drawHorizontalHighlightIndicator);
      }

      //  设置突出显示行的宽度，以vp为单位 highlightLineWidth
      if (config?.highlightLineWidth != undefined) {
        dataSet.setHighlightLineWidth(config.highlightLineWidth);
      }

      //drawHighlightIndicators 启用/禁用垂直和水平突出显示指示器。
      if (config?.drawHighlightIndicators != undefined) {
        dataSet.setDrawHighlightIndicators(config?.drawHighlightIndicators)
      }

      //  设置折线宽度，以vp为单位 lineWidth
      if (config?.lineWidth != undefined) {
        dataSet.setLineWidth(config.lineWidth);
      }

      //设置填充 fillFormatter
      if(config?.drawFilled && config.fillColor!=undefined){
       let gradientFillColor = new JArrayList<ChartColorStop>();
       let fillColor = config.fillColor.toString();
       gradientFillColor.add([fillColor,config.fillAlpha]);
       dataSet.setGradientFillColor(gradientFillColor);
       dataSet.setDrawFilled(config.drawFilled)
      }

      dataSetList.add(dataSet);
    })
  } else {
    let dataSetComProps = ComDescriptorWrapper?.props.data?.lineData
    dataSetComProps?.dataSets?.forEach((data) => {
      let values: JArrayList<EntryOhos> = new JArrayList<EntryOhos>();
      data.values?.forEach((v) => {
        values.add(new EntryOhos(v.x, v.y));
      })
      label = data.label

      let dataSet: LineDataSet = new LineDataSet(values, label!);
      let config = data.config
      //设置用于绘制突出显示指示器的颜色 highlightColor
      if (config?.highlightColor != undefined) {
        dataSet.setHighLightColor(config?.highlightColor)
      }

      //设置应该用于此数据集的唯一颜色 color
      if (config?.color != undefined) {
        dataSet.setColorByColor(config?.color);
      }

      //设置应该用于此数据集，由多个颜色组成 colors
      if (config?.colors != undefined) {
        dataSet.setColorsByArr(config?.colors);
      }

      //设置是否高亮 highlightEnabled
      if (config?.highlightEnabled != undefined) {
        dataSet.setHighlightEnabled(config?.highlightEnabled);
      }

      //设置是否绘制值 drawValues
      if (config?.drawValues != undefined) {
        dataSet.setDrawValues(config?.drawValues);
      }

      //设置值的文本大小 valueTextSize
      if (config?.valueTextSize != undefined) {
        dataSet.setValueTextSize(config?.valueTextSize);
      }

      //设置值的文本颜色 valueTextColor
      if (config?.valueTextColor != undefined) {
        dataSet.setValueTextColor(config.valueTextColor);
      }

      //设置值是否可见 visible
      if (config?.visible != undefined) {
        dataSet.setVisible(config.visible);
      }
      // 参数有点问题  valueFormatter
      // if(config?.valueFormatter === 'largeValue'){
      //   dataSet.setValueFormatter(IValueFormatter);
      //
      // }

      //设置轴依赖关系 axisDependency
      if (config?.axisDependency === 'LEFT') {
        dataSet.setAxisDependency(AxisDependency.LEFT);
      } else if (config?.axisDependency === 'RIGHT') {
        dataSet.setAxisDependency(AxisDependency.RIGHT);
      }

      //设置绘制的圆的半径。最小是1f。 circleRadius
      if (config?.circleRadius != undefined) {
        dataSet.setCircleRadius(config.circleRadius);
      }

      //将此值设置为true以启用此的圆圈指示器的绘制数据 默认为true drawCircles
      if (config?.drawCircles != undefined) {
        dataSet.setDrawCircles(config.drawCircles);
      }

      //设置lineDataSet的绘制模式
      if (config?.mode != undefined) {
        if (config.mode === 'LINEAR') {
          dataSet.setMode(Mode.LINEAR);
        } else if (config.mode === 'STEPPED') {
          dataSet.setMode(Mode.STEPPED);
        } else if (config.mode === 'CUBIC_BEZIER') {
          dataSet.setMode(Mode.CUBIC_BEZIER)
        } else if (config.mode === 'HORIZONTAL_BEZIER') {
          dataSet.setMode(Mode.HORIZONTAL_BEZIER);
        }
      }

      //drawCubicIntensity 暂无

      //设置应该用于此数据集的唯一颜色。 circleColor
      if (config?.circleColor != undefined) {
        dataSet.setCircleColor(config.circleColor);
      }

      //设置应该用于此数据集的颜色集。 circleColors
      if (config?.circleColors != undefined) {
        dataSet.setCircleColors(config.circleColors);
      }

      // circleHoleColor 设置线条圆的内圆的颜色。
      if (config?.circleHoleColor != undefined) {
        dataSet.setCircleHoleColor(config.circleHoleColor)
      }

      //将其设置为true以允许在每个数据圆中绘制一个孔。drawCircleHole
      if (config?.drawCircleHole != undefined) {
        dataSet.setDrawCircleHole(config.drawCircleHole);
      }

      // 启用以虚线模式绘制线条。dashedLine
      if (config?.dashedLine != undefined) {
        let lineLength = config.dashedLine.lineLength;
        let spaceLength = config.dashedLine.spaceLength;
        let phase = config.dashedLine.phase;
        dataSet.enableDashedLine(lineLength, spaceLength, phase);
      }

      // 启用/禁用垂直突出显示指示器。如果禁用，则不绘制指示器。 drawVerticalHighlightIndicator
      if (config?.drawVerticalHighlightIndicator != undefined) {
        dataSet.setDrawVerticalHighlightIndicator(config?.drawVerticalHighlightIndicator)
      }

      // 启用/禁用水平突出显示指示器。如果禁用，则不绘制指示器。 drawHorizontalHighlightIndicator
      if (config?.drawHorizontalHighlightIndicator != undefined) {
        dataSet.setDrawHorizontalHighlightIndicator(config.drawHorizontalHighlightIndicator);
      }

      //  设置突出显示行的宽度，以vp为单位 highlightLineWidth
      if (config?.highlightLineWidth != undefined) {
        dataSet.setHighlightLineWidth(config.highlightLineWidth);
      }

      //drawHighlightIndicators 启用/禁用垂直和水平突出显示指示器。
      if (config?.drawHighlightIndicators != undefined) {
        dataSet.setDrawHighlightIndicators(config?.drawHighlightIndicators)
      }
      //  设置折线宽度，以vp为单位 lineWidth
      if (config?.lineWidth != undefined) {
        dataSet.setLineWidth(config.lineWidth);
      }

      //设置填充 fillFormatter
      if(config?.drawFilled && config.fillColor!=undefined){
        let gradientFillColor = new JArrayList<ChartColorStop>();
        let fillColor = config.fillColor.toString();
        gradientFillColor.add([fillColor,config.fillAlpha]);
        dataSet.setGradientFillColor(gradientFillColor);
        dataSet.setDrawFilled(config.drawFilled)
      }



      dataSetList.add(dataSet);
    })
  }

  let lineData: LineData = new LineData(dataSetList);
  if (CombinedData != undefined) {
    CombinedData?.setLineData(lineData);
  }
  return lineData;
}