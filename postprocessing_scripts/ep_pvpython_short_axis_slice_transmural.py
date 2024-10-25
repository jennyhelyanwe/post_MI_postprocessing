# trace generated using paraview version 5.5.1

#### import the simple module from the paraview
from paraview.simple import *
from matplotlib import pyplot as plt
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'EnSight Reader'
heart_remeshed_3D_MAPSensicase = EnSightReader(CaseFileName='heart_remeshed_3D_MAPS.ensi.case')
heart_remeshed_3D_MAPSensicase.CellArrays = ['MIBDZ']
heart_remeshed_3D_MAPSensicase.PointArrays = ['ACTIV', 'RELAX']

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1830, 910]

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# show data in view
heart_remeshed_3D_MAPSensicaseDisplay = Show(heart_remeshed_3D_MAPSensicase, renderView1)

# get color transfer function/color map for 'ACTIV'
aCTIVLUT = GetColorTransferFunction('ACTIV')


# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
aCTIVLUT.ApplyPreset('Viridis (matplotlib)', True)

# invert the transfer function
aCTIVLUT.InvertTransferFunction()

# Properties modified on aCTIVLUT
aCTIVLUT.UseAboveRangeColor = 1

# get opacity transfer function/opacity map for 'ACTIV'
aCTIVPWF = GetOpacityTransferFunction('ACTIV')

# create a new 'Calculator'
calculator1 = Calculator(Input=heart_remeshed_3D_MAPSensicase)

# Properties modified on calculator1
calculator1.ResultArrayName = 'ACTIV'
calculator1.Function = 'ACTIV - 0.1'

# create a new 'Calculator'
calculator2 = Calculator(Input=heart_remeshed_3D_MAPSensicase)

# Properties modified on calculator1
calculator2.ResultArrayName = 'RELAX'
calculator2.Function = 'RELAX - 0.1'

calculator3 = Calculator(Input=heart_remeshed_3D_MAPSensicase)

# Properties modified on calculator1
calculator3.ResultArrayName = 'APD90'
calculator3.Function = 'RELAX - ACTIV'

# # show data in view
heart_remeshed_3D_MAPSensicaseDisplay = Show(calculator1, renderView1)


# trace defaults for the display properties.
heart_remeshed_3D_MAPSensicaseDisplay.Representation = 'Surface'
heart_remeshed_3D_MAPSensicaseDisplay.ColorArrayName = ['POINTS', 'ACTIV']
heart_remeshed_3D_MAPSensicaseDisplay.LookupTable = aCTIVLUT
heart_remeshed_3D_MAPSensicaseDisplay.OSPRayScaleArray = 'ACTIV'
heart_remeshed_3D_MAPSensicaseDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
heart_remeshed_3D_MAPSensicaseDisplay.SelectOrientationVectors = 'ACTIV'
heart_remeshed_3D_MAPSensicaseDisplay.ScaleFactor = 1.1134918212890625
heart_remeshed_3D_MAPSensicaseDisplay.SelectScaleArray = 'ACTIV'
heart_remeshed_3D_MAPSensicaseDisplay.GlyphType = 'Arrow'
heart_remeshed_3D_MAPSensicaseDisplay.GlyphTableIndexArray = 'ACTIV'
heart_remeshed_3D_MAPSensicaseDisplay.GaussianRadius = 0.055674591064453126
heart_remeshed_3D_MAPSensicaseDisplay.SetScaleArray = ['POINTS', 'ACTIV']
heart_remeshed_3D_MAPSensicaseDisplay.ScaleTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_MAPSensicaseDisplay.OpacityArray = ['POINTS', 'ACTIV']
heart_remeshed_3D_MAPSensicaseDisplay.OpacityTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid = 'GridAxesRepresentation'
heart_remeshed_3D_MAPSensicaseDisplay.SelectionCellLabelFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.SelectionPointLabelFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.PolarAxes = 'PolarAxesRepresentation'
heart_remeshed_3D_MAPSensicaseDisplay.ScalarOpacityFunction = aCTIVPWF
heart_remeshed_3D_MAPSensicaseDisplay.ScalarOpacityUnitDistance = 0.15441996066771663

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
heart_remeshed_3D_MAPSensicaseDisplay.ScaleTransferFunction.Points = [0.0941338837146759, 0.0, 0.5, 0.0, 0.17861036956310272, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
heart_remeshed_3D_MAPSensicaseDisplay.OpacityTransferFunction.Points = [0.0941338837146759, 0.0, 0.5, 0.0, 0.17861036956310272, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.XTitleFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.YTitleFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.ZTitleFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.XLabelFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.YLabelFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
heart_remeshed_3D_MAPSensicaseDisplay.PolarAxes.PolarAxisTitleFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.PolarAxes.PolarAxisLabelFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.PolarAxes.LastRadialAxisTextFontFile = ''
heart_remeshed_3D_MAPSensicaseDisplay.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# reset view to fit data
renderView1.ResetCamera()

# show color bar/color legend
heart_remeshed_3D_MAPSensicaseDisplay.SetScalarBarVisibility(renderView1, False)

# update the view to ensure updated data information
renderView1.Update()

# Properties modified on renderView1
renderView1.Background = [1.0, 0.9999694819562066, 0.9999847409781033]

# create a new 'Slice'
slice1 = Slice(Input=calculator1)
slice1.SliceType = 'Plane'
slice1.SliceOffsetValues = [0.0]

# init the 'Plane' selected for 'SliceType'
slice1.SliceType.Origin = [-1.7238283157348633, -0.6809046268463135, -3.3879653510521166]

# Properties modified on slice1.SliceType
slice1.SliceType.Origin = [0.0, 0.0, -2.0]
slice1.SliceType.Normal = [0.0, 0.0, 1.0]

# Properties modified on slice1.SliceType
slice1.SliceType.Origin = [0.0, 0.0, -2.0]
slice1.SliceType.Normal = [0.0, 0.0, 1.0]

# show data in view
slice1Display = Show(slice1, renderView1)

# trace defaults for the display properties.
slice1Display.Representation = 'Surface'
slice1Display.ColorArrayName = ['POINTS', 'ACTIV']
slice1Display.LookupTable = aCTIVLUT
slice1Display.OSPRayScaleArray = 'ACTIV'
slice1Display.OSPRayScaleFunction = 'PiecewiseFunction'
slice1Display.SelectOrientationVectors = 'ACTIV'
slice1Display.ScaleFactor = 1.0255012035369873
slice1Display.SelectScaleArray = 'ACTIV'
slice1Display.GlyphType = 'Arrow'
slice1Display.GlyphTableIndexArray = 'ACTIV'
slice1Display.GaussianRadius = 0.051275060176849366
slice1Display.SetScaleArray = ['POINTS', 'ACTIV']
slice1Display.ScaleTransferFunction = 'PiecewiseFunction'
slice1Display.OpacityArray = ['POINTS', 'ACTIV']
slice1Display.OpacityTransferFunction = 'PiecewiseFunction'
slice1Display.DataAxesGrid = 'GridAxesRepresentation'
slice1Display.SelectionCellLabelFontFile = ''
slice1Display.SelectionPointLabelFontFile = ''
slice1Display.PolarAxes = 'PolarAxesRepresentation'

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
slice1Display.ScaleTransferFunction.Points = [0.09625144302845001, 0.0, 0.5, 0.0, 0.15939588844776154, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
slice1Display.OpacityTransferFunction.Points = [0.09625144302845001, 0.0, 0.5, 0.0, 0.15939588844776154, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
slice1Display.DataAxesGrid.XTitleFontFile = ''
slice1Display.DataAxesGrid.YTitleFontFile = ''
slice1Display.DataAxesGrid.ZTitleFontFile = ''
slice1Display.DataAxesGrid.XLabelFontFile = ''
slice1Display.DataAxesGrid.YLabelFontFile = ''
slice1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
slice1Display.PolarAxes.PolarAxisTitleFontFile = ''
slice1Display.PolarAxes.PolarAxisLabelFontFile = ''
slice1Display.PolarAxes.LastRadialAxisTextFontFile = ''
slice1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''


# show color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)

# update the view to ensure updated data information
renderView1.Update()

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=slice1.SliceType)

# # get color legend/bar for aCTIVLUT in view renderView1
# aCTIVLUTColorBar = GetScalarBar(aCTIVLUT, renderView1)
#
# # Properties modified on aCTIVLUTColorBar
# aCTIVLUTColorBar.TitleColor = [0.0, 0.0, 0.0]
# aCTIVLUTColorBar.LabelColor = [0.0, 0.0, 0.0]

# Rescale transfer function
aCTIVLUT.RescaleTransferFunction(0.0, 0.1)

# Rescale transfer function
aCTIVPWF.RescaleTransferFunction(0.0, 0.1)

# hide data in view
Hide(heart_remeshed_3D_MAPSensicase, renderView1)
Hide(calculator1, renderView1)
Hide(calculator2, renderView1)

# reset view to fit data bounds
renderView1.ResetCamera(-6.67057561874, 3.58443641663, -3.70694446564, 3.17245721817, -2.0, -2.0)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-3.8880013400942777, 1.758843184285345, -25.653796034549273]
renderView1.CameraFocalPoint = [0.40011609630348, -2.302872613959179, -4.2054682953052716]
renderView1.CameraViewUp = [0.0027830826496680404, -0.9998949003206304, -0.01422823825221045]
renderView1.CameraViewAngle = 6.252847380410023
renderView1.CameraParallelScale = 6.174371210349129

# save screenshot
SaveScreenshot('short_axis_activation_map.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0', TransparentBackground = 1)

################################################################################
# show data in view

# create a new 'Slice'
slice2 = Slice(Input=calculator2)
slice2.SliceType = 'Plane'
slice2.SliceOffsetValues = [0.0]

# init the 'Plane' selected for 'SliceType'
slice2.SliceType.Origin = [-1.7238283157348633, -0.6809046268463135, -3.3879653510521166]

# Properties modified on slice1.SliceType
slice2.SliceType.Origin = [0.0, 0.0, -2.0]
slice2.SliceType.Normal = [0.0, 0.0, 1.0]

# Properties modified on slice1.SliceType
slice2.SliceType.Origin = [0.0, 0.0, -2.0]
slice2.SliceType.Normal = [0.0, 0.0, 1.0]

# show data in view
slice2Display = Show(slice2, renderView1)

# get color transfer function/color map for 'ACTIV'
rELAXLUT = GetColorTransferFunction('RELAX')

# trace defaults for the display properties.
slice2Display.Representation = 'Surface'
slice2Display.ColorArrayName = ['POINTS', 'RELAX']
slice2Display.LookupTable = rELAXLUT
slice2Display.OSPRayScaleArray = 'RELAX'
slice2Display.OSPRayScaleFunction = 'PiecewiseFunction'
slice2Display.SelectOrientationVectors = 'RELAX'
slice2Display.ScaleFactor = 1.0255012035369873
slice2Display.SelectScaleArray = 'RELAX'
slice2Display.GlyphType = 'Arrow'
slice2Display.GlyphTableIndexArray = 'RELAX'
slice2Display.GaussianRadius = 0.051275060176849366
slice2Display.SetScaleArray = ['POINTS', 'RELAX']
slice2Display.ScaleTransferFunction = 'PiecewiseFunction'
slice2Display.OpacityArray = ['POINTS', 'RELAX']
slice2Display.OpacityTransferFunction = 'PiecewiseFunction'
slice2Display.DataAxesGrid = 'GridAxesRepresentation'
slice2Display.SelectionCellLabelFontFile = ''
slice2Display.SelectionPointLabelFontFile = ''
slice2Display.PolarAxes = 'PolarAxesRepresentation'

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
slice2Display.ScaleTransferFunction.Points = [0.09625144302845001, 0.0, 0.5, 0.0, 0.15939588844776154, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
slice2Display.OpacityTransferFunction.Points = [0.09625144302845001, 0.0, 0.5, 0.0, 0.15939588844776154, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
slice2Display.DataAxesGrid.XTitleFontFile = ''
slice2Display.DataAxesGrid.YTitleFontFile = ''
slice2Display.DataAxesGrid.ZTitleFontFile = ''
slice2Display.DataAxesGrid.XLabelFontFile = ''
slice2Display.DataAxesGrid.YLabelFontFile = ''
slice2Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
slice2Display.PolarAxes.PolarAxisTitleFontFile = ''
slice2Display.PolarAxes.PolarAxisLabelFontFile = ''
slice2Display.PolarAxes.LastRadialAxisTextFontFile = ''
slice2Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''


# show color bar/color legend
slice2Display.SetScalarBarVisibility(renderView1, False)

# update the view to ensure updated data information
renderView1.Update()

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=slice2.SliceType)


# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(aCTIVLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
slice2Display.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
slice2Display.SetScalarBarVisibility(renderView1, False)

# get color transfer function/color map for 'RELAX'
rELAXLUT = GetColorTransferFunction('RELAX')

# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
rELAXLUT.ApplyPreset('Magma (matplotlib)', True)

# Properties modified on rELAXLUT
rELAXLUT.UseAboveRangeColor = 1

# invert the transfer function
rELAXLUT.InvertTransferFunction()

# Rescale transfer function
rELAXLUT.RescaleTransferFunction(0.22, 0.37)

# get opacity transfer function/opacity map for 'RELAX'
rELAXPWF = GetOpacityTransferFunction('RELAX')

# Rescale transfer function
rELAXPWF.RescaleTransferFunction(0.22, 0.37)

# Rescale transfer function
rELAXLUT.RescaleTransferFunction(0.22, 0.37)

# Rescale transfer function
rELAXPWF.RescaleTransferFunction(0.22, 0.37)

# # get color legend/bar for rELAXLUT in view renderView1
# rELAXLUTColorBar = GetScalarBar(rELAXLUT, renderView1)
#
# # Properties modified on rELAXLUTColorBar
# rELAXLUTColorBar.TitleColor = [0.0, 0.0, 0.0]
# rELAXLUTColorBar.LabelColor = [0.0, 0.0, 0.0]

#### saving camera placements for all active views
# hide data in view
Hide(heart_remeshed_3D_MAPSensicase, renderView1)
Hide(slice1, renderView1)
Hide(calculator1, renderView1)
Hide(calculator2, renderView1)

# current camera placement for renderView1
renderView1.CameraPosition = [-3.8880013400942777, 1.758843184285345, -25.653796034549273]
renderView1.CameraFocalPoint = [0.40011609630348, -2.302872613959179, -4.2054682953052716]
renderView1.CameraViewUp = [0.0027830826496680404, -0.9998949003206304, -0.01422823825221045]
renderView1.CameraViewAngle = 6.252847380410023
renderView1.CameraParallelScale = 6.174371210349129

# save screenshot
SaveScreenshot('short_axis_repolarisation_map.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0', TransparentBackground = 1)

#### saving camera placements for all active views

# reset view to fit data bounds
renderView1.ResetCamera(-6.67057561874, 3.58443641663, -3.70694446564, 3.17245721817, -2.0, -2.0)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-3.8880013400942777, 1.758843184285345, -25.653796034549273]
renderView1.CameraFocalPoint = [0.40011609630348, -2.302872613959179, -4.2054682953052716]
renderView1.CameraViewUp = [0.0027830826496680404, -0.9998949003206304, -0.01422823825221045]
renderView1.CameraViewAngle = 6.252847380410023
renderView1.CameraParallelScale = 6.174371210349129

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
# create a new 'Plot Over Line'
plotOverLine1 = PlotOverLine(registrationName='PlotOverLine1', Input=heart_remeshed_3D_MAPSensicase,
    Source='Line')

# init the 'Line' selected for 'Source'
plotOverLine1.Source.Point1 = [0.8444277033945551, -2.6465156679828583, -2.000323086396536]
plotOverLine1.Source.Point2 = [1.0573092276974916, -3.2299792537956513, -2.0044815597493586 ]

# set active view
SetActiveView(renderView1)

# find view
lineChartView1 = FindViewOrCreate('LineChartView1', viewtype='XYChartView')

# set active view
SetActiveView(lineChartView1)

# get active source.
plotOverLine1 = GetActiveSource()

# set active source
SetActiveSource(plotOverLine1)

# show data in view
plotOverLine1Display = Show(plotOverLine1, lineChartView1, 'XYChartRepresentation')

# trace defaults for the display properties.
plotOverLine1Display.CompositeDataSetIndex = [0]
plotOverLine1Display.UseIndexForXAxis = 0
plotOverLine1Display.XArrayName = 'arc_length'
plotOverLine1Display.SeriesVisibility = ['ACTIV', 'RELAX']
plotOverLine1Display.SeriesLabel = ['ACTIV', 'ACTIV', 'arc_length', 'arc_length', 'RELAX', 'RELAX', 'vtkValidPointMask', 'vtkValidPointMask', 'Points_X', 'Points_X', 'Points_Y', 'Points_Y', 'Points_Z', 'Points_Z', 'Points_Magnitude', 'Points_Magnitude']
plotOverLine1Display.SeriesColor = ['ACTIV', '0', '0', '0', 'arc_length', '0.8899977111467154', '0.10000762951094835', '0.1100022888532845', 'RELAX', '0.220004577706569', '0.4899977111467155', '0.7199969481956207', 'vtkValidPointMask', '0.30000762951094834', '0.6899977111467155', '0.2899977111467155', 'Points_X', '0.6', '0.3100022888532845', '0.6399938963912413', 'Points_Y', '1', '0.5000076295109483', '0', 'Points_Z', '0.6500038147554742', '0.3400015259021897', '0.16000610360875867', 'Points_Magnitude', '0', '0', '0']
plotOverLine1Display.SeriesPlotCorner = ['ACTIV', '0', 'arc_length', '0', 'RELAX', '0', 'vtkValidPointMask', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine1Display.SeriesLabelPrefix = ''
plotOverLine1Display.SeriesLineStyle = ['ACTIV', '1', 'arc_length', '1', 'RELAX', '1', 'vtkValidPointMask', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'Points_Magnitude', '1']
plotOverLine1Display.SeriesLineThickness = ['ACTIV', '2', 'arc_length', '2', 'RELAX', '2', 'vtkValidPointMask', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'Points_Magnitude', '2']
plotOverLine1Display.SeriesMarkerStyle = ['ACTIV', '0', 'arc_length', '0', 'RELAX', '0', 'vtkValidPointMask', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'Points_Magnitude', '0']
plotOverLine1Display.SeriesMarkerSize = ['ACTIV', '4', 'arc_length', '4', 'RELAX', '4', 'vtkValidPointMask', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'Points_Magnitude', '4']

# Properties modified on plotOverLine1Display
plotOverLine1Display.SeriesPlotCorner = ['ACTIV', '0', 'Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'RELAX', '0', 'arc_length', '0', 'vtkValidPointMask', '0']
plotOverLine1Display.SeriesLineStyle = ['ACTIV', '1', 'Points_Magnitude', '1', 'Points_X', '1', 'Points_Y', '1', 'Points_Z', '1', 'RELAX', '1', 'arc_length', '1', 'vtkValidPointMask', '1']
plotOverLine1Display.SeriesLineThickness = ['ACTIV', '2', 'Points_Magnitude', '2', 'Points_X', '2', 'Points_Y', '2', 'Points_Z', '2', 'RELAX', '2', 'arc_length', '2', 'vtkValidPointMask', '2']
plotOverLine1Display.SeriesMarkerStyle = ['ACTIV', '0', 'Points_Magnitude', '0', 'Points_X', '0', 'Points_Y', '0', 'Points_Z', '0', 'RELAX', '0', 'arc_length', '0', 'vtkValidPointMask', '0']
plotOverLine1Display.SeriesMarkerSize = ['ACTIV', '4', 'Points_Magnitude', '4', 'Points_X', '4', 'Points_Y', '4', 'Points_Z', '4', 'RELAX', '4', 'arc_length', '4', 'vtkValidPointMask', '4']


# set active source
SetActiveSource(plotOverLine1)

# export view
ExportView('transmural_line.csv', view=lineChartView1)

renderView1 = FindViewOrCreate('RenderView1', viewtype='RenderView')

# set active view
SetActiveView(renderView1)

# get active source.
plotOverLine1 = GetActiveSource()

# set active source
SetActiveSource(plotOverLine1)

# show data in view
plotOverLine1Display = Show(plotOverLine1, renderView1, 'GeometryRepresentation')

# hide color bar/color legend
plotOverLine1Display.SetScalarBarVisibility(renderView1, False)


layout1 = GetLayout()

# layout/tab size in pixels
layout1.SetSize(1771, 902)

# current camera placement for renderView1
renderView1.CameraPosition = [-6.141369791270458, 4.088278071901808, -24.999801424752963]
renderView1.CameraFocalPoint = [-1.543069601055, -0.267243623735, -2.0]
renderView1.CameraViewUp = [0.0027830826496680404, -0.9998949003206304, -0.01422823825221045]
renderView1.CameraParallelScale = 6.174371210349129

# save screenshot
SaveScreenshot('short_axis_repolarisation_map_with_transmural_line.png', renderView1, ImageResolution=[886, 902],
    TransparentBackground=1)
