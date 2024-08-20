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
  CandleData,
  CandleDataSet,
  CandleEntry,
  CombinedData,
  ICandleDataSet,
  JArrayList,
  Style
} from '@ohos/mpchart'
import { RNC } from '@rnoh/react-native-openharmony/generated'

export const setCandleStickData = (isCandle: string, descriptorWrapper: RNC.RNCandleStickChart.DescriptorWrapper,
  ComDescriptorWrapper?: RNC.RNCombinedChart.DescriptorWrapper, CombinedData?: CombinedData): CandleData | null => {
  let dataSetList = new JArrayList<ICandleDataSet>();
  let label: string | undefined
  if (descriptorWrapper && isCandle === 'Candle') {
    let dataSetProps = descriptorWrapper.props.data;
    dataSetProps.dataSets?.forEach((data) => {
      let values: JArrayList<CandleEntry> = new JArrayList<CandleEntry>();
      data.values?.forEach((v) => {
        values.add(new CandleEntry(v.x, v.shadowH, v.shadowL, v.open, v.close));
      })
      label = data.label

      let dataSet: CandleDataSet = new CandleDataSet(values, label!);
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

      // 启用/禁用垂直突出显示指示器。如果禁用，则不绘制指示器。 drawVerticalHighlightIndicator
      if (config?.drawVerticalHighlightIndicator != undefined) {
        dataSet.setDrawVerticalHighlightIndicator(config?.drawVerticalHighlightIndicator)
      }

      // 启用/禁用水平突出显示指示器。如果禁用，则不绘制指示器。 drawHorizontalHighlightIndicator
      if (config?.drawHorizontalHighlightIndicator != undefined) {
        dataSet.setDrawHorizontalHighlightIndicator(config.drawHorizontalHighlightIndicator);
      }

      //  设置突出显示行的宽度，以vp为单位 highlightLineWidth
      if (config?.highlightLineWidth != undefined) {
        dataSet.setHighlightLineWidth(config.highlightLineWidth);
      }

      //drawHighlightIndicators 启用/禁用垂直和水平突出显示指示器。
      if (config?.drawHighlightIndicators != undefined) {
        dataSet.setDrawHighlightIndicators(config?.drawHighlightIndicators)
      }

      //蜡烛图数据单独配置
      //barSpace  设置在每个的左侧和右侧留出的空间 *烛光，默认0.1f (10%)，最大0.45f，最小0f
      if (config?.barSpace != undefined) {
        dataSet.setBarSpace(config.barSpace);
      }

      //shadowWidth 以像素为单位设置蜡烛阴影线的宽度。默认为3f。
      if (config?.shadowWidth != undefined) {
        dataSet.setShadowWidth(config.shadowWidth);
      }

      //shadowColor  设置所有条目的阴影颜色
      if (config?.shadowColor != undefined) {
        dataSet.setShadowColor(config.shadowColor);
      }

      //shadowColorSameAsCandle  将阴影颜色设置为与蜡烛颜色相同的颜色
      if (config?.shadowColorSameAsCandle != undefined) {
        dataSet.setShadowColorSameAsCandle(config.shadowColorSameAsCandle);
      }

      //neutralColor  设置在以下情况下应用于此数据集的唯一颜色 *打开==关闭。
      if (config?.neutralColor != undefined) {
        dataSet.setNeutralColor(config.neutralColor);
      }

      //decreasingColor 设置在以下情况下应用于此数据集的唯一颜色 *打开>关闭。
      if (config?.decreasingColor != undefined) {
        dataSet.setDecreasingColor(config.decreasingColor);
      }

      //decreasingPaintStyle 设置打开>关闭时的绘制样式
      if (config?.decreasingPaintStyle != undefined) {
        if (config?.decreasingPaintStyle === 'FILL') {
          dataSet.setDecreasingPaintStyle(Style.FILL);
        } else if (config.decreasingPaintStyle === 'STROKE') {
          dataSet.setDecreasingPaintStyle(Style.STROKE);
        } else if (config.decreasingPaintStyle === 'FILL_AND_STROKE') {
          dataSet.setDecreasingPaintStyle(Style.FILL_AND_STROKE);
        }
      }

      //increasingColor  设置在以下情况下应用于此数据集的唯一颜色 * open <= close。
      if (config?.increasingColor != undefined) {
        dataSet.setIncreasingColor(config.increasingColor);
      }

      // increasingPaintStyle 设置打开<关闭时的绘制样式
      if (config?.increasingPaintStyle != undefined) {
        if (config.increasingPaintStyle === 'FILL') {
          dataSet.setIncreasingPaintStyle(Style.FILL);
        } else if (config.increasingPaintStyle === 'STROKE') {
          dataSet.setIncreasingPaintStyle(Style.STROKE);
        } else if (config.increasingPaintStyle === 'FILL_AND_STROKE') {
          dataSet.setIncreasingPaintStyle(Style.FILL_AND_STROKE);
        }
      }
      dataSetList.add(dataSet);

    })
  } else {
    let dataSetComProps = ComDescriptorWrapper?.props.data?.candleData
    dataSetComProps?.dataSets?.forEach((data) => {
      let values: JArrayList<CandleEntry> = new JArrayList<CandleEntry>();
      data.values?.forEach((v) => {
        values.add(new CandleEntry(v.x, v.shadowH, v.shadowL, v.open, v.close));
      })
      label = data.label

      let dataSet: CandleDataSet = new CandleDataSet(values, label!);
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

      // 启用/禁用垂直突出显示指示器。如果禁用，则不绘制指示器。 drawVerticalHighlightIndicator
      if (config?.drawVerticalHighlightIndicator != undefined) {
        dataSet.setDrawVerticalHighlightIndicator(config?.drawVerticalHighlightIndicator)
      }

      // 启用/禁用水平突出显示指示器。如果禁用，则不绘制指示器。 drawHorizontalHighlightIndicator
      if (config?.drawHorizontalHighlightIndicator != undefined) {
        dataSet.setDrawHorizontalHighlightIndicator(config.drawHorizontalHighlightIndicator);
      }

      //  设置突出显示行的宽度，以vp为单位 highlightLineWidth
      if (config?.highlightLineWidth != undefined) {
        dataSet.setHighlightLineWidth(config.highlightLineWidth);
      }

      //drawHighlightIndicators 启用/禁用垂直和水平突出显示指示器。
      if (config?.drawHighlightIndicators != undefined) {
        dataSet.setDrawHighlightIndicators(config?.drawHighlightIndicators)
      }

      //蜡烛图数据单独配置
      //barSpace  设置在每个的左侧和右侧留出的空间 *烛光，默认0.1f (10%)，最大0.45f，最小0f
      if (config?.barSpace != undefined) {
        dataSet.setBarSpace(config.barSpace);
      }

      //shadowWidth 以像素为单位设置蜡烛阴影线的宽度。默认为3f。
      if (config?.shadowWidth != undefined) {
        dataSet.setShadowWidth(config.shadowWidth);
      }

      //shadowColor  设置所有条目的阴影颜色
      if (config?.shadowColor != undefined) {
        dataSet.setShadowColor(config.shadowColor);
      }

      //shadowColorSameAsCandle  将阴影颜色设置为与蜡烛颜色相同的颜色
      if (config?.shadowColorSameAsCandle != undefined) {
        dataSet.setShadowColorSameAsCandle(config.shadowColorSameAsCandle);
      }

      //neutralColor  设置在以下情况下应用于此数据集的唯一颜色 *打开==关闭。
      if (config?.neutralColor != undefined) {
        dataSet.setNeutralColor(config.neutralColor);
      }

      //decreasingColor 设置在以下情况下应用于此数据集的唯一颜色 *打开>关闭。
      if (config?.decreasingColor != undefined) {
        dataSet.setDecreasingColor(config.decreasingColor);
      }

      //decreasingPaintStyle 设置打开>关闭时的绘制样式
      if (config?.decreasingPaintStyle != undefined) {
        if (config?.decreasingPaintStyle === 'FILL') {
          dataSet.setDecreasingPaintStyle(Style.FILL);
        } else if (config.decreasingPaintStyle === 'STROKE') {
          dataSet.setDecreasingPaintStyle(Style.STROKE);
        } else if (config.decreasingPaintStyle === 'FILL_AND_STROKE') {
          dataSet.setDecreasingPaintStyle(Style.FILL_AND_STROKE);
        }
      }

      //increasingColor  设置在以下情况下应用于此数据集的唯一颜色 * open <= close。
      if (config?.increasingColor != undefined) {
        dataSet.setIncreasingColor(config.increasingColor);
      }

      // increasingPaintStyle 设置打开<关闭时的绘制样式
      if (config?.increasingPaintStyle != undefined) {
        if (config.increasingPaintStyle === 'FILL') {
          dataSet.setIncreasingPaintStyle(Style.FILL);
        } else if (config.increasingPaintStyle === 'STROKE') {
          dataSet.setIncreasingPaintStyle(Style.STROKE);
        } else if (config.increasingPaintStyle === 'FILL_AND_STROKE') {
          dataSet.setIncreasingPaintStyle(Style.FILL_AND_STROKE);
        }
      }
      dataSetList.add(dataSet);
    })
  }

  let candleData: CandleData = new CandleData(dataSetList);
  if (CombinedData != undefined) {
    CombinedData.setCandleData(candleData);
  }

  return candleData;
}