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

import { PieChartModel, RadarChartModel, } from '@ohos/mpchart';
import { RNC } from "@rnoh/react-native-openharmony/generated"

type model = PieChartModel | RadarChartModel
type RNChart = RNC.RNPieChart.DescriptorWrapper | RNC.RNRadarChart.DescriptorWrapper

export const setBasePieChartProps = <T extends model, U extends RNChart>(model: T, descriptorWrapper: U) => {
  let props = descriptorWrapper.props

  //设置图表周围的最小偏移量（填充），默认值为0。minOffset
  if (props.minOffset != undefined) {
    model.setMinOffset(props.minOffset);
  }

  // 将此属性设置为true可通过触摸启用图表的旋转。 rotationEnabled 默认为true
  if (props.rotationEnabled != undefined) {
    model.setRotationEnabled(props.rotationEnabled)
  }

  // 为雷达图的旋转设置偏移量（以度为单位）。默认270f rotationAngle
  if (props.rotationAngle != undefined) {
    model.setRotationAngle(props.rotationAngle)
  }
}






