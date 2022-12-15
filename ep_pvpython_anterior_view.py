# trace generated using paraview version 5.5.1

#### import the simple module from the paraview
from paraview.simple import *
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

# show data in view
heart_remeshed_3D_MAPSensicaseDisplay = Show(heart_remeshed_3D_MAPSensicase, renderView1)

# get color transfer function/color map for 'ACTIV'
aCTIVLUT = GetColorTransferFunction('ACTIV')

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

# show data in view
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
heart_remeshed_3D_MAPSensicaseDisplay.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# Properties modified on renderView1
renderView1.Background = [1.0, 0.9999694819562066, 0.9999847409781033]

# get color legend/bar for aCTIVLUT in view renderView1
aCTIVLUTColorBar = GetScalarBar(aCTIVLUT, renderView1)

# Properties modified on aCTIVLUTColorBar
aCTIVLUTColorBar.TitleColor = [0.0, 0.0, 0.0]
aCTIVLUTColorBar.LabelColor = [0.0, 0.0, 0.0]

# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
aCTIVLUT.ApplyPreset('Viridis (matplotlib)', True)

# invert the transfer function
aCTIVLUT.InvertTransferFunction()

# Properties modified on aCTIVLUT
aCTIVLUT.UseAboveRangeColor = 1

# Rescale transfer function
aCTIVLUT.RescaleTransferFunction(0.0, 0.1)

# Rescale transfer function
aCTIVPWF.RescaleTransferFunction(0.0, 0.1)

# update the view to ensure updated data information
renderView1.Update()

# current camera placement for renderView1
renderView1.CameraPosition = [-0.6724053313482523, -22.935267852652938, -14.901676431710165]
renderView1.CameraFocalPoint = [-1.932643290497403, 3.7388620744344685, -1.1013163768208816]
renderView1.CameraViewUp = [0.10380819554912385, -0.45315626001400633, 0.8853661742730818]
renderView1.CameraParallelScale = 7.779858310767237

# save screenshot
SaveScreenshot('anterior_activation_map.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0',TransparentBackground=1)

# hide color bar/color legend
heart_remeshed_3D_MAPSensicaseDisplay.SetScalarBarVisibility(renderView1, False)

# show data in view
heart_remeshed_3D_MAPSensicaseDisplay = Show(calculator2, renderView1)

# set scalar coloring
ColorBy(heart_remeshed_3D_MAPSensicaseDisplay, ('POINTS', 'RELAX'))

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(aCTIVLUT, renderView1)

# rescale color and/or opacity maps used to include current data range
heart_remeshed_3D_MAPSensicaseDisplay.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
heart_remeshed_3D_MAPSensicaseDisplay.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'RELAX'
rELAXLUT = GetColorTransferFunction('RELAX')

# Properties modified on aCTIVLUT
rELAXLUT.UseAboveRangeColor = 1

# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
rELAXLUT.ApplyPreset('Magma (matplotlib)', True)

# invert the transfer function
rELAXLUT.InvertTransferFunction()


# get color legend/bar for rELAXLUT in view renderView1
rELAXLUTColorBar = GetScalarBar(rELAXLUT, renderView1)

# Properties modified on rELAXLUTColorBar
rELAXLUTColorBar.TitleColor = [0.0, 0.0, 0.0]
rELAXLUTColorBar.LabelColor = [0.0, 0.0, 0.0]

# Rescale transfer function
rELAXLUT.RescaleTransferFunction(0.22, 0.37)

# get opacity transfer function/opacity map for 'RELAX'
rELAXPWF = GetOpacityTransferFunction('RELAX')

# Rescale transfer function
rELAXPWF.RescaleTransferFunction(0.22, 0.37)

# current camera placement for renderView1
renderView1.CameraPosition = [-0.6724053313482523, -22.935267852652938, -14.901676431710165]
renderView1.CameraFocalPoint = [-1.932643290497403, 3.7388620744344685, -1.1013163768208816]
renderView1.CameraViewUp = [0.10380819554912385, -0.45315626001400633, 0.8853661742730818]
renderView1.CameraParallelScale = 7.779858310767237

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(aCTIVLUT, renderView1)


# save screenshot
SaveScreenshot('anterior_repolarisation_map.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0',TransparentBackground=1)

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.CameraPosition = [-0.6724053313482523, -22.935267852652938, -14.901676431710165]
renderView1.CameraFocalPoint = [-1.932643290497403, 3.7388620744344685, -1.1013163768208816]
renderView1.CameraViewUp = [0.10380819554912385, -0.45315626001400633, 0.8853661742730818]
renderView1.CameraParallelScale = 7.779858310767237

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
