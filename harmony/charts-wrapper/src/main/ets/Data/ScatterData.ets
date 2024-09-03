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
  ChartShape,
  CombinedData,
  EntryOhos,
  IScatterDataSet,
  JArrayList,
  ScatterData,
  ScatterDataSet
} from '@ohos/mpchart'
import { RNC } from '@rnoh/react-native-openharmony/generated'

export const setScatterData = (isScatter: string, descriptorWrapper: RNC.RNScatterChart.DescriptorWrapper,
  ComDescriptorWrapper?: RNC.RNCombinedChart.DescriptorWrapper, CombinedData?: CombinedData): ScatterData | null => {

  let label: string | undefined

  let dataSetList: JArrayList<IScatterDataSet> = new JArrayList<IScatterDataSet>();
  if (descriptorWrapper && isScatter === 'Scatter') {
    let dataSetProps = descriptorWrapper.props.data;
    dataSetProps.dataSets.forEach((data) => {
      let values: JArrayList<EntryOhos> = new JArrayList<EntryOhos>();
      data.values?.forEach((v) => {
        values.add(new EntryOhos(v.x, v.y));
      })
      label = data.label

      let dataSet: ScatterDataSet = new ScatterDataSet(values, label!)
      let config = data.config;

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

      // scatterShapeSize 设置绘制的scattershape将具有的大小（以密度像素为单位）。这个仅适用于非自定义形状。
      if (config?.scatterShapeSize != undefined) {
        dataSet.setScatterShapeSize(config.scatterShapeSize)
      }

      //scatterShape 设置绘制此DataSet时应使用的散点形状。
      if (config?.scatterShape != undefined) {
        if (config?.scatterShape === 'SQUARE') {
          dataSet.setScatterShape(ChartShape.SQUARE)
        } else if (config.scatterShape === 'CIRCLE') {
          dataSet.setScatterShape(ChartShape.CIRCLE);
        } else if (config.scatterShape === 'TRIANGLE') {
          dataSet.setScatterShape(ChartShape.TRIANGLE);
        } else if (config.scatterShape === 'CROSS') {
          dataSet.setScatterShape(ChartShape.CROSS);
        } else if (config.scatterShape === 'X') {
          dataSet.setScatterShape(ChartShape.X);
        }


        // scatterShapeHoleColor 设置形状中孔的颜色。
        if (config.scatterShapeHoleColor != undefined) {
          dataSet.setScatterShapeHoleColor(config.scatterShapeHoleColor);
        }

        //scatterShapeHoleRadius 设置形状中孔的半径（适用于正方形、圆形和三角形）将其设置为<=0以删除孔。
        if (config.scatterShapeHoleRadius != undefined) {
          dataSet.setScatterShapeHoleRadius(config.scatterShapeHoleRadius);
        }
      }


      dataSetList.add(dataSet);
    })
  } else {
    let dataSetComProps = ComDescriptorWrapper?.props.data?.scatterData;
    dataSetComProps?.dataSets.forEach((data) => {
      let values: JArrayList<EntryOhos> = new JArrayList<EntryOhos>();
      data.values?.forEach((v) => {
        values.add(new EntryOhos(v.x, v.y));
      })
      label = data.label

      let dataSet: ScatterDataSet = new ScatterDataSet(values, label!)
      let config = data.config;

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

      //设置轴依赖关系 axisDependency
      if (config?.axisDependency === 'LEFT') {
        dataSet.setAxisDependency(AxisDependency.LEFT);
      } else if (config?.axisDependency === 'RIGHT') {
        dataSet.setAxisDependency(AxisDependency.RIGHT);
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

      // scatterShapeSize 设置绘制的scattershape将具有的大小（以密度像素为单位）。这个仅适用于非自定义形状。
      if (config?.scatterShapeSize != undefined) {
        dataSet.setScatterShapeSize(config.scatterShapeSize)
      }

      //scatterShape 设置绘制此DataSet时应使用的散点形状。
      if (config?.scatterShape != undefined) {
        if (config?.scatterShape === 'SQUARE') {
          dataSet.setScatterShape(ChartShape.SQUARE)
        } else if (config.scatterShape === 'CIRCLE') {
          dataSet.setScatterShape(ChartShape.CIRCLE);
        } else if (config.scatterShape === 'TRIANGLE') {
          dataSet.setScatterShape(ChartShape.TRIANGLE);
        } else if (config.scatterShape === 'CROSS') {
          dataSet.setScatterShape(ChartShape.CROSS);
        } else if (config.scatterShape === 'X') {
          dataSet.setScatterShape(ChartShape.X);
        }


        // scatterShapeHoleColor 设置形状中孔的颜色。
        if (config.scatterShapeHoleColor != undefined) {
          dataSet.setScatterShapeHoleColor(config.scatterShapeHoleColor);
        }

        //scatterShapeHoleRadius 设置形状中孔的半径（适用于正方形、圆形和三角形）将其设置为<=0以删除孔。
        if (config.scatterShapeHoleRadius != undefined) {
          dataSet.setScatterShapeHoleRadius(config.scatterShapeHoleRadius);
        }
      }


      dataSetList.add(dataSet);
    })
  }

  let scatterData = new ScatterData(dataSetList)
  if (CombinedData != undefined) {
    CombinedData.setScatterData(scatterData);
  }
  return scatterData
}