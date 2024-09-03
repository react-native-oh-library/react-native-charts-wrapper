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
  ColorTemplate,
  JArrayList,
  PieData,
  PieDataSet,
  PieEntry,
  ValuePosition
} from '@ohos/mpchart';
import { RNC } from '@rnoh/react-native-openharmony/generated';

export const setPieData = (descriptorWrapper: RNC.RNPieChart.DescriptorWrapper): PieData | null => {
  //判断Props data 是否为空
  if (!descriptorWrapper.props.data) {
    return null;
  }
  let label: string | undefined;
  let values: JArrayList<PieEntry> = new JArrayList<PieEntry>();
  descriptorWrapper.props.data.dataSets?.forEach((data) => {

    data.values?.forEach((v) => {
      values.add(new PieEntry(v.value, v.label));
    })
    label = data.label;
  })
  let dataSet: PieDataSet = new PieDataSet(values, label!);
  descriptorWrapper.props.data.dataSets?.forEach((data) => {
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

    //sliceSpace 设置在vp中的饼图切片之间留出的空间。*默认值：0 -->无空格，最大20f
    if (config?.sliceSpace != undefined) {
      dataSet.setSliceSpace(config.sliceSpace);
    }

    //selectionShift 设置此数据集的突出显示饼图扇区的距离 *从图表中心“移位”，默认值为12f
    if (config?.selectionShift != undefined) {
      dataSet.setSelectionShift(config.selectionShift);
    }

    //xValuePosition 标签显示在饼图里面还是外面
    if (config?.xValuePosition != undefined) {
      if (config.xValuePosition === 'INSIDE_SLICE') {
        dataSet.setXValuePosition(ValuePosition.INSIDE_SLICE);
      } else if (config.xValuePosition === 'OUTSIDE_SLICE') {
        dataSet.setXValuePosition(ValuePosition.OUTSIDE_SLICE)
      }
    }

    //yValuePosition 标签显示在饼图里面还是外面
    if (config?.yValuePosition != undefined) {
      if (config.yValuePosition === 'INSIDE_SLICE') {
        dataSet.setYValuePosition(ValuePosition.INSIDE_SLICE);
      } else if (config.yValuePosition === 'OUTSIDE_SLICE') {
        dataSet.setYValuePosition(ValuePosition.OUTSIDE_SLICE)
      }
    }

    //valueLinePart1Length
    if (config?.valueLinePart1Length != undefined) {
      dataSet.setValueLinePart1Length(config.valueLinePart1Length);
    }

    //valueLinePart2Length
    if (config?.valueLinePart2Length != undefined) {
      dataSet.setValueLinePart2Length(config.valueLinePart2Length);
    }

    // valueLineColor 线条颜色
    if (config?.valueLineColor != undefined) {
      dataSet.setValueLineColor(config.valueLineColor)
    }

    //valueLineWidth 线条宽度
    if (config?.valueLineWidth != undefined) {
      dataSet.setValueLineWidth(config.valueLineWidth);
    }

    //valueLinePart1OffsetPercentage 切片大小的百分比表示偏移量
    if (config?.valueLinePart1OffsetPercentage != undefined) {
      dataSet.setValueLinePart1OffsetPercentage(config.valueLinePart1OffsetPercentage);
    }

    //valueLineVariableLength 当valuePosition为OutsideSlice时，这将允许可变的行长度
    if (config?.valueLineVariableLength != undefined) {
      dataSet.setValueLineVariableLength(config.valueLineVariableLength);
    }


  })
  let pieData = new PieData(dataSet)
  return pieData!
}