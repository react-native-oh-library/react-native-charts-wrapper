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
import { ScatterChartModel, ScatterChart, ScatterData, } from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setBaseProps } from './BaseCharts'
import { setScatterData } from './Data/ScatterData';
import { setBarLineChart } from './BarLineBaseChart';

@Component
export struct ScatterCharts {
  public static readonly NAME = RNC.RNScatterChart.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.RNScatterChart.DescriptorWrapper = {} as RNC.RNScatterChart.DescriptorWrapper;
  @State private model: ScatterChartModel | undefined = undefined;
  private data: ScatterData | null = null;
  private cleanUpCallbacks: (() => void)[] = [];

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNScatterChart.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNScatterChart.DescriptorWrapper)
      }
    ))
    //必须：初始化图表配置构建类
    this.model = new ScatterChartModel();
    //设置基本图表配置
    setBaseProps<ScatterChartModel, RNC.RNScatterChart.DescriptorWrapper>(this.descriptorWrapper, this.model!)
    //设置X轴位置
    //设置BarLine类型图表基本配置
    setBarLineChart<ScatterChartModel, RNC.RNScatterChart.DescriptorWrapper>(this.descriptorWrapper, this.model!)
    //设置图表数据
    this.data = setScatterData('Scatter', this.descriptorWrapper)
    // 将数据与图表配置类绑定
    this.model.setData(this.data);
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNScatterChart.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      ScatterChart({
        model: this.model
      })
    }
  }
}