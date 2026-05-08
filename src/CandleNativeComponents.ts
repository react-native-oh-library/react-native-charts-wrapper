import {
    HostComponent,
    ViewProps,
  } from "react-native";
import { Float, WithDefault } from "react-native/Libraries/Types/CodegenTypes";
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
type Color = Float;

//barLineChartsBase baseChart
export interface ChartDescription {
    enabled?:boolean
    text?: string;
    textColor?: Color;
    textSize?: Float;
    positionX?: Float;
    positionY?: Float;
}
interface customType{
    colors?: Color[];
    labels?: string[];
}
type FontFamily = WithDefault<string,'sans-serif'>;
export interface ChartLegend {
    enabled?: boolean;
    textColor?: Color;
    textSize?: Float;
    fontFamily?: FontFamily;
    fontStyle?: Float;
    fontWeight?: Float;
    wordWrapEnabled?: boolean;
    maxSizePercent?: Float;
    horizontalAlignment?:WithDefault<string,'LEFT'> ;
    verticalAlignment?:WithDefault<string,'TOP'>;
    orientation?:WithDefault<string,"HORIZONTAL"> ;
    drawInside?: boolean;
    direction?: WithDefault<string,'LEFT_TO_RIGHT'>;
    form?:WithDefault<string,"NONE"> ;
    formSize?: Float;
    xEntrySpace?: Float;
    yEntrySpace?: Float;
    formToTextSpace?: Float;
    custom?:customType
}
export interface AxisLimitLine {
    limit: Float;
    label?: string;
    lineColor?: Color;
    lineWidth?: Float;
    valueTextColor?: Color;
    valueFont?: Float;
    labelPosition?:WithDefault<string ,'LEFT_TOP'> ;
    lineDashPhase?: Float;
    lineDashLengths?: Float[];
}
interface gridDashedLineType{
    lineLength?: Float;
    spaceLength?: Float;
    phase?: Float;
}
export interface Axis {
    enabled?: boolean;
    drawLabels?: boolean;
    drawAxisLine?: boolean;
    drawGridLines?: boolean;

    textColor?: Color;
    textSize?: Float;
    fontFamily?: string;
    fontStyle?: string;
    fontWeight?: string;
    gridColor?: Color;
    gridLineWidth?: Float;
    axisLineColor?: Color;
    axisLineWidth?: Float;
    gridDashedLine?:gridDashedLineType;

    limitLines?: AxisLimitLine[];
    drawLimitLinesBehindData?: boolean;

    axisMaximum?: Float;
    axisMinimum?: Float;
    granularity?: Float;
    granularityEnabled?: boolean;

    labelCount?: Float;
    labelCountForce?: boolean;

    centerAxisLabels?: boolean;

    valueFormatter?:  string ;

    valueFormatterPattern?: string;
    since?: Float;
    timeUnit?:WithDefault<string,'MILLISECONDS'> ;
}

export interface xAxis extends Axis {
    labelRotationAngle?: Float;
    avoidFirstLastClipping?: boolean;
    position?:WithDefault<string,'TOP'> ;
    yOffset?: Float;
}
interface animationType {
    durationX?: Float;
    durationY?: Float;
    easingX: string,
    easingY: string
}
interface markerType{
    enabled?: boolean;
    digits?: Float;
    markerColor?: Color;
    textColor?: Color;
    textSize?: Float;
}
interface highlightsType{
    x: Float;
    dataSetIndex?: Float;
    dataIndex?: Float;
    y?: Float;
    stackIndex?: Float;
}
export interface ChartBase {
    animation?:animationType;

    chartBackgroundColor?: Float;
    logEnabled?: boolean;
    noDataText?: string;
    noDataTextColor:Float;

    touchEnabled?: boolean;
    dragDecelerationEnabled?: boolean;
    dragDecelerationFrictionCoef?: Float;

    highlightPerTapEnabled?: boolean;
    chartDescription?: ChartDescription;

    legend?: ChartLegend;

    xAxis?: xAxis;

    marker?:markerType;

    highlights?:highlightsType[];
}

interface zeroLine{
    enabled?: boolean;
    lineWidth?: Float;
    lineColor?: Color;
}
export interface yAxis extends Axis {
    inverted?: boolean;
    spaceTop?: Float;
    spaceBottom?: Float;

    position?:WithDefault<string,'OUTSIDE_CHART'> ;

    maxWidth?: Float;
    minWidth?: Float;

    zeroLine?:zeroLine
}
export interface Offsets {
    top?: Float;
    left?: Float;
    bottom?: Float;
    right?: Float;
}

interface xType  {
    min?: Float;
    max?: Float;
}
interface yType{
    left?:xType
    right?:xType
}
interface visibleRangeType{
    x?:xType
    y?:yType
}
interface yAxisType{
    left?: yAxis;
    right?: yAxis;
}
interface zoom{
    scaleX: Float;
    scaleY: Float;
    xValue: Float;
    yValue: Float;
    axisDependency?: WithDefault<string,'LEFT'>;
}
export interface BarLineChartBase extends ChartBase {
    maxHighlightDistance?: Float;
    drawGridBackground?: boolean;
    gridBackgroundColor?: Color;

    drawBorders?: boolean;
    borderColor?: Color;
    borderWidth?: Float;

    minOffset?: Float;
    maxVisibleValueCount?: Float;
    visibleRange?:visibleRangeType;
    autoScaleMinMaxEnabled?: boolean;
    keepPositionOnRotation?: boolean;

    highlightPerDragEnabled?: boolean;

    scaleEnabled?: boolean;
    scaleXEnabled?: boolean;
    scaleYEnabled?: boolean;
    dragEnabled?: boolean;
    pinchZoom?: boolean;
    doubleTapToZoomEnabled?: boolean;

    yAxis?:yAxisType;
    zoom?:zoom;

    viewPortOffsets?: Offsets;
    extraOffsets?: Offsets;

    group?: string;
    identifier?: string;
    syncX?: boolean;
    syncY?: boolean;
}




//数据 data
export interface CommonDatasetConfig {
    color?: Color;
    colors?: Color[];
    highlightEnabled?: boolean;
    drawValues?: boolean;
    valueTextSize?: Float;
    valueTextColor?: Color;
    visible?: boolean;
    valueFormatter?:WithDefault<string ,'largeValue'>;
    axisDependency?:WithDefault<string,'LEFT'>;
}

export interface BarLineScatterCandleBubbleConfig {
    highlightColor?: Color;
}
export interface CandleStickValue {
    x?: Float ;
    shadowH: Float;
    shadowL: Float;
    open: Float;
    close: Float;
    marker?: string ;
}

export type CandleStickPaintStyle = WithDefault<string,'FILL'>;

export interface LineScatterCandleRadarConfig {
    drawVerticalHighlightIndicator?: boolean ;
    drawHorizontalHighlightIndicator?: boolean ;
    highlightLineWidth?: Float ;
    drawHighlightIndicators?: boolean ;
}
export interface Dataset {
    label?: string ;
}
export interface CandleStickDatasetConfig
    extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig, LineScatterCandleRadarConfig
{
    barSpace?: Float ;
    shadowWidth?: Float ;
    shadowColor?: Color ;
    shadowColorSameAsCandle?: boolean ;
    neutralColor?: Color ;
    decreasingColor?: Color ;
    decreasingPaintStyle?: CandleStickPaintStyle ;
    increasingColor?: Color ;
    increasingPaintStyle?: CandleStickPaintStyle ;
}

export interface CandleStickDataset extends Dataset {
    values?: CandleStickValue[] ;
    config?: CandleStickDatasetConfig ;
}

export interface CandleStickData {
    dataSets?: CandleStickDataset[] ;
}
export interface CandleStickChartProps extends ViewProps, BarLineChartBase{
    data: CandleStickData;
  }

  export default codegenNativeComponent<CandleStickChartProps>("RNCandleStickChart") as HostComponent<CandleStickChartProps>;