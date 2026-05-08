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

import { RNC } from './generated'
import {
  DescriptorWrapperFactoryByDescriptorType,
  DescriptorWrapperFactoryByDescriptorTypeCtx,
  RNPackage
} from '@rnoh/react-native-openharmony/ts';
import { ComponentBuilderContext, RNOHPackage } from '@rnoh/react-native-openharmony';
import { BarCharts } from './BarCharts';
import { LineCharts } from './LineCharts';
import { HorizontalBarCharts } from './HorizontalBarCharts';
import { BubbleCharts } from './BubbleCharts';
import { PieCharts } from './PieCharts';
import { RadarCharts } from './RadarCharts';
import { ScatterCharts } from './ScatterCharts';
import { CandleStickCharts } from './CandleStickCharts';
import { CombinedCharts } from './CombinedCharts';


@Builder
function barChart(ctx: ComponentBuilderContext) {
  BarCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function lineChart(ctx: ComponentBuilderContext) {
  LineCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function horizontalBarChart(ctx: ComponentBuilderContext) {
  HorizontalBarCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function bubbleChart(ctx: ComponentBuilderContext) {
  BubbleCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function pieChart(ctx: ComponentBuilderContext) {
  PieCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function radarChart(ctx: ComponentBuilderContext) {
  RadarCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function scatterChart(ctx: ComponentBuilderContext) {
  ScatterCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function candleStickChart(ctx: ComponentBuilderContext) {
  CandleStickCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

@Builder
function combinedChart(ctx: ComponentBuilderContext) {
  CombinedCharts({ ctx: ctx.rnComponentContext, tag: ctx.tag })
}

export class ChartsWrapperPackage extends RNOHPackage {
  createDescriptorWrapperFactoryByDescriptorType(ctx: DescriptorWrapperFactoryByDescriptorTypeCtx): DescriptorWrapperFactoryByDescriptorType {
    return {
      'RNBarChart': (ctx) => new RNC.RNBarChart.DescriptorWrapper(ctx.descriptor),
      'RNLineChart': (ctx) => new RNC.RNLineChart.DescriptorWrapper(ctx.descriptor),
      'RNHorizontalBarChart': (ctx) => new RNC.RNHorizontalBarChart.DescriptorWrapper(ctx.descriptor),  
      'RNBubbleChart': (ctx) => new RNC.RNBubbleChart.DescriptorWrapper(ctx.descriptor),
      'RNPieChart': (ctx) => new RNC.RNPieChart.DescriptorWrapper(ctx.descriptor),
      'RNRadarChart': (ctx) => new RNC.RNRadarChart.DescriptorWrapper(ctx.descriptor),
      'RNScatterChart': (ctx) => new RNC.RNScatterChart.DescriptorWrapper(ctx.descriptor),
      'RNCandleStickChart': (ctx) => new RNC.RNCandleStickChart.DescriptorWrapper(ctx.descriptor),
      'RNCombinedChart': (ctx) => new RNC.RNCombinedChart.DescriptorWrapper(ctx.descriptor),
    }
  }

  createWrappedCustomRNComponentBuilderByComponentNameMap(): Map<string, WrappedBuilder<[ComponentBuilderContext]>> {
  const builderMap = new Map<string, WrappedBuilder<[ComponentBuilderContext]>>();

    builderMap.set(BarCharts.NAME, wrapBuilder(barChart))
    builderMap.set(LineCharts.NAME, wrapBuilder(lineChart))
    builderMap.set(HorizontalBarCharts.NAME, wrapBuilder(horizontalBarChart))
    builderMap.set(BubbleCharts.NAME, wrapBuilder(bubbleChart))
    builderMap.set(PieCharts.NAME, wrapBuilder(pieChart))
    builderMap.set(RadarCharts.NAME, wrapBuilder(radarChart))
    builderMap.set(ScatterCharts.NAME, wrapBuilder(scatterChart))
    builderMap.set(CandleStickCharts.NAME, wrapBuilder(candleStickChart))
    builderMap.set(CombinedCharts.NAME, wrapBuilder(combinedChart))

    return builderMap;
  }
}