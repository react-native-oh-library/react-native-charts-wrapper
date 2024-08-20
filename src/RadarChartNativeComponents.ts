import {
    HostComponent,
  } from "react-native";
import { Float, WithDefault } from "react-native/Libraries/Types/CodegenTypes";
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
type Color = Float;

interface animationType {
    durationX?: Float;
    durationY?: Float;
    easingX: string,
    easingY: string
}
export interface ChartDescription {
    enabled?:boolean
    text?: string;
    textColor?: Color;
    textSize?: Float;
    positionX?: Float;
    positionY?: Float;
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
interface customType{
    colors?: Color[];
    labels?: string[];
}

interface gridDashedLineType{
    lineLength?: Float;
    spaceLength?: Float;
    phase?: Float;
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

export interface PieRadarChartBase extends ChartBase {
    minOffset?: Float ;
    rotationEnabled?: boolean ;
    rotationAngle?: Float ;
}




//data

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
export interface LineScatterCandleRadarConfig {
    drawVerticalHighlightIndicator?: boolean ;
    drawHorizontalHighlightIndicator?: boolean ;
    highlightLineWidth?: Float ;
    drawHighlightIndicators?: boolean ;
}
interface fillFradientType {
    colors?: Color[] ;
    positions?: Float[] ;
    angle?: Float ;
    orientation?:WithDefault<"TOP_BOTTOM"
    | "TR_BL"
    | "RIGHT_LEFT"
    | "BR_TL"
    | "BOTTOM_TOP"
    | "BL_TR"
    | "LEFT_RIGHT"
    | "TL_BR",'TOP_BOTTOM'>
       
        ;
}
export interface LineRadarConfig {
    fillGradient?:fillFradientType
    fillColor?: Color ;
    fillAlpha?: Float ;
    drawFilled?: boolean ;
    lineWidth?: Float ;
}

export interface Dataset {
    label?: string;
}
export interface RadarDatasetConfig extends CommonDatasetConfig, LineScatterCandleRadarConfig, LineRadarConfig {}
interface  RadarValue {
    value:Float
    label?:string
}
export interface RadarDataset extends Dataset {
    values?:RadarValue[] ;
    config?: RadarDatasetConfig ;
}

export interface RadarData {
    dataSets?: RadarDataset[] ;
    labels?: string[] ;
}


interface zeroLineType{
    enabled?: boolean ;
    lineWidth?: Float ;
    lineColor?: Color ;
} 
export interface yAxis extends Axis {
    inverted?: boolean ;
    spaceTop?: Float ;
    spaceBottom?: Float ;

    position?: WithDefault<"OUTSIDE_CHART" | "INSIDE_CHART",'OUTSID_CHART'> ;

    maxWidth?: Float ;
    minWidth?: Float ;

    zeroLine?:zeroLineType
}
export interface RadarChartProps extends PieRadarChartBase{
    yAxis?: yAxis ;

    drawWeb?: boolean ;
    skipWebLineCount?: Float ;

    webLineWidth?: Float ;
    webLineWidthInner?: Float ;
    webAlpha?: Float ;
    webColor?: Color ;
    webColorInner?: Color ;
    data: RadarData;
  }

  export default codegenNativeComponent<RadarChartProps>("RNRadarChart") as HostComponent<RadarChartProps>;