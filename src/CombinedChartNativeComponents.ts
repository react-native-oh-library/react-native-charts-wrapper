import {
    HostComponent,
    ViewProps,
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
interface customType {
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
    labelPosition?: WithDefault<string, 'LEFT_TOP'>;
    lineDashPhase?: Float;
    lineDashLengths?: Float[];
}
interface gridDashedLineType {
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
    gridDashedLine?: gridDashedLineType;

    limitLines?: AxisLimitLine[];
    drawLimitLinesBehindData?: boolean;

    axisMaximum?: Float;
    axisMinimum?: Float;
    granularity?: Float;
    granularityEnabled?: boolean;

    labelCount?: Float;
    labelCountForce?: boolean;

    centerAxisLabels?: boolean;

    valueFormatter?: string;

    valueFormatterPattern?: string;
    since?: Float;
    timeUnit?: WithDefault<string, 'MILLISECONDS'>;
}


export interface xAxis extends Axis {
    labelRotationAngle?: Float;
    avoidFirstLastClipping?: boolean;
    position?: WithDefault<string, 'TOP'>;
    yOffset?: Float;
}
interface animationType {
    durationX?: Float;
    durationY?: Float;
    easingX: string,
    easingY: string
}
interface markerType {
    enabled?: boolean;
    digits?: Float;
    markerColor?: Color;
    textColor?: Color;
    textSize?: Float;
}
interface highlightsType {
    x: Float;
    dataSetIndex?: Float;
    dataIndex?: Float;
    y?: Float;
    stackIndex?: Float;
}
export interface ChartBase {
    animation?: animationType;

    chartBackgroundColor?: Float;
    logEnabled?: boolean;
    noDataText?: string;
    noDataTextColor: Float;

    touchEnabled?: boolean;
    dragDecelerationEnabled?: boolean;
    dragDecelerationFrictionCoef?: Float;

    highlightPerTapEnabled?: boolean;
    chartDescription?: ChartDescription;

    legend?: ChartLegend;

    xAxis?: xAxis;

    marker?: markerType;

    highlights?: highlightsType[];
}

interface zeroLine {
    enabled?: boolean;
    lineWidth?: Float;
    lineColor?: Color;
}
export interface yAxis extends Axis {
    inverted?: boolean;
    spaceTop?: Float;
    spaceBottom?: Float;

    position?: WithDefault<string, 'OUTSIDE_CHART'>;

    maxWidth?: Float;
    minWidth?: Float;

    zeroLine?: zeroLine
}
export interface Offsets {
    top?: Float;
    left?: Float;
    bottom?: Float;
    right?: Float;
}

interface xType {
    min?: Float;
    max?: Float;
}
interface yType {
    left?: xType
    right?: xType
}
interface visibleRangeType {
    x?: xType
    y?: yType
}
interface yAxisType {
    left?: yAxis;
    right?: yAxis;
}
interface zoom {
    scaleX: Float;
    scaleY: Float;
    xValue: Float;
    yValue: Float;
    axisDependency?: WithDefault<string, 'LEFT'>;
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
    visibleRange?: visibleRangeType;
    autoScaleMinMaxEnabled?: boolean;
    keepPositionOnRotation?: boolean;

    highlightPerDragEnabled?: boolean;

    scaleEnabled?: boolean;
    scaleXEnabled?: boolean;
    scaleYEnabled?: boolean;
    dragEnabled?: boolean;
    pinchZoom?: boolean;
    doubleTapToZoomEnabled?: boolean;

    yAxis?: yAxisType;
    zoom?: zoom;

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
    valueFormatter?: WithDefault<string, 'largeValue'>;
    axisDependency?: WithDefault<string, 'LEFT'>;
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

export interface LineValue {
    x?: Float ;
    y: Float;
    marker?: string ;
    icon?: LineIcon ;
}

export interface LineIcon {
    height: Float;
    width: Float;
    bundle: ImageResolvedAssetSource;
}

export interface LineScatterCandleRadarConfig {
    drawVerticalHighlightIndicator?: boolean ;
    drawHorizontalHighlightIndicator?: boolean ;
    highlightLineWidth?: Float ;
    drawHighlightIndicators?: boolean ;
}

export interface ScatterDatasetConfig
    extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig, LineScatterCandleRadarConfig {
    scatterShapeSize?: Float ;
    scatterShape?: WithDefault<string,'SQUARE'> ;
    scatterShapeHoleColor?: Color ;
    scatterShapeHoleRadius?: Float ;
}

export interface ScatterDataset extends Dataset {
    values?: LineValue[] ;
    config?: ScatterDatasetConfig ;
}

export interface ScatterData {
    dataSets: ScatterDataset[];
}
export interface LineValue {
    x?: Float;
    y: Float;
    marker?: string;
    icon?: LineIcon;
}
export interface LineIcon {
    height: Float;
    width: Float;
    bundle: ImageResolvedAssetSource;
}
export interface ImageResolvedAssetSource {
    height: Float;
    width: Float;
    scale: Float;
    uri: string;
}
interface fillGradientType{
    colors?: Color[] ;
    positions?: Float[] ;
    angle?: Float ;
    orientation?:WithDefault<string,'TOP_BOTTOM'>

}
export interface LineRadarConfig {
    fillGradient?:fillGradientType,
    fillColor?: Color ;
    fillAlpha?: Float ;
    drawFilled?: boolean ;
    lineWidth?: Float ;
}



interface dashedLineType {
    lineLength: Float;
    spaceLength: Float;
    phase?: Float;
}
export interface LineDatasetConfig
    extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig, LineScatterCandleRadarConfig, LineRadarConfig {
    circleRadius?: Float;
    drawCircles?: boolean;
    mode?: WithDefault<string, 'LINEAR'>
    drawCubicIntensity?: Float;
    circleColor?: Color;
    circleColors?: Color[];
    circleHoleColor?: Color;
    drawCircleHole?: boolean;
    dashedLine?: dashedLineType

}

export interface BarDataset extends Dataset {
    values?: BarValue[];
    config?: BarDatasetConfig;
}
export interface BarDatasetConfig extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig {
    barShadowColor?: Color;
    highlightAlpha?: Float;
    stackLabels?: string[];
}
interface groupType {
    fromX: Float;
    groupSpace: Float;
    barSpace: Float;
}
interface configType {
    barWidth?: Float;
    topRadius?: Float;
    group?: groupType
}
export interface BarData {
    dataSets?: BarDataset[];

    config?: configType;
}
export interface LineDataset extends Dataset {
    values?: LineValue[];
    config?: LineDatasetConfig;
}
export interface LineData {
    dataSets?: LineDataset[];
}
export interface CandleStickValue {
    x?: Float ;
    shadowH: Float;
    shadowL: Float;
    open: Float;
    close: Float;
    marker?: string ;
}

export interface CandleStickDatasetConfig
    extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig, LineScatterCandleRadarConfig {
    barSpace?: Float ;
    shadowWidth?: Float ;
    shadowColor?: Color ;
    shadowColorSameAsCandle?: boolean ;
    neutralColor?: Color ;
    decreasingColor?: Color ;
    decreasingPaintStyle?: WithDefault<string,'FILL'> ;
    increasingColor?: Color ;
    increasingPaintStyle?: WithDefault<string,'FILL'> ;
}

export interface CandleStickDataset extends Dataset {
    values?: CandleStickValue[] ;
    config?: CandleStickDatasetConfig ;
}
export interface CandleStickData {
    dataSets?: CandleStickDataset[] ;
}

export interface BubbleValue {
    x?: Float ;
    y: Float;
    size: Float;
    marker?: string ;
}

export interface BubbleDatasetConfig extends CommonDatasetConfig, BarLineScatterCandleBubbleConfig {
    highlightCircleWidth?: Float ;
}

export interface BubbleDataset extends Dataset {
    values?: BubbleValue[] ;
    config?: BubbleDatasetConfig ;
}

export interface BubbleData {
    dataSets?: BubbleDataset[] ;
}


export interface CombinedData {
    lineData?: LineData ;
    barData?: BarData ;
    scatterData?: ScatterData ;
    candleData?: CandleStickData ;
    bubbleData?: BubbleData ;
}

type DrawOrderType = "BAR" | "BUBBLE" | "LINE" | "CANDLE" | "SCATTER"

type DrawOrderTypeArr = DrawOrderType[]

export interface CombinedChartProps extends ViewProps, BarLineChartBase {
    drawOrder?: WithDefault<string, 'BAR'>;
    drawValueAboveBar?: boolean ;
    highlightFullBarEnabled?: boolean ;
    drawBarShadow?: boolean ;
    data?: CombinedData ;
}


export default codegenNativeComponent<CombinedChartProps>("RNCombinedChart") as HostComponent<CombinedChartProps>;