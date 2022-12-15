import numpy as np
#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()


################################################################################
# Set visualisation environment:
# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1568, 904]

# Properties modified on renderView1
renderView1.Background = [1.0, 1.0, 1.0]

################################################################################
# Read in mesh and show with INTRA gradient and DISPL deformation
# create a new 'EnSight Reader'
heart_remeshed_3Densicase = EnSightReader(CaseFileName='/Users/Jenny/Documents/Codes/Alya/Simulations/Xins_paper_simulations/DTI003/75%_transmural_scar_tuned/acute/bz1/ensight/displacement_local_strains/heart_remeshed_3D.ensi.case')
heart_remeshed_3Densicase.PointArrays = ['CALCI', 'INTRA', 'DISPL']

# create a new 'EnSight Reader'
heart_remeshed_3Densicase = EnSightReader(CaseFileName='/Users/Jenny/Documents/Codes/Alya/Simulations/Xins_paper_simulations/DTI003/75%_transmural_scar_tuned/acute/bz1/ensight/displacement_local_strains/heart_remeshed_3D.ensi.case')
heart_remeshed_3Densicase.PointArrays = ['CALCI', 'INTRA', 'DISPL']

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1568, 904]

# show data in view
heart_remeshed_3DensicaseDisplay = Show(heart_remeshed_3Densicase, renderView1)

# get color transfer function/color map for 'CALCI'
cALCILUT = GetColorTransferFunction('CALCI')

# get opacity transfer function/opacity map for 'CALCI'
cALCIPWF = GetOpacityTransferFunction('CALCI')

# trace defaults for the display properties.
heart_remeshed_3DensicaseDisplay.Representation = 'Surface'
heart_remeshed_3DensicaseDisplay.ColorArrayName = ['POINTS', 'CALCI']
heart_remeshed_3DensicaseDisplay.LookupTable = cALCILUT
heart_remeshed_3DensicaseDisplay.OSPRayScaleArray = 'CALCI'
heart_remeshed_3DensicaseDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
heart_remeshed_3DensicaseDisplay.SelectOrientationVectors = 'DISPL'
heart_remeshed_3DensicaseDisplay.ScaleFactor = 1.1134918212890625
heart_remeshed_3DensicaseDisplay.SelectScaleArray = 'CALCI'
heart_remeshed_3DensicaseDisplay.GlyphType = 'Arrow'
heart_remeshed_3DensicaseDisplay.GlyphTableIndexArray = 'CALCI'
heart_remeshed_3DensicaseDisplay.GaussianRadius = 0.055674591064453126
heart_remeshed_3DensicaseDisplay.SetScaleArray = ['POINTS', 'CALCI']
heart_remeshed_3DensicaseDisplay.ScaleTransferFunction = 'PiecewiseFunction'
heart_remeshed_3DensicaseDisplay.OpacityArray = ['POINTS', 'CALCI']
heart_remeshed_3DensicaseDisplay.OpacityTransferFunction = 'PiecewiseFunction'
heart_remeshed_3DensicaseDisplay.DataAxesGrid = 'GridAxesRepresentation'
heart_remeshed_3DensicaseDisplay.SelectionCellLabelFontFile = ''
heart_remeshed_3DensicaseDisplay.SelectionPointLabelFontFile = ''
heart_remeshed_3DensicaseDisplay.PolarAxes = 'PolarAxesRepresentation'
heart_remeshed_3DensicaseDisplay.ScalarOpacityFunction = cALCIPWF
heart_remeshed_3DensicaseDisplay.ScalarOpacityUnitDistance = 0.15441996066771663

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
heart_remeshed_3DensicaseDisplay.ScaleTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
heart_remeshed_3DensicaseDisplay.OpacityTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
heart_remeshed_3DensicaseDisplay.DataAxesGrid.XTitleFontFile = ''
heart_remeshed_3DensicaseDisplay.DataAxesGrid.YTitleFontFile = ''
heart_remeshed_3DensicaseDisplay.DataAxesGrid.ZTitleFontFile = ''
heart_remeshed_3DensicaseDisplay.DataAxesGrid.XLabelFontFile = ''
heart_remeshed_3DensicaseDisplay.DataAxesGrid.YLabelFontFile = ''
heart_remeshed_3DensicaseDisplay.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
heart_remeshed_3DensicaseDisplay.PolarAxes.PolarAxisTitleFontFile = ''
heart_remeshed_3DensicaseDisplay.PolarAxes.PolarAxisLabelFontFile = ''
heart_remeshed_3DensicaseDisplay.PolarAxes.LastRadialAxisTextFontFile = ''
heart_remeshed_3DensicaseDisplay.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# reset view to fit data
renderView1.ResetCamera()

# show color bar/color legend
heart_remeshed_3DensicaseDisplay.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Warp By Vector'
warpByVector1 = WarpByVector(Input=heart_remeshed_3Densicase)
warpByVector1.Vectors = ['POINTS', 'DISPL']

# show data in view
warpByVector1Display = Show(warpByVector1, renderView1)

# trace defaults for the display properties.
warpByVector1Display.Representation = 'Surface'
warpByVector1Display.ColorArrayName = ['POINTS', 'CALCI']
warpByVector1Display.LookupTable = cALCILUT
warpByVector1Display.OSPRayScaleArray = 'CALCI'
warpByVector1Display.OSPRayScaleFunction = 'PiecewiseFunction'
warpByVector1Display.SelectOrientationVectors = 'DISPL'
warpByVector1Display.ScaleFactor = 1.1130830764770507
warpByVector1Display.SelectScaleArray = 'CALCI'
warpByVector1Display.GlyphType = 'Arrow'
warpByVector1Display.GlyphTableIndexArray = 'CALCI'
warpByVector1Display.GaussianRadius = 0.05565415382385254
warpByVector1Display.SetScaleArray = ['POINTS', 'CALCI']
warpByVector1Display.ScaleTransferFunction = 'PiecewiseFunction'
warpByVector1Display.OpacityArray = ['POINTS', 'CALCI']
warpByVector1Display.OpacityTransferFunction = 'PiecewiseFunction'
warpByVector1Display.DataAxesGrid = 'GridAxesRepresentation'
warpByVector1Display.SelectionCellLabelFontFile = ''
warpByVector1Display.SelectionPointLabelFontFile = ''
warpByVector1Display.PolarAxes = 'PolarAxesRepresentation'
warpByVector1Display.ScalarOpacityFunction = cALCIPWF
warpByVector1Display.ScalarOpacityUnitDistance = 0.15433489660830135

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
warpByVector1Display.ScaleTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
warpByVector1Display.OpacityTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
warpByVector1Display.DataAxesGrid.XTitleFontFile = ''
warpByVector1Display.DataAxesGrid.YTitleFontFile = ''
warpByVector1Display.DataAxesGrid.ZTitleFontFile = ''
warpByVector1Display.DataAxesGrid.XLabelFontFile = ''
warpByVector1Display.DataAxesGrid.YLabelFontFile = ''
warpByVector1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
warpByVector1Display.PolarAxes.PolarAxisTitleFontFile = ''
warpByVector1Display.PolarAxes.PolarAxisLabelFontFile = ''
warpByVector1Display.PolarAxes.LastRadialAxisTextFontFile = ''
warpByVector1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# hide data in view
Hide(heart_remeshed_3Densicase, renderView1)

# show color bar/color legend
warpByVector1Display.SetScalarBarVisibility(renderView1, False)

# update the view to ensure updated data information
renderView1.Update()

# set scalar coloring
ColorBy(warpByVector1Display, ('POINTS', 'INTRA'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(cALCILUT, renderView1)

# rescale color and/or opacity maps used to include current data range
warpByVector1Display.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
warpByVector1Display.SetScalarBarVisibility(renderView1, False)

# get color transfer function/color map for 'INTRA'
iNTRALUT = GetColorTransferFunction('INTRA')

# Properties modified on warpByVector1Display
warpByVector1Display.Opacity = 0.6

# create a new 'Gradient Of Unstructured DataSet'
gradientOfUnstructuredDataSet1 = GradientOfUnstructuredDataSet(Input=warpByVector1)
gradientOfUnstructuredDataSet1.ScalarArray = ['POINTS', 'CALCI']

# Properties modified on gradientOfUnstructuredDataSet1
gradientOfUnstructuredDataSet1.ScalarArray = ['POINTS', 'INTRA']
gradientOfUnstructuredDataSet1.ResultArrayName = 'INTRAGradients'

# show data in view
gradientOfUnstructuredDataSet1Display = Show(gradientOfUnstructuredDataSet1, renderView1)

# trace defaults for the display properties.
gradientOfUnstructuredDataSet1Display.Representation = 'Surface'
gradientOfUnstructuredDataSet1Display.ColorArrayName = ['POINTS', 'CALCI']
gradientOfUnstructuredDataSet1Display.LookupTable = cALCILUT
gradientOfUnstructuredDataSet1Display.OSPRayScaleArray = 'CALCI'
gradientOfUnstructuredDataSet1Display.OSPRayScaleFunction = 'PiecewiseFunction'
gradientOfUnstructuredDataSet1Display.SelectOrientationVectors = 'DISPL'
gradientOfUnstructuredDataSet1Display.ScaleFactor = 1.1130830764770507
gradientOfUnstructuredDataSet1Display.SelectScaleArray = 'CALCI'
gradientOfUnstructuredDataSet1Display.GlyphType = 'Arrow'
gradientOfUnstructuredDataSet1Display.GlyphTableIndexArray = 'CALCI'
gradientOfUnstructuredDataSet1Display.GaussianRadius = 0.05565415382385254
gradientOfUnstructuredDataSet1Display.SetScaleArray = ['POINTS', 'CALCI']
gradientOfUnstructuredDataSet1Display.ScaleTransferFunction = 'PiecewiseFunction'
gradientOfUnstructuredDataSet1Display.OpacityArray = ['POINTS', 'CALCI']
gradientOfUnstructuredDataSet1Display.OpacityTransferFunction = 'PiecewiseFunction'
gradientOfUnstructuredDataSet1Display.DataAxesGrid = 'GridAxesRepresentation'
gradientOfUnstructuredDataSet1Display.SelectionCellLabelFontFile = ''
gradientOfUnstructuredDataSet1Display.SelectionPointLabelFontFile = ''
gradientOfUnstructuredDataSet1Display.PolarAxes = 'PolarAxesRepresentation'
gradientOfUnstructuredDataSet1Display.ScalarOpacityFunction = cALCIPWF
gradientOfUnstructuredDataSet1Display.ScalarOpacityUnitDistance = 0.15433489660830135

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
gradientOfUnstructuredDataSet1Display.ScaleTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
gradientOfUnstructuredDataSet1Display.OpacityTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
gradientOfUnstructuredDataSet1Display.DataAxesGrid.XTitleFontFile = ''
gradientOfUnstructuredDataSet1Display.DataAxesGrid.YTitleFontFile = ''
gradientOfUnstructuredDataSet1Display.DataAxesGrid.ZTitleFontFile = ''
gradientOfUnstructuredDataSet1Display.DataAxesGrid.XLabelFontFile = ''
gradientOfUnstructuredDataSet1Display.DataAxesGrid.YLabelFontFile = ''
gradientOfUnstructuredDataSet1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
gradientOfUnstructuredDataSet1Display.PolarAxes.PolarAxisTitleFontFile = ''
gradientOfUnstructuredDataSet1Display.PolarAxes.PolarAxisLabelFontFile = ''
gradientOfUnstructuredDataSet1Display.PolarAxes.LastRadialAxisTextFontFile = ''
gradientOfUnstructuredDataSet1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# hide data in view
Hide(warpByVector1, renderView1)

# show color bar/color legend
gradientOfUnstructuredDataSet1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Calculator'
calculator1 = Calculator(Input=gradientOfUnstructuredDataSet1)
calculator1.Function = ''

# Properties modified on calculator1
calculator1.ResultArrayName = 'INTRAGradientMagnitude'

# Properties modified on calculator1
calculator1.Function = 'sqrt(INTRAGradients_X^2 + INTRAGradients_Y^3 + INTRAGradients_Z^3)'

# show data in view
calculator1Display = Show(calculator1, renderView1)

# trace defaults for the display properties.
calculator1Display.Representation = 'Surface'
calculator1Display.ColorArrayName = ['POINTS', 'CALCI']
calculator1Display.LookupTable = cALCILUT
calculator1Display.OSPRayScaleArray = 'CALCI'
calculator1Display.OSPRayScaleFunction = 'PiecewiseFunction'
calculator1Display.SelectOrientationVectors = 'DISPL'
calculator1Display.ScaleFactor = 1.1130830764770507
calculator1Display.SelectScaleArray = 'CALCI'
calculator1Display.GlyphType = 'Arrow'
calculator1Display.GlyphTableIndexArray = 'CALCI'
calculator1Display.GaussianRadius = 0.05565415382385254
calculator1Display.SetScaleArray = ['POINTS', 'CALCI']
calculator1Display.ScaleTransferFunction = 'PiecewiseFunction'
calculator1Display.OpacityArray = ['POINTS', 'CALCI']
calculator1Display.OpacityTransferFunction = 'PiecewiseFunction'
calculator1Display.DataAxesGrid = 'GridAxesRepresentation'
calculator1Display.SelectionCellLabelFontFile = ''
calculator1Display.SelectionPointLabelFontFile = ''
calculator1Display.PolarAxes = 'PolarAxesRepresentation'
calculator1Display.ScalarOpacityFunction = cALCIPWF
calculator1Display.ScalarOpacityUnitDistance = 0.15433489660830135

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
calculator1Display.ScaleTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
calculator1Display.OpacityTransferFunction.Points = [3.255843694205396e-05, 0.0, 0.5, 0.0, 5.868676453246735e-05, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
calculator1Display.DataAxesGrid.XTitleFontFile = ''
calculator1Display.DataAxesGrid.YTitleFontFile = ''
calculator1Display.DataAxesGrid.ZTitleFontFile = ''
calculator1Display.DataAxesGrid.XLabelFontFile = ''
calculator1Display.DataAxesGrid.YLabelFontFile = ''
calculator1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
calculator1Display.PolarAxes.PolarAxisTitleFontFile = ''
calculator1Display.PolarAxes.PolarAxisLabelFontFile = ''
calculator1Display.PolarAxes.LastRadialAxisTextFontFile = ''
calculator1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# hide data in view
Hide(gradientOfUnstructuredDataSet1, renderView1)

# show color bar/color legend
calculator1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()



# create a new 'Threshold'
threshold1 = Threshold(Input=calculator1)
threshold1.Scalars = ['POINTS', 'INTRAGradientMagnitude']
threshold1.ThresholdRange = [0.0, 12.36133537040796]

# Properties modified on threshold1
threshold1.ThresholdRange = [6.30428103890806, 12.36133537040796]

# show data in view
threshold1Display = Show(threshold1, renderView1)

# get color transfer function/color map for 'INTRAGradientMagnitude'
iNTRAGradientMagnitudeLUT = GetColorTransferFunction('INTRAGradientMagnitude')

# get opacity transfer function/opacity map for 'INTRAGradientMagnitude'
iNTRAGradientMagnitudePWF = GetOpacityTransferFunction('INTRAGradientMagnitude')

# trace defaults for the display properties.
threshold1Display.Representation = 'Surface'
threshold1Display.ColorArrayName = ['POINTS', 'INTRAGradientMagnitude']
threshold1Display.LookupTable = iNTRAGradientMagnitudeLUT
threshold1Display.OSPRayScaleArray = 'INTRAGradientMagnitude'
threshold1Display.OSPRayScaleFunction = 'PiecewiseFunction'
threshold1Display.SelectOrientationVectors = 'DISPL'
threshold1Display.ScaleFactor = 0.6450615167617798
threshold1Display.SelectScaleArray = 'INTRAGradientMagnitude'
threshold1Display.GlyphType = 'Arrow'
threshold1Display.GlyphTableIndexArray = 'INTRAGradientMagnitude'
threshold1Display.GaussianRadius = 0.03225307583808899
threshold1Display.SetScaleArray = ['POINTS', 'INTRAGradientMagnitude']
threshold1Display.ScaleTransferFunction = 'PiecewiseFunction'
threshold1Display.OpacityArray = ['POINTS', 'INTRAGradientMagnitude']
threshold1Display.OpacityTransferFunction = 'PiecewiseFunction'
threshold1Display.DataAxesGrid = 'GridAxesRepresentation'
threshold1Display.SelectionCellLabelFontFile = ''
threshold1Display.SelectionPointLabelFontFile = ''
threshold1Display.PolarAxes = 'PolarAxesRepresentation'
threshold1Display.ScalarOpacityFunction = iNTRAGradientMagnitudePWF
threshold1Display.ScalarOpacityUnitDistance = 0.5326513859182964

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
threshold1Display.ScaleTransferFunction.Points = [6.30428915543931, 0.0, 0.5, 0.0, 12.36133537040796, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
threshold1Display.OpacityTransferFunction.Points = [6.30428915543931, 0.0, 0.5, 0.0, 12.36133537040796, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
threshold1Display.DataAxesGrid.XTitleFontFile = ''
threshold1Display.DataAxesGrid.YTitleFontFile = ''
threshold1Display.DataAxesGrid.ZTitleFontFile = ''
threshold1Display.DataAxesGrid.XLabelFontFile = ''
threshold1Display.DataAxesGrid.YLabelFontFile = ''
threshold1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
threshold1Display.PolarAxes.PolarAxisTitleFontFile = ''
threshold1Display.PolarAxes.PolarAxisLabelFontFile = ''
threshold1Display.PolarAxes.LastRadialAxisTextFontFile = ''
threshold1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# hide data in view
Hide(calculator1, renderView1)

# show color bar/color legend
threshold1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# set active source
SetActiveSource(warpByVector1)

# show data in view
warpByVector1Display = Show(warpByVector1, renderView1)

# hide color bar/color legend
warpByVector1Display.SetScalarBarVisibility(renderView1, False)

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# set active source
SetActiveSource(threshold1)

# set scalar coloring
ColorBy(threshold1Display, ('POINTS', 'INTRA'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(iNTRAGradientMagnitudeLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
threshold1Display.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
threshold1Display.SetScalarBarVisibility(renderView1, True)

# set active source
SetActiveSource(warpByVector1)

# set active source
SetActiveSource(threshold1)

################################################################################
# Load ECG electrode positions from csv file.
# create a new 'CSV Reader'
rotated_ecg_coordscsv = CSVReader(FileName=['/Users/Jenny/Documents/Codes/Alya/Simulations/heart_0275/paraviewinputfile/rotated_ecg_coords.csv'])

with open('/Users/Jenny/Documents/Codes/Alya/Simulations/heart_0275/paraviewinputfile/rotated_ecg_coords.csv', 'r') as f:
    data = f.readlines()
ecg_coords = []
for i in range(1, len(data)):
    ecg_coords.append([float(i) for i in data[i].split(',')])
ecg_coords = np.array(ecg_coords)
ecg_coords = ecg_coords[-6:,:] # Limit to just precordial leads

# find source
enSightReader2 = FindSource('EnSightReader2')

# find source
enSightReader1 = FindSource('EnSightReader1')

# Create a new 'SpreadSheet View'
spreadSheetView1 = CreateView('SpreadSheetView')
spreadSheetView1.ColumnToSort = ''
spreadSheetView1.BlockSize = 1024L
# uncomment following to set a specific view size
# spreadSheetView1.ViewSize = [400, 400]

# get layout
layout1 = GetLayout()

# place view in the layout
layout1.AssignView(2, spreadSheetView1)

# show data in view
rotated_ecg_coordscsvDisplay = Show(rotated_ecg_coordscsv, spreadSheetView1)

# trace defaults for the display properties.
rotated_ecg_coordscsvDisplay.FieldAssociation = 'Row Data'

# find source
warpByVector1 = FindSource('WarpByVector1')

# find source
calculator1 = FindSource('Calculator1')

# find source
threshold1 = FindSource('Threshold1')

# find source
gradientOfUnstructuredDataSet1 = FindSource('GradientOfUnstructuredDataSet1')

# update the view to ensure updated data information
spreadSheetView1.Update()

# get color transfer function/color map for 'INTRA'
iNTRALUT = GetColorTransferFunction('INTRA')

# Rescale transfer function
iNTRALUT.RescaleTransferFunction(-89.2540054321, -87.9857635498)

# get opacity transfer function/opacity map for 'INTRA'
iNTRAPWF = GetOpacityTransferFunction('INTRA')

# Rescale transfer function
iNTRAPWF.RescaleTransferFunction(-89.2540054321, -87.9857635498)

# create a new 'Table To Points'
tableToPoints1 = TableToPoints(Input=rotated_ecg_coordscsv)
tableToPoints1.XColumn = 'Points:0'
tableToPoints1.YColumn = 'Points:1'
tableToPoints1.ZColumn = 'Points:2'

# show data in view
tableToPoints1Display = Show(tableToPoints1, spreadSheetView1)

# hide data in view
Hide(rotated_ecg_coordscsv, spreadSheetView1)

# update the view to ensure updated data information
spreadSheetView1.Update()

# find view
renderView1 = FindViewOrCreate('RenderView1', viewtype='RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [484, 904]

# set active view
SetActiveView(renderView1)

# set active source
SetActiveSource(tableToPoints1)

# show data in view
tableToPoints1Display_1 = Show(tableToPoints1, renderView1)

# trace defaults for the display properties.
tableToPoints1Display_1.Representation = 'Surface'
tableToPoints1Display_1.ColorArrayName = [None, '']
tableToPoints1Display_1.OSPRayScaleFunction = 'PiecewiseFunction'
tableToPoints1Display_1.SelectOrientationVectors = 'None'
tableToPoints1Display_1.ScaleFactor = 3.32449950583312
tableToPoints1Display_1.SelectScaleArray = 'None'
tableToPoints1Display_1.GlyphType = 'Arrow'
tableToPoints1Display_1.GlyphTableIndexArray = 'None'
tableToPoints1Display_1.GaussianRadius = 0.166224975291656
tableToPoints1Display_1.SetScaleArray = [None, '']
tableToPoints1Display_1.ScaleTransferFunction = 'PiecewiseFunction'
tableToPoints1Display_1.OpacityArray = [None, '']
tableToPoints1Display_1.OpacityTransferFunction = 'PiecewiseFunction'
tableToPoints1Display_1.DataAxesGrid = 'GridAxesRepresentation'
tableToPoints1Display_1.SelectionCellLabelFontFile = ''
tableToPoints1Display_1.SelectionPointLabelFontFile = ''
tableToPoints1Display_1.PolarAxes = 'PolarAxesRepresentation'

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
tableToPoints1Display_1.DataAxesGrid.XTitleFontFile = ''
tableToPoints1Display_1.DataAxesGrid.YTitleFontFile = ''
tableToPoints1Display_1.DataAxesGrid.ZTitleFontFile = ''
tableToPoints1Display_1.DataAxesGrid.XLabelFontFile = ''
tableToPoints1Display_1.DataAxesGrid.YLabelFontFile = ''
tableToPoints1Display_1.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
tableToPoints1Display_1.PolarAxes.PolarAxisTitleFontFile = ''
tableToPoints1Display_1.PolarAxes.PolarAxisLabelFontFile = ''
tableToPoints1Display_1.PolarAxes.LastRadialAxisTextFontFile = ''
tableToPoints1Display_1.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# Properties modified on tableToPoints1Display_1
tableToPoints1Display_1.RenderPointsAsSpheres = 1

# Properties modified on tableToPoints1Display_1
tableToPoints1Display_1.PointSize = 30.0

# set active view
SetActiveView(spreadSheetView1)

# destroy spreadSheetView1
Delete(spreadSheetView1)
del spreadSheetView1

# close an empty frame
layout1.Collapse(2)

# set active view
SetActiveView(renderView1)

# change solid color
tableToPoints1Display_1.DiffuseColor = [0.0, 0.6666666666666666, 0.0]

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-11.132728892182238, -17.810847304622328, -15.212669296748977]
renderView1.CameraFocalPoint = [1.2486250212023189, 4.730774969551652, 0.3476869088587112]
renderView1.CameraViewUp = [0.4684466619622539, -0.6615375036016979, 0.5855987160375741]
renderView1.CameraParallelScale = 7.779858310767237

################################################################################
# Create six planes, at each electrode location, to show the ECG images.
cameraNormal = np.array(GetActiveCamera().GetViewPlaneNormal())
cameraViewUp = np.array(GetActiveCamera().GetViewUp())
planes = []
planedisplays = []
textureMaptoPlanes = []
textureMaptoPlaneDisplays = []
imagexlength = 2
imageylength = 2
for i in range(0, len(ecg_coords)):
    temp = Plane()
    temp.Origin = ecg_coords[i,:]
    temp.Point2 = ecg_coords[i,:] + cameraViewUp * imageylength
    yvector = np.array(temp.Point2) - np.array(temp.Origin)
    xvector = np.cross(yvector, cameraNormal)
    xvector = xvector/np.linalg.norm(xvector)
    temp.Point1 = temp.Origin + xvector * imagexlength
    tempDisplay = Show(temp, renderView1)
    temptextureMaptoPlane = TextureMaptoPlane(Input=temp)
    temptextureMaptoPlane.Origin = temp.Origin
    temptextureMaptoPlane.Point1 = temp.Point1
    temptextureMaptoPlane.Point2 = temp.Point2
    textureMaptoPlane1Display = Show(temptextureMaptoPlane, renderView1)
    planes.append(temp)
    planedisplays.append(tempDisplay)
    textureMaptoPlanes.append(temptextureMaptoPlane)
    textureMaptoPlaneDisplays.append(textureMaptoPlane1Display)

# Plot PV plot in upper left hand corner:
pv_coords = [-12.708742745867223, 9.298708796040826, 4.836174846430484]
# pv_coords = [-11.657768843354804, -1.7166362969320577, 6.644512114782337]
imagexlength = 5
imageylength = 6
temp = Plane()
temp.Origin = pv_coords
temp.Point2 = pv_coords + cameraViewUp * imageylength
yvector = np.array(temp.Point2) - np.array(temp.Origin)
xvector = np.cross(yvector, cameraNormal)
xvector = xvector/np.linalg.norm(xvector)
temp.Point1 = temp.Origin + xvector * imagexlength
tempDisplay = Show(temp, renderView1)
temptextureMaptoPlane = TextureMaptoPlane(Input=temp)
temptextureMaptoPlane.Origin = temp.Origin
temptextureMaptoPlane.Point1 = temp.Point1
temptextureMaptoPlane.Point2 = temp.Point2
textureMaptoPlane1Display = Show(temptextureMaptoPlane, renderView1)
planes.append(temp)
planedisplays.append(tempDisplay)
textureMaptoPlanes.append(temptextureMaptoPlane)
textureMaptoPlaneDisplays.append(textureMaptoPlane1Display)

# Render the planes
for i in range(0, len(ecg_coords)+1):
    # trace defaults for the display properties.
    planedisplays[i].Representation = 'Surface'
    planedisplays[i].ColorArrayName = [None, '']
    planedisplays[i].OSPRayScaleArray = 'Normals'
    planedisplays[i].OSPRayScaleFunction = 'PiecewiseFunction'
    planedisplays[i].SelectOrientationVectors = 'None'
    planedisplays[i].ScaleFactor = 2.4239999771118166
    planedisplays[i].SelectScaleArray = 'None'
    planedisplays[i].GlyphType = 'Arrow'
    planedisplays[i].GlyphTableIndexArray = 'None'
    planedisplays[i].GaussianRadius = 0.12119999885559082
    planedisplays[i].SetScaleArray = ['POINTS', 'Normals']
    planedisplays[i].ScaleTransferFunction = 'PiecewiseFunction'
    planedisplays[i].OpacityArray = ['POINTS', 'Normals']
    planedisplays[i].OpacityTransferFunction = 'PiecewiseFunction'
    planedisplays[i].DataAxesGrid = 'GridAxesRepresentation'
    planedisplays[i].SelectionCellLabelFontFile = ''
    planedisplays[i].SelectionPointLabelFontFile = ''
    planedisplays[i].PolarAxes = 'PolarAxesRepresentation'

    # init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
    planedisplays[i].ScaleTransferFunction.Points = [0.5552058219909668, 0.0, 0.5, 0.0, 0.5553278923034668, 1.0, 0.5, 0.0]

    # init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
    planedisplays[i].OpacityTransferFunction.Points = [0.5552058219909668, 0.0, 0.5, 0.0, 0.5553278923034668, 1.0, 0.5, 0.0]

    # init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
    planedisplays[i].DataAxesGrid.XTitleFontFile = ''
    planedisplays[i].DataAxesGrid.YTitleFontFile = ''
    planedisplays[i].DataAxesGrid.ZTitleFontFile = ''
    planedisplays[i].DataAxesGrid.XLabelFontFile = ''
    planedisplays[i].DataAxesGrid.YLabelFontFile = ''
    planedisplays[i].DataAxesGrid.ZLabelFontFile = ''

    # init the 'PolarAxesRepresentation' selected for 'PolarAxes'
    planedisplays[i].PolarAxes.PolarAxisTitleFontFile = ''
    planedisplays[i].PolarAxes.PolarAxisLabelFontFile = ''
    planedisplays[i].PolarAxes.LastRadialAxisTextFontFile = ''
    planedisplays[i].PolarAxes.SecondaryRadialAxesTextFontFile = ''

    # trace defaults for the display properties.
    textureMaptoPlaneDisplays[i].Representation = 'Surface'
    textureMaptoPlaneDisplays[i].ColorArrayName = [None, '']
    textureMaptoPlaneDisplays[i].OSPRayScaleArray = 'Normals'
    textureMaptoPlaneDisplays[i].OSPRayScaleFunction = 'PiecewiseFunction'
    textureMaptoPlaneDisplays[i].SelectOrientationVectors = 'None'
    textureMaptoPlaneDisplays[i].ScaleFactor = 0.1
    textureMaptoPlaneDisplays[i].SelectScaleArray = 'None'
    textureMaptoPlaneDisplays[i].GlyphType = 'Arrow'
    textureMaptoPlaneDisplays[i].GlyphTableIndexArray = 'None'
    textureMaptoPlaneDisplays[i].GaussianRadius = 0.005
    textureMaptoPlaneDisplays[i].SetScaleArray = ['POINTS', 'Normals']
    textureMaptoPlaneDisplays[i].ScaleTransferFunction = 'PiecewiseFunction'
    textureMaptoPlaneDisplays[i].OpacityArray = ['POINTS', 'Normals']
    textureMaptoPlaneDisplays[i].OpacityTransferFunction = 'PiecewiseFunction'
    textureMaptoPlaneDisplays[i].DataAxesGrid = 'GridAxesRepresentation'
    textureMaptoPlaneDisplays[i].SelectionCellLabelFontFile = ''
    textureMaptoPlaneDisplays[i].SelectionPointLabelFontFile = ''
    textureMaptoPlaneDisplays[i].PolarAxes = 'PolarAxesRepresentation'

    # init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
    textureMaptoPlaneDisplays[i].ScaleTransferFunction.Points = [0.0, 0.0, 0.5, 0.0, 1.1757813367477812e-38, 1.0, 0.5, 0.0]

    # init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
    textureMaptoPlaneDisplays[i].OpacityTransferFunction.Points = [0.0, 0.0, 0.5, 0.0, 1.1757813367477812e-38, 1.0, 0.5, 0.0]

    # init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
    textureMaptoPlaneDisplays[i].DataAxesGrid.XTitleFontFile = ''
    textureMaptoPlaneDisplays[i].DataAxesGrid.YTitleFontFile = ''
    textureMaptoPlaneDisplays[i].DataAxesGrid.ZTitleFontFile = ''
    textureMaptoPlaneDisplays[i].DataAxesGrid.XLabelFontFile = ''
    textureMaptoPlaneDisplays[i].DataAxesGrid.YLabelFontFile = ''
    textureMaptoPlaneDisplays[i].DataAxesGrid.ZLabelFontFile = ''

    # init the 'PolarAxesRepresentation' selected for 'PolarAxes'
    textureMaptoPlaneDisplays[i].PolarAxes.PolarAxisTitleFontFile = ''
    textureMaptoPlaneDisplays[i].PolarAxes.PolarAxisLabelFontFile = ''
    textureMaptoPlaneDisplays[i].PolarAxes.LastRadialAxisTextFontFile = ''
    textureMaptoPlaneDisplays[i].PolarAxes.SecondaryRadialAxesTextFontFile = ''


# ################################################################################
# Get timestep values
timestepvalues = heart_remeshed_3Densicase.TimestepValues
view = GetActiveView()

for i in range(0, len(timestepvalues)):
    print('Rendering time '+str(timestepvalues[i]))
    # Update time step in render:
    view.ViewTime = timestepvalues[i]
    Render()

    # Update ECG in each electrode
    for k in range(0, 6):
        lead_name = 'V'+str(k+1)
        lead_idx = k
        texture = servermanager.rendering.ImageTexture()
        texture.FileName = lead_name+'_'+str(i+1)+'.png'
        textureMaptoPlaneDisplays[lead_idx].Texture = texture
        Render()
        # show color bar/color legend
    # Update PV
    texture = servermanager.rendering.ImageTexture()
    texture.FileName = 'pv_'+str(i+1)+'.png'
    textureMaptoPlaneDisplays[6].Texture = texture
    Render()
    warpByVector1Display.SetScalarBarVisibility(renderView1, False)
    idx = str(i).zfill(3)
    SaveScreenshot('/Users/Jenny/Documents/Codes/Alya/Simulations/Xins_paper_simulations/DTI003/75%_transmural_scar_tuned/acute/bz1/ensight/ECG_intra_deformation_movie/image_'+idx+'.png', renderView1, ImageResolution=[1666, 904])
