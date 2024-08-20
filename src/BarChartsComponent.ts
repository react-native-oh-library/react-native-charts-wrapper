import {
    HostComponent,
  } from "react-native";
import { Float, WithDefault } from "react-native/Libraries/Types/CodegenTypes";
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
type Color = Float;
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
type FontFamily = WithDefault<'sans-serif' | 'serif' | 'monospace','san-serif'>;
export interface ChartLegend {
    enabled?: boolean;
    textColor?: Color;
    textSize?: Float;
    fontFamily?: FontFamily;
    fontStyle?: Float;
    fontWeight?: Float;
    wordWrapEnabled?: boolean;
    maxSizePercent?: Float;
    horizontalAlignment?:WithDefault<"LEFT" | "CENTER" | "RIGHT",'LEFT'> ;
    verticalAlignment?:WithDefault<"TOP" | "CENTER" | "BOTTOM",'TOP'>;
    orientation?:WithDefault<"HORIZONTAL" | "VERTICAL","HORIZONTAL"> ;
    drawInside?: boolean;
    direction?: WithDefault<"LEFT_TO_RIGHT" | "RIGHT_TO_LEFT",'LEFT_TO_RIGHT'>;
    form?:WithDefault<"NONE" | "EMPTY" | "DEFAULT" | "SQUARE" | "CIRCLE" | "LINE","NONE"> ;
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
    labelPosition?:WithDefault<"LEFT_TOP" | "LEFT_BOTTOM" | "RIGHT_TOP" | "RIGHT_BOTTOM",'LEFT_TOP'> ;
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
    timeUnit?:WithDefault<"MILLISECONDS" | "SECONDS" | "MINUTES" | "HOURS" | "DAYS",'MILLISECONDS'> ;
}


export interface xAxis extends Axis {
    labelRotationAngle?: Float;
    avoidFirstLastClipping?: boolean;
    position?:WithDefault<"TOP" | "BOTTOM" | "BOTH_SIDED" | "TOP_INSIDE" | "BOTTOM_INSIDE",'TOP'> ;
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

    position?:WithDefault<"OUTSIDE_CHART" | "INSIDE_CHART",'OUTSIDE_CHART'> ;

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
    axisDependency?: WithDefault<'LEFT'|'RIGHT','LEFT'>;
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

export interface CommonDatasetConfig {
    color?: Color;
    colors?: Color[];
    highlightEnabled?: boolean;
    drawValues?: boolean;
    valueTextSize?: Float;
    valueTextColor?: Color;
    visible?: boolean;
    valueFormatter?:WithDefault<"largeValue" | "percent" | "date",'largeValue'>;
    axisDependency?:WithDefault< "LEFT" | "RIGHT",'LEFT'>;
}

export interface BarLineScatterCandleBubbleConfig {
    highlightColor?: Color;
}

export interface Dataset {
    label?: string;
}
export interface BarValue {
    x?: Float;
    y?: Float;
    marker?: string;
}
export interface BarDataset extends Dataset {
    values?:BarValue[];
    config?: BarDatasetConfig;
}
export interface BarDatasetConfig extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig {
    barShadowColor?: Color;
    highlightAlpha?: Float;
    stackLabels?: string[];
}
interface groupType{
    fromX: Float;
    groupSpace: Float;
    barSpace: Float;
}
interface configType{
    barWidth?: Float;
    topRadius?:Float;
    group?:groupType
}
export interface BarData {
    dataSets?: BarDataset[];

    config?:configType;
}
export interface BarChartProps extends BarLineChartBase{
    drawValueAboveBar?: boolean;
    drawBarShadow?: boolean;
    highlightFullBarEnabled?: boolean;

    data: BarData;
  }

  export default codegenNativeComponent<BarChartProps>("RNBarChart") as HostComponent<BarChartProps>;