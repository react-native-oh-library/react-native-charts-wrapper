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
import {
  RadarChart,
  RadarChartModel,
  RadarData,
  YAxis,
  IAxisValueFormatter,
  AxisBase,
  ChartColor,
  XAxis,
  XAxisPosition,
} from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"
import { setBaseProps } from './BaseCharts'
import { setRadarData } from './Data/RadarData';
import { setBasePieChartProps } from './BasePieCharts';
import { setAxis } from './AxisBase';
import RadarMarkerView from './utils/RadarMarkerView';

@Component
export struct RadarCharts {
  public static readonly NAME = RNC.RNRadarChart.NAME;
  public ctx!: RNComponentContext;
  public tag: number = 0;
  @State private descriptorWrapper: RNC.RNRadarChart.DescriptorWrapper = {} as RNC.RNRadarChart.DescriptorWrapper;
  @State private model: RadarChartModel | undefined = undefined;
  private data: RadarData | null = null;
  private cleanUpCallbacks: (() => void)[] = [];
  @State private barDes: RNC.RNBarChart.DescriptorWrapper = {} as RNC.RNBarChart.DescriptorWrapper;
  private normalMarker: RadarMarkerView | null = null;

  aboutToAppear() {
    this.onDescriptorWrapperChange(this.ctx.descriptorRegistry.findDescriptorWrapperByTag<RNC.RNRadarChart.DescriptorWrapper>(this.tag)!);
    this.cleanUpCallbacks.push(this.ctx.descriptorRegistry.subscribeToDescriptorChanges(this.tag,
      (_descriptor, newDescriptorWrapper) => {
        this.onDescriptorWrapperChange(newDescriptorWrapper! as RNC.RNRadarChart.DescriptorWrapper)
      }
    ))
    // 必须：初始化图表配置构建类
    this.model = new RadarChartModel();
    //设置基本图表配置
    setBaseProps<RadarChartModel, RNC.RNRadarChart.DescriptorWrapper>(this.descriptorWrapper, this.model!, this.barDes,
      this.descriptorWrapper)
    setBasePieChartProps<RadarChartModel, RNC.RNRadarChart.DescriptorWrapper>(this.model!, this.descriptorWrapper)
    //设置y轴 yAxis
    if (this.descriptorWrapper.props.yAxis != undefined) {
      let yAxis = this.model.getYAxis();
      setAxis(yAxis as YAxis, this.barDes, 'yAxis', this.descriptorWrapper)
    }
    this.normalMarker = new RadarMarkerView();
    this.model.setMarker(this.normalMarker);

    let props = this.descriptorWrapper.props;

    // drawWeb *如果设置为true，则启用绘制Web，如果设置为false，则绘制 *整个Web被禁用。默认值：true
    if (props.drawWeb != undefined) {
      this.model.setDrawWeb(props.drawWeb);
    }

    //skipWebLineCount  设置在执行以下操作之前应在图表Web上跳过的Web行数： *下一个被绘制。这将以来自雷达图中心的线条为目标。
    if (props.skipWebLineCount != undefined) {
      this.model.setSkipWebLineCount(props.skipWebLineCount);
    }

    //webLineWidth 设置来自中心的腹板线的宽度。
    if (props.webLineWidth != undefined) {
      this.model.setWebLineWidth(props.webLineWidth);
    }

    //webLineWidthInner 设置Web线的宽度，这些Web线位于来自 *中心。
    if (props.webLineWidthInner != undefined) {
      this.model.setWebLineWidthInner(props.webLineWidthInner);
    }

    //webAlpha  设置所有Web线的透明度（alpha）值
    if (props.webAlpha != undefined) {
      this.model.setWebAlpha(props.webAlpha);
    }

    //webColor 设置来自中心的腹板线的颜色。
    if (props.webColor != undefined) {
      this.model.setWebColor(props.webColor);
    }

    //webColorInner *设置Web线之间的颜色，这些线来自*中心。
    if (props.webColorInner != undefined) {
      this.model.setWebColorInner(props.webColorInner);
    }

    //设置图表数据
    this.data = setRadarData(this.descriptorWrapper)
    // 将数据与图表配置类绑定
    this.model.setData(this.data);
  }

  private onDescriptorWrapperChange(descriptorWrapper: RNC.RNRadarChart.DescriptorWrapper) {
    this.descriptorWrapper = descriptorWrapper;
  }

  aboutToDisappear() {
    this.cleanUpCallbacks.forEach(cb => cb());
  }

  build() {
    RNViewBase({ ctx: this.ctx, tag: this.tag }) {
      RadarChart({
        model: this.model
      })
    }
  }
}