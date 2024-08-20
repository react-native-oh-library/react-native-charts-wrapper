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
import { BarChart, BarChartModel, BarData } from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setBaseProps } from './BaseCharts'
import { setBarLineChart } from './BarLineBaseChart'
import { setBarData } from './Data/BarData';

@Component
export struct BarCharts {
  public static readonly NAME = RNC.RNBarChart.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.RNBarChart.DescriptorWrapper = {} as RNC.RNBarChart.DescriptorWrapper;
  @State private model: BarChartModel | undefined = undefined;
  private data: BarData | null = null;
  private cleanUpCallbacks: (() => void)[] = [];

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNBarChart.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNBarChart.DescriptorWrapper)
      }
    ))
    //必须：初始化图表配置构建类
    this.model = new BarChartModel();
    //设置基本图表配置  BarLineChartBase

    setBaseProps<BarChartModel, RNC.RNBarChart.DescriptorWrapper, RNC.RNBarChart.DescriptorWrapper>
    (this.descriptorWrapper, this.model!, this.descriptorWrapper)
    //设置BarLine类型图表基本配置
    setBarLineChart<BarChartModel, RNC.RNBarChart.DescriptorWrapper>(this.descriptorWrapper, this.model!)

    //设置图表数据
    if (this.descriptorWrapper.props.data.dataSets) {
      this.data = setBarData('Bar', this.descriptorWrapper)
      // 将数据与图表配置类绑定
      this.model.setData(this.data);
    }

    let props = this.descriptorWrapper.props

    //如果设置为true，则所有值都绘制在其条形上方，而不是绘制在其顶部下方。 drawValueAboveBar
    if (props.drawValueAboveBar != undefined) {
      this.model.setDrawValueAboveBar(props.drawValueAboveBar);
    }

    //drawBarShadow 如果设置为true，则在每个条形后面绘制一个灰色区域，表示最大值
    if (props.drawBarShadow != undefined) {
      this.model.setDrawBarShadow(props.drawBarShadow)
    }

    if (props.highlightFullBarEnabled != undefined) {
      this.model.setHighlightFullBarEnabled(props.highlightFullBarEnabled)
    }

  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNBarChart.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      BarChart({
        model: this.model
      })
    }
  }
}