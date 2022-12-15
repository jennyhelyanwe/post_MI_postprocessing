# trace generated using paraview version 5.5.1
# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [1830, 910]

# Hide orientation axes
renderView1.OrientationAxesVisibility = 0

# Properties modified on renderView1
renderView1.Background = [1.0, 0.9999694819562066, 0.9999847409781033]

# create a new 'EnSight Reader'
heart_remeshed_3D_strainsensicase = EnSightReader(CaseFileName='/Users/Jenny/Documents/Codes/Alya/Simulations/Xins_paper_simulations/DTI003/control_ikcaon_800CL_tuned/ensight/displacement_local_strains/heart_remeshed_3D_strains.ensi.case')
heart_remeshed_3D_strainsensicase.PointArrays = ['EPSRA', 'DISPL']

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# show data in view
heart_remeshed_3D_strainsensicaseDisplay = Show(heart_remeshed_3D_strainsensicase, renderView1)

# get color transfer function/color map for 'EPSRA'
ePSRALUT = GetColorTransferFunction('EPSRA')

# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
ePSRALUT.ApplyPreset('Cool to Warm', True)

# Properties modified on ePSRALUT
ePSRALUT.RGBPoints = [-0.3, 0.23137254902, 0.298039215686, 0.752941176471, 0.0, 0.865, 0.865, 0.865, 0.7, 0.705882352941, 0.0156862745098, 0.149019607843]

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

# Properties modified on slice1Display.DataAxesGrid
slice1Display.DataAxesGrid.Position = [0.0, 0.0, 0.01]

# Properties modified on slice1Display.PolarAxes
slice1Display.PolarAxes.Translation = [0.0, 0.0, 0.01]

# hide data in view
Hide(warpByVector1, renderView1)

# show color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, True)
rep = GetDisplayProperties(slice1)
rep.DiffuseColor = [0,0,0]
Render()
# update the view to ensure updated data information
renderView1.Update()

# create a new 'EnSight Reader'
heart_remeshed_3D_strainsensicase_1 = EnSightReader(CaseFileName='heart_remeshed_3D_strains.ensi.case')
heart_remeshed_3D_strainsensicase_1.PointArrays = ['EPSRA', 'DISPL']

# show data in view
heart_remeshed_3D_strainsensicase_1Display = Show(heart_remeshed_3D_strainsensicase_1, renderView1)

# trace defaults for the display properties.
heart_remeshed_3D_strainsensicase_1Display.Representation = 'Surface'
heart_remeshed_3D_strainsensicase_1Display.ColorArrayName = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicase_1Display.LookupTable = ePSRALUT
heart_remeshed_3D_strainsensicase_1Display.OSPRayScaleArray = 'EPSRA'
heart_remeshed_3D_strainsensicase_1Display.OSPRayScaleFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicase_1Display.SelectOrientationVectors = 'DISPL'
heart_remeshed_3D_strainsensicase_1Display.ScaleFactor = 1.1134918212890625
heart_remeshed_3D_strainsensicase_1Display.SelectScaleArray = 'EPSRA'
heart_remeshed_3D_strainsensicase_1Display.GlyphType = 'Arrow'
heart_remeshed_3D_strainsensicase_1Display.GlyphTableIndexArray = 'EPSRA'
heart_remeshed_3D_strainsensicase_1Display.GaussianRadius = 0.055674591064453126
heart_remeshed_3D_strainsensicase_1Display.SetScaleArray = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicase_1Display.ScaleTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicase_1Display.OpacityArray = ['POINTS', 'EPSRA']
heart_remeshed_3D_strainsensicase_1Display.OpacityTransferFunction = 'PiecewiseFunction'
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid = 'GridAxesRepresentation'
heart_remeshed_3D_strainsensicase_1Display.SelectionCellLabelFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.SelectionPointLabelFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.PolarAxes = 'PolarAxesRepresentation'
heart_remeshed_3D_strainsensicase_1Display.ScalarOpacityFunction = ePSRAPWF
heart_remeshed_3D_strainsensicase_1Display.ScalarOpacityUnitDistance = 0.15441996066771663

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
heart_remeshed_3D_strainsensicase_1Display.ScaleTransferFunction.Points = [-0.21605372428894043, 0.0, 0.5, 0.0, 0.3127574026584625, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
heart_remeshed_3D_strainsensicase_1Display.OpacityTransferFunction.Points = [-0.21605372428894043, 0.0, 0.5, 0.0, 0.3127574026584625, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.XTitleFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.YTitleFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.ZTitleFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.XLabelFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.YLabelFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
heart_remeshed_3D_strainsensicase_1Display.PolarAxes.PolarAxisTitleFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.PolarAxes.PolarAxisLabelFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.PolarAxes.LastRadialAxisTextFontFile = ''
heart_remeshed_3D_strainsensicase_1Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# show color bar/color legend
heart_remeshed_3D_strainsensicase_1Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Warp By Vector'
warpByVector2 = WarpByVector(Input=heart_remeshed_3D_strainsensicase_1)
warpByVector2.Vectors = ['POINTS', 'DISPL']

# show data in view
warpByVector2Display = Show(warpByVector2, renderView1)

# trace defaults for the display properties.
warpByVector2Display.Representation = 'Surface'
warpByVector2Display.ColorArrayName = ['POINTS', 'EPSRA']
warpByVector2Display.LookupTable = ePSRALUT
warpByVector2Display.OSPRayScaleArray = 'EPSRA'
warpByVector2Display.OSPRayScaleFunction = 'PiecewiseFunction'
warpByVector2Display.SelectOrientationVectors = 'DISPL'
warpByVector2Display.ScaleFactor = 1.1168975830078125
warpByVector2Display.SelectScaleArray = 'EPSRA'
warpByVector2Display.GlyphType = 'Arrow'
warpByVector2Display.GlyphTableIndexArray = 'EPSRA'
warpByVector2Display.GaussianRadius = 0.055844879150390624
warpByVector2Display.SetScaleArray = ['POINTS', 'EPSRA']
warpByVector2Display.ScaleTransferFunction = 'PiecewiseFunction'
warpByVector2Display.OpacityArray = ['POINTS', 'EPSRA']
warpByVector2Display.OpacityTransferFunction = 'PiecewiseFunction'
warpByVector2Display.DataAxesGrid = 'GridAxesRepresentation'
warpByVector2Display.SelectionCellLabelFontFile = ''
warpByVector2Display.SelectionPointLabelFontFile = ''
warpByVector2Display.PolarAxes = 'PolarAxesRepresentation'
warpByVector2Display.ScalarOpacityFunction = ePSRAPWF
warpByVector2Display.ScalarOpacityUnitDistance = 0.15444338474337396

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
warpByVector2Display.ScaleTransferFunction.Points = [-0.21605372428894043, 0.0, 0.5, 0.0, 0.3127574026584625, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
warpByVector2Display.OpacityTransferFunction.Points = [-0.21605372428894043, 0.0, 0.5, 0.0, 0.3127574026584625, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
warpByVector2Display.DataAxesGrid.XTitleFontFile = ''
warpByVector2Display.DataAxesGrid.YTitleFontFile = ''
warpByVector2Display.DataAxesGrid.ZTitleFontFile = ''
warpByVector2Display.DataAxesGrid.XLabelFontFile = ''
warpByVector2Display.DataAxesGrid.YLabelFontFile = ''
warpByVector2Display.DataAxesGrid.ZLabelFontFile = ''

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
warpByVector2Display.PolarAxes.PolarAxisTitleFontFile = ''
warpByVector2Display.PolarAxes.PolarAxisLabelFontFile = ''
warpByVector2Display.PolarAxes.LastRadialAxisTextFontFile = ''
warpByVector2Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# hide data in view
Hide(heart_remeshed_3D_strainsensicase_1, renderView1)

# show color bar/color legend
warpByVector2Display.SetScalarBarVisibility(renderView1, True)

# update the view to ensure updated data information
renderView1.Update()

# create a new 'Slice'
slice2 = Slice(Input=warpByVector2)
slice2.SliceType = 'Plane'
slice2.SliceOffsetValues = [0.0]

# init the 'Plane' selected for 'SliceType'
slice2.SliceType.Origin = [-1.7086710929870605, -0.671889066696167, -3.3511401709984057]

# Properties modified on slice2.SliceType
slice2.SliceType.Origin = [0.0, 0.0, -2.0]
slice2.SliceType.Normal = [0.0, 0.0, 1.0]

# Properties modified on slice2.SliceType
slice2.SliceType.Origin = [0.0, 0.0, -2.0]
slice2.SliceType.Normal = [0.0, 0.0, 1.0]

# show data in view
slice2Display = Show(slice2, renderView1)

# trace defaults for the display properties.
slice2Display.Representation = 'Surface'
slice2Display.ColorArrayName = ['POINTS', 'EPSRA']
slice2Display.LookupTable = ePSRALUT
slice2Display.OSPRayScaleArray = 'EPSRA'
slice2Display.OSPRayScaleFunction = 'PiecewiseFunction'
slice2Display.SelectOrientationVectors = 'DISPL'
slice2Display.ScaleFactor = 1.026584005355835
slice2Display.SelectScaleArray = 'EPSRA'
slice2Display.GlyphType = 'Arrow'
slice2Display.GlyphTableIndexArray = 'EPSRA'
slice2Display.GaussianRadius = 0.05132920026779175
slice2Display.SetScaleArray = ['POINTS', 'EPSRA']
slice2Display.ScaleTransferFunction = 'PiecewiseFunction'
slice2Display.OpacityArray = ['POINTS', 'EPSRA']
slice2Display.OpacityTransferFunction = 'PiecewiseFunction'
slice2Display.DataAxesGrid = 'GridAxesRepresentation'
slice2Display.SelectionCellLabelFontFile = ''
slice2Display.SelectionPointLabelFontFile = ''
slice2Display.PolarAxes = 'PolarAxesRepresentation'

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
slice2Display.ScaleTransferFunction.Points = [-0.1611955463886261, 0.0, 0.5, 0.0, 0.18284562230110168, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
slice2Display.OpacityTransferFunction.Points = [-0.1611955463886261, 0.0, 0.5, 0.0, 0.18284562230110168, 1.0, 0.5, 0.0]

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

# hide data in view
Hide(warpByVector2, renderView1)

# show color bar/color legend
slice2Display.SetScalarBarVisibility(renderView1, False)

# update the view to ensure updated data information
renderView1.Update()

# set active source
SetActiveSource(slice1)

# Hide the scalar bar for this color map if no visible data is colored by it.
HideScalarBarIfNotNeeded(ePSRALUT, renderView1)

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=slice1.SliceType)

# change solid color
slice1Display.DiffuseColor = [0.0, 0.0, 0.0]

# set active source
SetActiveSource(slice2)

# toggle 3D widget visibility (only when running from the GUI)
Hide3DWidgets(proxy=slice2.SliceType)

# get color legend/bar for ePSRALUT in view renderView1
ePSRALUTColorBar = GetScalarBar(ePSRALUT, renderView1)

# Rescale transfer function
ePSRAPWF.RescaleTransferFunction(-0.1, 0.6)

# Properties modified on ePSRALUT
ePSRALUT.RGBPoints = [-0.1, 0.231373, 0.298039, 0.752941, 0.0, 0.865003, 0.865003, 0.865003, 0.6, 0.705882, 0.0156863, 0.14902]


# Properties modified on ePSRALUTColorBar
ePSRALUTColorBar.TitleColor = [0.0, 0.0, 0.0]
ePSRALUTColorBar.LabelColor = [0.0, 0.0, 0.0]

# Rescale transfer function
slice2Display.ScaleTransferFunction.RescaleTransferFunction(-0.286942392588, 0.396101742983)

# Rescale transfer function
slice2Display.OpacityTransferFunction.RescaleTransferFunction(-0.286942392588, 0.396101742983)

# hide color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)
# hide color bar/color legend
slice2Display.SetScalarBarVisibility(renderView1, False)


ColorBy(slice1Display,('POINTS',''))
# current camera placement for renderView1
renderView1.CameraPosition = [-1.6487541198730469, -0.1823960542678833, -23.32469673901573]
renderView1.CameraFocalPoint = [-1.6369131506397394, -0.07582733116810864, -3.3503200861316684]
renderView1.CameraViewUp = [-4.440892098500626e-16, -1.0, 0.0]
renderView1.CameraViewAngle = 17.508196721311474
renderView1.CameraParallelScale = 5.51923764709289
Render()
# save screenshot
SaveScreenshot('short_axis_ED_radial_strain.png', renderView1, ImageResolution=[1830, 910],
    # PNG options
    CompressionLevel='0')

# Rescale transfer function
slice2Display.ScaleTransferFunction.RescaleTransferFunction(-0.225618287921, 0.660122692585)

# Rescale transfer function
slice2Display.OpacityTransferFunction.RescaleTransferFunction(-0.225618287921, 0.660122692585)


ePSRALUT.ApplyPreset('Cool to Warm', True)

# Properties modified on ePSRALUT
ePSRALUT.RGBPoints = [-0.3, 0.23137254902, 0.298039215686, 0.752941176471, 0.0, 0.865, 0.865, 0.865, 0.7, 0.705882352941, 0.0156862745098, 0.149019607843]

# Rescale transfer function
# ePSRALUT.RescaleTransferFunction(-0.3, 0.7)

# Rescale transfer function
ePSRAPWF.RescaleTransferFunction(-0.1, 0.6)

# Properties modified on ePSRALUT
ePSRALUT.RGBPoints = [-0.1, 0.231373, 0.298039, 0.752941, 0.0, 0.865003, 0.865003, 0.865003, 0.6, 0.705882, 0.0156863, 0.14902]

# hide color bar/color legend
slice1Display.SetScalarBarVisibility(renderView1, False)
ColorBy(slice1Display,('POINTS',''))
# hide color bar/color legend
slice2Display.SetScalarBarVisibility(renderView1, False)

# get display properties
slice1Display = GetDisplayProperties(slice1, view=renderView1)

# Properties modified on slice1Display
slice1Display.Position = [0.0, 0.0, 0.01]

# Properties modified on slice1Display.DataAxesGrid
slice1Display.DataAxesGrid.Position = [0.0, 0.0, 0.01]
Render()

# current camera placement for renderView1
renderView1.CameraPosition = [-1.6487541198730469, -0.1823960542678833, -23.32469673901573]
renderView1.CameraFocalPoint = [-1.6369131506397394, -0.07582733116810864, -3.3503200861316684]
renderView1.CameraViewUp = [-4.440892098500626e-16, -1.0, 0.0]
renderView1.CameraViewAngle = 17.508196721311474
renderView1.CameraParallelScale = 5.51923764709289
renderView1.ViewTime = 2.01
Render()
# save screenshot
SaveScreenshot('short_axis_ES_radial_strain.png', renderView1, ImageResolution=[1830, 910],TransparentBackground=1)

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
