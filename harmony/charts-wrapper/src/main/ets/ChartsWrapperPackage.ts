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

import { RNC } from '@rnoh/react-native-openharmony/generated/ts';
import {
  DescriptorWrapperFactoryByDescriptorType,
  DescriptorWrapperFactoryByDescriptorTypeCtx,
  RNPackage
} from '@rnoh/react-native-openharmony/ts';

export class ChartsWrapperPackage extends RNPackage {
  createDescriptorWrapperFactoryByDescriptorType(ctx: DescriptorWrapperFactoryByDescriptorTypeCtx): DescriptorWrapperFactoryByDescriptorType {
    return {
      [RNC.RNBarChart.NAME]: (ctx) => new RNC.RNBarChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNLineChart.NAME]: (ctx) => new RNC.RNLineChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNHorizontalBarChart.NAME]: (ctx) => new RNC.RNHorizontalBarChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNBubbleChart.NAME]: (ctx) => new RNC.RNBubbleChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNPieChart.NAME]: (ctx) => new RNC.RNPieChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNRadarChart.NAME]: (ctx) => new RNC.RNRadarChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNScatterChart.NAME]: (ctx) => new RNC.RNScatterChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNCandleStickChart.NAME]: (ctx) => new RNC.RNCandleStickChart.DescriptorWrapper(ctx.descriptor),
      [RNC.RNCombinedChart.NAME]: (ctx) => new RNC.RNCombinedChart.DescriptorWrapper(ctx.descriptor),
    }
  }
}