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
  BubbleData,
  BubbleDataSet,
  BubbleEntry,
  CombinedData,
  IBubbleDataSet,
  JArrayList
} from '@ohos/mpchart';
import { RNC } from '@rnoh/react-native-openharmony/generated';

export const setBubbleData = (isBubble: string, descriptorWrapper: RNC.RNBubbleChart.DescriptorWrapper,
  ComDescriptorWrapper?: RNC.RNCombinedChart.DescriptorWrapper, CombinedData?: CombinedData): BubbleData | null => {
  let dataSetList = new JArrayList<IBubbleDataSet>();
  let label: string | undefined
  if (descriptorWrapper && isBubble === 'Bubble') {
    let dataSetProps = descriptorWrapper.props.data;
    dataSetProps.dataSets?.forEach((data) => {
      let values: JArrayList<BubbleEntry> = new JArrayList<BubbleEntry>();
      data.values?.forEach((v) => {
        values.add(new BubbleEntry(v.x, v.y, v.size));
      })
      label = data.label

      let dataSet: BubbleDataSet = new BubbleDataSet(values, label!);
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
      dataSetList.add(dataSet);

    })
  } else {
    let dataSetComProps = ComDescriptorWrapper?.props.data?.bubbleData;
    dataSetComProps?.dataSets?.forEach((data) => {
      let values: JArrayList<BubbleEntry> = new JArrayList<BubbleEntry>();
      data.values?.forEach((v) => {
        values.add(new BubbleEntry(v.x, v.y, v.size));
      })
      label = data.label

      let dataSet: BubbleDataSet = new BubbleDataSet(values, label!);
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
      dataSetList.add(dataSet);

    })
  }

  let bubbleData: BubbleData = new BubbleData(dataSetList);
  if (CombinedData != undefined) {
    CombinedData.setBubbleData(bubbleData);
  }


  return bubbleData;
}