#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Esc::ExitApp

^q::
  SetKeyDelay, 150
  Send, import arcgis
  Sleep, 200
  SetKeyDelay, 150
  Send, +{Enter}
Return

^w::
  SetKeyDelay, 150
  Send, gis = arcgis.gis.GIS(url="https://ndirt.maps.arcgis.com", username="ANieto_ndirt")
  Sleep, 200
  SetKeyDelay, 150
  Send, +{Enter}
Return

^e::
  SetKeyDelay, 125
  Send, m = gis.map('Washington DC')
  SetKeyDelay, 50
  Send, {Enter}
  SetKeyDelay, 150
  Send, m+{Enter}
Return

^r::
  SetKeyDelay, 125
  Send, items = gis.content.sea{TAB}("Federal Buildings", item_type="feature layer")
  Sleep, 200
  Send, {Enter}
  Sleep, 100
  Send, for item in items: 
  Sleep, 100
  Send, {Enter}
  Sleep, 100
  Send, display(item)
  SetKeyDelay, 150
  Send, +{Enter}
Return  

^t::
  SetKeyDelay, 75
  Send, buildings = items[0]
  Sleep, 200
  Send, {Enter}
  Sleep, 75
  Send, m2 = gis.map("washington dc", zoomlevel=12) 
  Sleep, 100
  Send, {Enter}
  Sleep, 100
  Send, m2.basemap = "gray"
  Send, {Enter}
  Sleep, 100
  SetKeyDelay, 75
  Send, m2.add_layer(buildings)
  Send, {Enter}
  Send, m
  SetKeyDelay, 150
  Send, +{Enter}
Return

^y::
  SetKeyDelay, 75
  Send, arcgis.network.analysis.find_routes(buildings.layers[0].query(), reorder_stops_to_find_optimal_routes=True, travel_mode="Walking")
  Sleep, 100
  Send, {Home}
  Sleep, 125
  Send, architecture_tour
  Send, {Enter}
  Sleep, 100
  Send, +{Enter}
Return