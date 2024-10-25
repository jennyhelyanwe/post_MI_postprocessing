# trace generated using paraview version 5.5.1

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'EnSight Reader'
heart_remeshed_3D_strainsensicase = EnSightReader(CaseFileName='heart_remeshed_3D_strains.ensi.case')
heart_remeshed_3D_strainsensicase.PointArrays = ['EPSRA', 'DISPL']

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1830, 910]

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# show data in view
heart_remeshed_3D_strainsensicaseDisplay = Show(heart_remeshed_3D_strainsensicase, renderView1)

# get color transfer function/color map for 'EPSRA'
ePSRALUT = GetColorTransferFunction('EPSRA')

# get opacity transfer function/opacity map for 'EPSRA'
ePSRAPWF = GetOpacityTransferFunction('EPSRA')

# trace defaults for the display properties.
heart_remeshed_3D_strainsensicaseDisplay.Representation = 'Surface'
heart_remeshed_3D_strainsensicaseDisplay.ColorArrayName = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicaseDisplay.LookupTable = ePSRALUT
heart_remeshed_3D_strainsensicaseDisplay.OSPRayScaleArray = 'EPSRA'
heart_remeshed_3D_strainsensicaseDisplay.OSPRayScaleFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicaseDisplay.SelectOrientationVectors = 'DISPL'
heart_remeshed_3D_strainsensicaseDisplay.ScaleFactor = 1.1134918212890625
heart_remeshed_3D_strainsensicaseDisplay.SelectScaleArray = 'EPSRA'
heart_remeshed_3D_strainsensicaseDisplay.GlyphType = 'Arrow'
heart_remeshed_3D_strainsensicaseDisplay.GlyphTableIndexArray = 'EPSRA'
heart_remeshed_3D_strainsensicaseDisplay.GaussianRadius = 0.055674591064453126
heart_remeshed_3D_strainsensicaseDisplay.SetScaleArray = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicaseDisplay.ScaleTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicaseDisplay.OpacityArray = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicaseDisplay.OpacityTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid = 'GridAxesRepresentation'
heart_remeshed_3D_strainsensicaseDisplay.SelectionCellLabelFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.SelectionPointLabelFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.PolarAxes = 'PolarAxesRepresentation'
heart_remeshed_3D_strainsensicaseDisplay.ScalarOpacityFunction = ePSRAPWF
heart_remeshed_3D_strainsensicaseDisplay.ScalarOpacityUnitDistance = 0.15441996066771663

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
heart_remeshed_3D_strainsensicaseDisplay.ScaleTransferFunction.Points = [-0.21723026037216187, 0.0, 0.5, 0.0, 0.31652435660362244, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
heart_remeshed_3D_strainsensicaseDisplay.OpacityTransferFunction.Points = [-0.21723026037216187, 0.0, 0.5, 0.0, 0.31652435660362244, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.XTitleFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.YTitleFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.ZTitleFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.XLabelFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.YLabelFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
heart_remeshed_3D_strainsensicaseDisplay.PolarAxes.PolarAxisTitleFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.PolarAxes.PolarAxisLabelFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.PolarAxes.LastRadialAxisTextFontFile = ''
heart_remeshed_3D_strainsensicaseDisplay.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# reset view to fit data
renderView1.ResetCamera()

# show color bar/color legend
heart_remeshed_3D_strainsensicaseDisplay.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# Properties modified on renderView1
renderView1.Background = [1.0, 0.9999694819562066, 0.9999847409781033]

# create a new 'Warp By Vector'
warpByVector1 = WarpByVector(Input=heart_remeshed_3D_strainsensicase)
warpByVector1.Vectors = ['POINTS', 'DISPL']

# show data in view
warpByVector1Display = Show(warpByVector1, renderView1)

# trace defaults for the display properties.
warpByVector1Display.Representation = 'Surface'
warpByVector1Display.ColorArrayName = ['POINTS', 'EPSRA']
warpByVector1Display.LookupTable = ePSRALUT
warpByVector1Display.OSPRayScaleArray = 'EPSRA'
warpByVector1Display.OSPRayScaleFunction = 'PiecewiseFunction'
warpByVector1Display.SelectOrientationVectors = 'DISPL'
warpByVector1Display.ScaleFactor = 1.1167522430419923
warpByVector1Display.SelectScaleArray = 'EPSRA'
warpByVector1Display.GlyphType = 'Arrow'
warpByVector1Display.GlyphTableIndexArray = 'EPSRA'
warpByVector1Display.GaussianRadius = 0.05583761215209961
warpByVector1Display.SetScaleArray = ['POINTS', 'EPSRA']
warpByVector1Display.ScaleTransferFunction = 'PiecewiseFunction'
warpByVector1Display.OpacityArray = ['POINTS', 'EPSRA']
warpByVector1Display.OpacityTransferFunction = 'PiecewiseFunction'
warpByVector1Display.DataAxesGrid = 'GridAxesRepresentation'
warpByVector1Display.SelectionCellLabelFontFile = ''
warpByVector1Display.SelectionPointLabelFontFile = ''
warpByVector1Display.PolarAxes = 'PolarAxesRepresentation'
warpByVector1Display.ScalarOpacityFunction = ePSRAPWF
warpByVector1Display.ScalarOpacityUnitDistance = 0.1545062623972722

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
warpByVector1Display.ScaleTransferFunction.Points = [-0.21723026037216187, 0.0, 0.5, 0.0, 0.31652435660362244, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
warpByVector1Display.OpacityTransferFunction.Points = [-0.21723026037216187, 0.0, 0.5, 0.0, 0.31652435660362244, 1.0, 0.5, 0.0]

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
Hide(heart_remeshed_3D_strainsensicase, renderView1)

# show color bar/color legend
warpByVector1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Slice'
slice1 = Slice(Input=warpByVector1)
slice1.SliceType = 'Plane'
slice1.SliceOffsetValues = [0.0]

# init the 'Plane' selected for 'SliceType'
slice1.SliceType.Origin = [-1.7091789245605469, -0.6701450347900391, -3.3574847278068773]

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
slice1Display.ColorArrayName = ['POINTS', 'EPSRA']
slice1Display.LookupTable = ePSRALUT
slice1Display.OSPRayScaleArray = 'EPSRA'
slice1Display.OSPRayScaleFunction = 'PiecewiseFunction'
slice1Display.SelectOrientationVectors = 'DISPL'
slice1Display.ScaleFactor = 1.0262032508850099
slice1Display.SelectScaleArray = 'EPSRA'
slice1Display.GlyphType = 'Arrow'
slice1Display.GlyphTableIndexArray = 'EPSRA'
slice1Display.GaussianRadius = 0.05131016254425049
slice1Display.SetScaleArray = ['POINTS', 'EPSRA']
slice1Display.ScaleTransferFunction = 'PiecewiseFunction'
slice1Display.OpacityArray = ['POINTS', 'EPSRA']
slice1Display.OpacityTransferFunction = 'PiecewiseFunction'
slice1Display.DataAxesGrid = 'GridAxesRepresentation'
slice1Display.SelectionCellLabelFontFile = ''
slice1Display.SelectionPointLabelFontFile = ''
slice1Display.PolarAxes = 'PolarAxesRepresentation'

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
slice1Display.ScaleTransferFunction.Points = [-0.16682060062885284, 0.0, 0.5, 0.0, 0.18161892890930176, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
slice1Display.OpacityTransferFunction.Points = [-0.16682060062885284, 0.0, 0.5, 0.0, 0.18161892890930176, 1.0, 0.5, 0.0]

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

# hide data in view
Hide(warpByVector1, renderView1)

# show color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=slice1.SliceType)

# reset view to fit data
renderView1.ResetCamera()

# Rescale transfer function
slice1Display.ScaleTransferFunction.RescaleTransferFunction(-0.287009716034, 0.380211412907)

# Rescale transfer function
slice1Display.OpacityTransferFunction.RescaleTransferFunction(-0.287009716034, 0.380211412907)

# hide color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)


# Rescale transfer function
ePSRAPWF.RescaleTransferFunction(-0.1, 0.6)

# Properties modified on ePSRALUT
ePSRALUT.RGBPoints = [-0.1, 0.231373, 0.298039, 0.752941, 0.0, 0.865003, 0.865003, 0.865003, 0.6, 0.705882, 0.0156863, 0.14902]

# get color legend/bar for ePSRALUT in view renderView1
ePSRALUTColorBar = GetScalarBar(ePSRALUT, renderView1)

# Properties modified on ePSRALUTColorBar
ePSRALUTColorBar.TitleColor = [0.0, 0.0, 0.0]
ePSRALUTColorBar.LabelColor = [0.0, 0.0, 0.0]

# hide color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)

# current camera placement for renderView1
renderView1.CameraPosition = [-1.6487541198730469, -0.1823960542678833, -23.32469673901573]
renderView1.CameraFocalPoint = [-1.6369131506397394, -0.07582733116810864, -3.3503200861316684]
renderView1.CameraViewUp = [-4.440892098500626e-16, -1.0, 0.0]
renderView1.CameraViewAngle = 17.508196721311474
renderView1.CameraParallelScale = 5.51923764709289
renderView1.ViewTime = 1.71
Render()
# save screenshot
SaveScreenshot('short_axis_ED_radial_strain.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0')

# Rescale transfer function
slice1Display.ScaleTransferFunction.RescaleTransferFunction(-0.227880686522, 0.659998416901)

# Rescale transfer function
slice1Display.OpacityTransferFunction.RescaleTransferFunction(-0.227880686522, 0.659998416901)
# hide color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)


# current camera placement for renderView1
renderView1.CameraPosition = [-1.6487541198730469, -0.1823960542678833, -23.32469673901573]
renderView1.CameraFocalPoint = [-1.6369131506397394, -0.07582733116810864, -3.3503200861316684]
renderView1.CameraViewUp = [-4.440892098500626e-16, -1.0, 0.0]
renderView1.CameraViewAngle = 17.508196721311474
renderView1.CameraParallelScale = 5.51923764709289
renderView1.ViewTime = 2.01
Render()
# save screenshot
SaveScreenshot('short_axis_ES_radial_strain.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0',TransparentBackground=1)

#### saving camera placements for all active views
# current camera placement for renderView1
renderView1.CameraPosition = [-1.6487541198730469, -0.1823960542678833, -23.32469673901573]
renderView1.CameraFocalPoint = [-1.6369131506397394, -0.07582733116810864, -3.3503200861316684]
renderView1.CameraViewUp = [-4.440892098500626e-16, -1.0, 0.0]
renderView1.CameraViewAngle = 17.508196721311474
renderView1.CameraParallelScale = 5.51923764709289

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).
