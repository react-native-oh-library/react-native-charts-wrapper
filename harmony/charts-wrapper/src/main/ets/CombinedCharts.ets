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
import { CombinedChart, CombinedChartModel, CombinedData } from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setBaseProps } from './BaseCharts'
import { setBarLineChart } from './BarLineBaseChart'
import { setBarData } from './Data/BarData';
import { setLineData } from './Data/LineData';
import { setBubbleData } from './Data/BubbleData';
import { setScatterData } from './Data/ScatterData';
import { setCandleStickData } from './Data/CandleStickData';

@Component
export struct CombinedCharts {
  public static readonly NAME = RNC.RNCombinedChart.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.RNCombinedChart.DescriptorWrapper = {} as RNC.RNCombinedChart.DescriptorWrapper;
  @State private model: CombinedChartModel | undefined = undefined;
  private cleanUpCallbacks: (() => void)[] = [];

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNCombinedChart.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNCombinedChart.DescriptorWrapper)
      }
    ))
    // Step1:必须：初始化图表配置构建类
    this.model = new CombinedChartModel();
    //设置基本图表配置  BarLineChartBase

    setBaseProps<CombinedChartModel, RNC.RNCombinedChart.DescriptorWrapper, RNC.RNCombinedChart.DescriptorWrapper>
    (this.descriptorWrapper, this.model!, this.descriptorWrapper)
    //设置BarLine类型图表基本配置
    setBarLineChart<CombinedChartModel, RNC.RNCombinedChart.DescriptorWrapper>(this.descriptorWrapper, this.model!)

    //设置图表数据
    if (this.descriptorWrapper.props) {
      let data: CombinedData = new CombinedData();
      let barDataProps: RNC.RNBarChart.DescriptorWrapper = {} as RNC.RNBarChart.DescriptorWrapper;
      let lineDataProps: RNC.RNLineChart.DescriptorWrapper = {} as RNC.RNLineChart.DescriptorWrapper;
      let bubbleDataProps: RNC.RNBubbleChart.DescriptorWrapper = {} as RNC.RNBubbleChart.DescriptorWrapper;
      let scatterDataProps: RNC.RNScatterChart.DescriptorWrapper = {} as RNC.RNScatterChart.DescriptorWrapper;
      let candleStickDataProps: RNC.RNCandleStickChart.DescriptorWrapper =
        {} as RNC.RNCandleStickChart.DescriptorWrapper;
      // 生成线形图数据
      setLineData("Combine", lineDataProps, this.descriptorWrapper, data);

      // 生成柱状图数据
      setBarData("Combine", barDataProps, this.descriptorWrapper, data);

      // 生成气泡图数据
      setBubbleData("Combine", bubbleDataProps, this.descriptorWrapper, data);

      // 生成散点图数据
      setScatterData("Combine", scatterDataProps, this.descriptorWrapper, data);

      // 生成蜡烛图数据
      setCandleStickData("Combine", candleStickDataProps, this.descriptorWrapper, data);

      // 设置图表数据
      this.model.setData(data);
    }
    let props = this.descriptorWrapper.props
    //DrawValueAboveBar *如果设置为true，则所有值都绘制在其条形的上方，而不是下方 *他们的顶部。
    if (props.drawValueAboveBar != undefined) {
      this.model.setDrawValueAboveBar(props.drawValueAboveBar)
    }

    //drawBarShadow 如果设置为true，则在每个条形后面绘制一个灰色区域，表示最大值
    if (props.drawBarShadow != undefined) {
      this.model.setDrawBarShadow(props.drawBarShadow)
    }

    if (props.highlightFullBarEnabled != undefined) {
      this.model.setHighlightFullBarEnabled(props.highlightFullBarEnabled)
    }
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNCombinedChart.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      CombinedChart({
        model: this.model
      })
    }
  }
}