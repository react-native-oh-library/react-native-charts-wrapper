import {
    HostComponent,
    ViewProps,
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
export interface ChartLegend {
    enabled?: boolean;
    textColor?: Color;
    textSize?: Float;
    fontFamily?: string;
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
    labelPosition?:WithDefault<string ,'LEFT_TOP'> ;
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
    timeUnit?:WithDefault<string,'MILLISECONDS'> ;
}


export interface xAxis extends Axis {
    labelRotationAngle?: Float;
    avoidFirstLastClipping?: boolean;
    position?:WithDefault<string,'TOP'> ;
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
export type PieValuePosition = WithDefault<string,'INSIDE_SLICE'>;

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
export interface PieDatasetConfig extends CommonDatasetConfig {
    sliceSpace?: Float ;
    selectionShift?: Float ;
    xValuePosition?: PieValuePosition ;
    yValuePosition?: PieValuePosition ;
    valueLinePart1Length?: Float ;
    valueLinePart2Length?: Float ;
    valueLineColor?: Color ;
    valueLineWidth?: Float ;
    valueLinePart1OffsetPercentage?: Float ;
    valueLineVariableLength?: boolean ;
}

export interface PieValue {
    value: Float;
    label?: string ;
}
export interface Dataset {
    label?: string;
}
export interface PieDataset extends Dataset {
    values?:PieValue[];
    config?: PieDatasetConfig ;
}

export interface PieData {
    dataSets?: PieDataset[] ;
}
 type FontFamily = WithDefault<string,'sans-serif'>;
interface styledCenterTextType {
    text?: string ;
    color?: Color ;
    size?: Float ;
    fontFamily?: FontFamily ;
}
export interface PieChartProps extends ViewProps, PieRadarChartBase{
    drawEntryLabels?: boolean ;
    usePercentValues?: boolean ;

    centerText?: string ;
    styledCenterText?:styledCenterTextType
    centerTextRadiusPercent?: Float ;
    holeRadius?: Float ;
    holeColor?: Color ;
    transparentCircleRadius?: Float ;
    transparentCircleColor?: Color ;

    entryLabelColor?: Color ;
    entryLabelTextSize?: Float ;
    entryLabelFontFamily?: FontFamily ;

    maxAngle?: Float ;
    data: PieData;
  }

  export default codegenNativeComponent<PieChartProps>("RNPieChart") as HostComponent<PieChartProps>;