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
  AxisBase,
  AxisDependency,
  IAxisValueFormatter,
  IRadarDataSet, JArrayList, RadarData, RadarDataSet, RadarEntry } from '@ohos/mpchart';
import { RNC } from '@rnoh/react-native-openharmony/generated';
export const setRadarData = (descriptorWrapper: RNC.RNRadarChart.DescriptorWrapper): RadarData | null => {
  //判断Props data 是否为空
  if (!descriptorWrapper.props.data) {
    return null;
  }
  let label: string | undefined;
  let dataSetList = new JArrayList<IRadarDataSet>();

  descriptorWrapper.props.data.dataSets?.forEach((data) => {
    let values: JArrayList<RadarEntry> = new JArrayList<RadarEntry>();
    data.values?.forEach((v) => {
      values.add(new RadarEntry(v.value));
    })
    label = data.label

    let dataSet: RadarDataSet = new RadarDataSet(values, label!);
    let config = data.config

    //公共data设置
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
    if (config?.fillColor != undefined) {
      dataSet.setFillColor(config.fillColor);
    }
    if (config?.drawFilled != undefined) {
      dataSet.setDrawFilled(config.drawFilled);
    }
    if (config?.fillAlpha != undefined) {
      dataSet.setFillAlpha(config.fillAlpha);
    }
    if (config?.lineWidth != undefined) {
      dataSet.setLineWidth(config.lineWidth);
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


    dataSetList.add(dataSet);
  })
  let radarData: RadarData = new RadarData(dataSetList)
  return radarData
}