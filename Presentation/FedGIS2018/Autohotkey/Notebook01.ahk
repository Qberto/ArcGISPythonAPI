#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^q::
  SetKeyDelay, 50
  Send, jupyter notebook
  Send, +{Enter}
Return

^w::
  SetKeyDelay, 75
  Send, from arcgis.gis import GIS
  SetKeyDelay, 150
  Send, +{Enter}
  Sleep, 200
  SetKeyDelay, 75
  Send, mygis = GIS()
  SetKeyDelay, 200
  Send, +{Enter}  
  SetKeyDelay, 75
  Send, mygis.map()
  SetKeyDelay, 50
  Send, +{Enter}  
Return

^j::
  SetKeyDelay, 75
  Send, {Raw}### I changed this cell type to "Markdown". Any text entered here will not be executed as Python code.
  SetKeyDelay, 150
  Send, +{Enter}
  Sleep, 250
  SetKeyDelay, 75
  Send, {Raw}# All new cells are created as "Code" cells. This cell will execute code unless I explicitly change the cell type.
  Sleep, 250
  SetKeyDelay, 75
  Send, {Enter}print("Hello World")
  SetKeyDelay, 150
  Send, +{Enter}
Return

^u::
  SetKeyDelay, 75
  Send, from arcgis.gis import GIS
  SetKeyDelay, 150
  Send, +{Enter}
  Sleep, 200
  SetKeyDelay, 100
  Send, GIS?
  SetKeyDelay, 200
  Send, +{Enter}  
Return

^y::
  SetKeyDelay, 75
  Send, from arcgis.gis import GIS
  SetKeyDelay, 150
  Send, +{Enter}
  Sleep, 200
  SetKeyDelay, 100
  Send, GIS.{Tab}
  Sleep, 200
  SetKeyDelay, 250
  Send, {Down 3}
Return



^k::
longscript=
(
import arcpy
fcName = "C:\Project\geodatabase.gdb\myfeatureclass"
longLatFieldNames = ["longitude", "latitude"]
longLatFieldsDataType = "DOUBLE"
overwriteExistingFields = False

fieldList = arcpy.ListFields(fcName)
fieldNames = [elem.name.upper() for elem in fieldList]
if longLatFieldNames[0].upper() in fieldNames or longLatFieldNames[1].upper() in fieldNames:
if not overwriteExistingFields:
  raise Exception("ERROR: Attempted to overwrite an existing field in the Feature Class!!")
if not (longLatFieldNames[0].upper() in fieldNames):
  arcpy.AddField_management(fcName, longLatFieldNames[0], field_type=longLatFieldsDataType)
  calcLongFieldAddedInMethod = True
if not (longLatFieldNames[1].upper() in fieldNames):
  arcpy.AddField_management(fcName, longLatFieldNames[1], field_type=longLatFieldsDataType)
  calcLatFieldAddedInMethod = True
srObj = arcpy.Describe(fcName).spatialReference.GCS
try:
  with arcpy.da.UpdateCursor(fcName, ["SHAPE@XY", longLatFieldNames[0], longLatFieldNames[1]], "", srObj) as cursor:
    for row in cursor:
      if row[0][0]:
        row[1] = row[0][0]
      if row[0][1]:
        row[2] = row[0][1]
        cursor.updateRow(row)
except Exception as ex:
  if calcLongFieldAddedInMethod:
    arcpy.DeleteField_management(fcName, longLatFieldNames[0])
  if calcLatFieldAddedInMethod:
    arcpy.DeleteField_management(fcName, longLatFieldNames[1])
  raise Exception("ERROR: " + str(ex))
)
SetKeyDelay, 5
  Send, %longscript%
Return

^l::
SetKeyDelay, 50
  Send, import os +{Enter}
Sleep, 250
SetKeyDelay, 50
  Send, os.chdir("C:\Temp") +{Enter}
Return

^o::
SetKeyDelay, 50
  Send, import os
Return

^p::
SetKeyDelay, 50
  Send, os.chdir("C:\Temp")
Return

^g::
SetKeyDelay, 50
  Send, conda install -c esri arcgis
Return