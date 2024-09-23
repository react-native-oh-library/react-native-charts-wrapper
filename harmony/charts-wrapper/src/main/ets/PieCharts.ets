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

import { RNComponentContext, RNViewBase } from '@rnoh/react-native-openharmony';
import { PieChartModel, PieData, PieChart, } from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setBaseProps } from './BaseCharts'
import { setPieData } from './Data/PieData';
import { setBasePieChartProps } from './BasePieCharts';


@Component
export struct PieCharts {
  public static readonly NAME = RNC.RNPieChart.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.RNPieChart.DescriptorWrapper = {} as RNC.RNPieChart.DescriptorWrapper;
  @State private model: PieChartModel | undefined = undefined;
  private data: PieData | null = null;
  private cleanUpCallbacks: (() => void)[] = [];

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNPieChart.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNPieChart.DescriptorWrapper)
      }
    ))
    //必须：初始化图表配置构建类
    this.model = new PieChartModel();
    //设置基本图表配置
    setBaseProps<PieChartModel, RNC.RNPieChart.DescriptorWrapper>(this.descriptorWrapper, this.model!)
    setBasePieChartProps<PieChartModel, RNC.RNPieChart.DescriptorWrapper>(this.model!, this.descriptorWrapper)
    //设置pieChart单独的配置
    let props = this.descriptorWrapper.props

    //drawEntryLabels 将此属性设置为true可将条目标签绘制到饼图扇区中
    if (props.drawEntryLabels != undefined) {
      this.model.setDrawEntryLabels(props.drawEntryLabels);
    }

    // usePercentValues  如果启用此选项，则PieChart中的值将以百分比显示
    if (props.usePercentValues != undefined) {
      this.model.setUsePercentValues(props.usePercentValues);
    }

    //centerText 设置显示在PieChart中心的文本字符串。
    if (props.centerText != undefined) {
      this.model.setCenterText(props.centerText);
    }

    //styledCenterText
    if (props.styledCenterText != undefined) {
      if (props.styledCenterText.text) {
        this.model.setCenterText(props.styledCenterText.text);
      }
      if (props.styledCenterText.color) {
        this.model.setCenterTextColor(props.styledCenterText.color);
      }
      if (props.styledCenterText.size) {
        this.model.setCenterTextSize(props.styledCenterText.size);
      }
      if (props.styledCenterText.fontFamily === 'sans-serif') {
        this.model.setCenterTextTypeface(props.styledCenterText.fontFamily)
      }
      if (props.styledCenterText.fontFamily === 'serif') {
        this.model.setCenterTextTypeface(props.styledCenterText.fontFamily)
      }
      if (props.styledCenterText.fontFamily === 'monospace') {
        this.model.setCenterTextTypeface(props.styledCenterText.fontFamily)
      }
    }

    //centerTextRadiusPercent 中心文本边界框的矩形半径,以饼图的百分比表示
    if (props.centerTextRadiusPercent != undefined) {
      this.model.setCenterTextRadiusPercent(props.centerTextRadiusPercent);
    }

    //holeRadius 设置饼图中心孔的半径，以百分比为单位 *最大半径（max=整个图表的半径），默认为50%
    if (props.holeRadius != undefined) {
      this.model.setHoleRadius(props.holeRadius);
    }

    //holeColor 设置在饼图中心绘制的孔的颜色
    if (props.holeColor != undefined) {
      this.model.setHoleColor(props.holeColor);
    }

    //transparentCircleRadius 设置在孔旁边绘制的透明圆的半径
    if (props.transparentCircleRadius != undefined) {
      this.model.setTransparentCircleRadius(props.transparentCircleRadius);
    }

    //transparentCircleColor 设置在孔旁边绘制的透明圆的颜色
    if (props.transparentCircleColor != undefined) {
      this.model.setTransparentCircleColor(props.transparentCircleColor);
    }

    // entryLabelColor 设置绘制条目标签的颜色。
    if (props.entryLabelColor != undefined) {
      this.model.setEntryLabelColor(props.entryLabelColor)
    }

    // entryLabelTextSize 以vp为单位设置条目标签的大小。缺省值：14vp
    if (props.entryLabelTextSize != undefined) {
      this.model.setEntryLabelTextSize(props.entryLabelTextSize);
    }

    //entryLabelFontFamily 为条目标签的绘制设置自定义字体。
    if (props.entryLabelFontFamily) {
      if (props.entryLabelFontFamily === 'sans-serif') {
        this.model.setEntryLabelTypeface(props.entryLabelFontFamily)
      }
      if (props.entryLabelFontFamily === 'serif') {
        this.model.setEntryLabelTypeface(props.entryLabelFontFamily)
      }
      if (props.entryLabelFontFamily === 'monospace') {
        this.model.setEntryLabelTypeface(props.entryLabelFontFamily)
      }
    }

    //maxAngle 设置用于计算饼图圆的最大角度。360f的意思 *它是一个完整的饼图，180f的结果是一个半饼图。默认值：360f
    if (props.maxAngle != undefined) {
      this.model.setMaxAngle(props.maxAngle);
    }


    //设置图表数据
    this.data = setPieData(this.descriptorWrapper)
    // 将数据与图表配置类绑定
    this.model.setData(this.data);
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNPieChart.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
      PieChart({
        model: this.model
      })
  }
}