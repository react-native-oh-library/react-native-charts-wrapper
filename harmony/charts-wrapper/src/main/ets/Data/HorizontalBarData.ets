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

import { AxisDependency, BarData, BarDataSet, BarEntry, IBarDataSet, JArrayList } from '@ohos/mpchart';
import { RNC } from '@rnoh/react-native-openharmony/generated';

export const setHorizontalBarData = (descriptorWrapper: RNC.RNHorizontalBarChart.DescriptorWrapper): BarData | null => {
  //判断Props data 是否为空
  if (!descriptorWrapper.props.data) {
    return null;
  }
  let dataSetList: JArrayList<IBarDataSet> = new JArrayList<IBarDataSet>();
  let values: JArrayList<BarEntry> = new JArrayList<BarEntry>();
  let label: string | undefined
  descriptorWrapper.props.data.dataSets?.forEach((data) => {
    data.values?.forEach((v) => {
      values.add(new BarEntry(v.x, v.y));
    })
    label = data.label

    let dataSet: BarDataSet = new BarDataSet(values, label!);

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

    //设置轴依赖关系 axisDependency
    if (config?.axisDependency === 'LEFT') {
      dataSet.setAxisDependency(AxisDependency.LEFT);
    } else if (config?.axisDependency === 'RIGHT') {
      dataSet.setAxisDependency(AxisDependency.RIGHT);
    }

    //设置用于绘制条形阴影的颜色。 barShadowColor
    if (config?.barShadowColor != undefined) {
      dataSet.setBarShadowColor(config.barShadowColor);
    }

    //设置用于绘制高光的alpha值（透明度） highlightAlpha
    if (config?.highlightAlpha != undefined) {
      dataSet.setHighLightAlpha(config.highlightAlpha);
    }

    //为不同值的条形栈设置标签（如果有一个）。stackLabels
    if (config?.stackLabels != undefined) {
      dataSet.setStackLabels(config.stackLabels);
    }
    dataSetList.add(dataSet);


  })
  let barData: BarData = new BarData(dataSetList);
  let dataSetConfig = descriptorWrapper.props.data.config
  //设置每个条形在x轴上应具有的宽度 barWidth
  if (dataSetConfig?.barWidth != undefined) {
    barData.setBarWidth(descriptorWrapper.props.data.config?.barWidth);
  }

  //设置顶部圆角半径 topRadius
  if (dataSetConfig?.topRadius != undefined) {
    barData.setTopRadius(descriptorWrapper.props.data.config?.topRadius);
  }

  // 通过修改条目的x值，将此数据对象包含的所有BarDataSet对象组合在一起
  if (dataSetConfig?.group != undefined) {
    let fromX = dataSetConfig.group.fromX;
    let groupSpace = dataSetConfig.group.groupSpace;
    let barSpace = dataSetConfig.group.barSpace;
    barData.groupBars(fromX, groupSpace, barSpace);
  }
  return barData;
}