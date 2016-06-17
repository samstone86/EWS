# Set device resolution
device = new Framer.DeviceView()
device.setupContext()
device.deviceType = "google-nexus-5x"
device.contentScale = 1

background = new BackgroundLayer
# end

# Inahlt
content = new Layer
  y: 160
  width: background.width
  height: background.height - 160
  backgroundColor: "rgb(226, 226, 226)"
  parent: navigation
# Inahlt end

# Navigation
navigation = new Layer
  backgroundColor: "rgb(0, 94, 255)"
  width: background.width
  height: 160
  shadowY: 7
  shadowColor: "rgba(0,0,0,0.5)"
  shadowBlur: 7
# Navigation end

# Hambuger Menu Button transparent
hamburgerbuttonT = new Layer
  x: 30
  y: 30
  width: 120
  height: 100
  backgroundColor: "rgba(255,255,255,0)"

hamburgerbuttonT.states.add
  stateRotate:
    rotation: 90
hamburgerbuttonT.states.animationOptions =
    curve: "spring(100, 10, 0)"

# Hambuger Menu Button transparent end

# Hambuger Menu Button
hamburgerbutton = new Layer
  y: 5
  width: 120
  height: 18
  backgroundColor: "white"
  borderRadius: 20
  parent: navigation

hamburgerbutton2 = hamburgerbutton.copySingle()
hamburgerbutton2.x = 0
hamburgerbutton2.y = 42
hamburgerbutton2.parent = hamburgerbutton

hamburgerbutton3 = hamburgerbutton2.copySingle()
hamburgerbutton3.x = 0
hamburgerbutton3.y = 79
hamburgerbutton3.parent = hamburgerbutton

hamburgerbuttonT.addChild(hamburgerbutton);
hamburgerbuttonT.addChild(hamburgerbutton2);
hamburgerbuttonT.addChild(hamburgerbutton3);
#Hamburger Menu Button end

# Reservierung Menü
reservierung = new Layer
  x: 0
  y: 60
  z: 90
  width: background.width
  height: background.height - 220
  backgroundColor: "rgb(245,245,150)"
  scale: 0
  opacity: 0
  parent: content
reservierung.sendToBack();
# Reservierung Menü end

# Reservierung Menü
einstellungen = new Layer
  x: 0
  y: 60
  z: 90
  width: background.width
  height: background.height - 220
  backgroundColor: "rgb(245,245,245)"
  scale: 0
  opacity: 0
  parent: content
einstellungen.sendToBack();
# Reservierung Menü end

# Hambuger Menu Shadow
hamburgershadow = new Layer
  x: 0
  y: 0
  z: 100
  width: background.width
  height: background.height - 160
  backgroundColor: "rgba(0,0,0,0.5)"
  parent: content
  opacity: 0
hamburgershadow.states.add
  stateA:
    opacity: 1
#Hamburger Menu Shadow end

# Hambuger Menu
hamburgermenu = new Layer
  x: -background.width - 200
  y: 0
  z: 100
  width: background.width - 200
  height: background.height - 160
  backgroundColor: "rgb(245,245,245)"
  image: "images/Menue.jpg"
  parent: content

hamburgermenu.states.add
  stateA:
    x: 0
hamburgermenu.states.animationOptions =
    curve: "spring(120, 37, 10)"
#Hamburger Menu end

#Button Einstellungen
einstellungenB = new Layer
  x: 100
  y: 300
  width: hamburgermenu.width - 100
  height: 160
  backgroundColor: "rgb(245,245,0)"
  parent: hamburgermenu
  color: "rgb(5,0,255)"
einstellungenB.html = "Einstellungen"
einstellungenB.style = "font-size" : "60px"
#Button Einstellungen end

einstellungenBOK = new Layer
  x: 650
  y: 1450
  width: 300
  height: 100
  backgroundColor: "rgb(245,245,0)"
  parent: einstellungen
  color: "rgb(5,0,255)"
einstellungenBOK.html = "OK"
einstellungenBOK.style = "font-size" : "60px"
#Button Einstellungen end

# Button events
hamburgerbuttonT.on Events.Click, (event) ->
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()
  map.ignoreEvents = !map.ignoreEvents
#page.ignoreEvents = !page.ignoreEvents

einstellungenB.on Events.Click, (event) ->
  einstellungen.bringToFront();
  hamburgermenu.states.next()
  hamburgershadow.states.next()
  hamburgerbuttonT.states.next()
  map.ignoreEvents = !map.ignoreEvents
#  page.ignoreEvents = !page.ignoreEvents
  einstellungen.animate
    properties:
      scale: 1
      opacity: 1
# Button events end

# Map
map=new Layer
	width: 2077
	height: 2063
	image: "images/main_map.jpg"

#setze auf untere linke ecke ???
map.x = 0
map.y = 0
map.draggable.enabled = true
# Disable overdrag
map.draggable.overdrag = false
# Disable bounce
map.draggable.bounce = false
# Disable momentum
map.draggable.momentum = false

map.draggable.constraints =
	x:-(map.width-background.width)
	y:-(map.height-background.height)-100
	width: (map.width*2)-background.width
	height: ((map.height*2)-background.height)+100

map.pinchable.maxScale = 3
map.pinchable.minScale = 1
map.pinchable.enabled = true
map.pinchable.rotate = false

map.onScaleEnd ->
	map.animate
		properties:
			scale:1

content.addChild map
# Map end

# Buttons for main map
button = []
for i in [0..7]
  button[i] = new Layer
    width: 70
    height: 70
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: map

buttonLayer = []
for j in [0..7]
  buttonLayer[j] = new Layer
    width: 60
    height: 60
    backgroundColor: "rgb(78, 78, 78)"
    borderRadius: 50
    parent: button[j]

buttonLayer1 = []
for k in [0..7]
  buttonLayer1[k] = new Layer
    width: 43
    height: 43
    backgroundColor: "rgb(122, 255, 0)"
    borderRadius: 50
    parent: buttonLayer[k]

for i in [0..7]
  buttonLayer[i].center()
  buttonLayer1[i].center()

# Z
button[0].x = 325
button[0].y = 1875
button[0].backgroundColor = "black"
buttonLayer1[0].backgroundColor = "black"
buttonLayer1[0].html = "Z"
buttonLayer1[0].color = "rgb(255, 0, 0)"
buttonLayer1[0].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# S
button[1].x = 865
button[1].y = 1705
buttonLayer1[1].html = "S"
buttonLayer1[1].color = "rgb(255, 0, 0)"
buttonLayer1[1].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# N
button[2].x = 1055
button[2].y = 1485
buttonLayer1[2].html = "N"
buttonLayer1[2].color = "rgb(255, 0, 0)"
buttonLayer1[2].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# A
button[3].x = 1105
button[3].y = 1315
buttonLayer1[3].html = "A"
buttonLayer1[3].color = "rgb(255, 0, 0)"
buttonLayer1[3].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# L
button[4].x = 1142
button[4].y = 1005
buttonLayer1[4].html = "L"
buttonLayer1[4].color = "rgb(255, 0, 0)"
buttonLayer1[4].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# T
button[5].x = 747
button[5].y = 1215
buttonLayer1[5].html = "T"
buttonLayer1[5].color = "rgb(255, 0, 0)"
buttonLayer1[5].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# F
button[6].x = 1085
button[6].y = 500
buttonLayer1[6].html = "F"
buttonLayer1[6].color = "rgb(255, 0, 0)"
buttonLayer1[6].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"
# M
button[7].x = 1775
button[7].y = 1600
buttonLayer1[7].html = "M"
buttonLayer1[7].color = "rgb(255, 0, 0)"
buttonLayer1[7].style =
  "font-size" : "35px"
  "font-weight" : "Bold"
  "text-align" : "center"

# Buttons for main map end

# arrows for navigation
arrowL = new Layer
  x: 900
  y: 1500
  width: 100
  height: 100
  backgroundColor: "rgb(122, 255, 0)"
  borderRadius: 50
  parent: content

arrowL.sendToBack()

arrowL.html = "<"
arrowL.style =
  "font-size" : "60px"
  "font-weight" : "Bold"
  "text-align" : "center"

#arrow end

## swipeable S gebäude

page = new PageComponent
    width: Screen.width
    height: Screen.height
    scrollVertical: false
    backgroundColor: "#fff"
    parent: content

for number in [0...5]
  pageContent = new Layer
      width: page.width
      height: page.height
      x: page.width * number
      backgroundColor: "rgb(149, 18, 180)"
      parent: page.content
      image: "images/S"+[number]+".jpg"
      opacity: 1

  pageContent.pinchable.maxScale = 3
  pageContent.pinchable.minScale = 1
  pageContent.pinchable.enabled = true
  pageContent.pinchable.rotate = false

  pageContent.draggable.enabled = true
  pageContent.draggable.overdrag = false
  pageContent.draggable.bounce = false
  pageContent.draggable.momentum = false

  pageContent.draggable.constraints =
  	x:-(pageContent.width-background.width)
  	y:-(pageContent.height-background.height)-100
  	width: (pageContent.width*2)-background.width
  	height: ((pageContent.height*2)-background.height)+100



  pageContent.html = pageContent.html = number + 1

  pageContent.style =
    "font-size" : "100px",
    "font-weight" : "100",
    "text-align" : "center",
    "line-height" : "#{page.height}px"

  page.sendToBack()

  # Button events
  button[1].on Events.Tap, (event) ->
      page.bringToFront()
      arrowL.bringToFront()

  # Button events end

  #arrow event
  arrowL.on Events.Tap, (event) ->
    page.sendToBack()
    arrowL.sendToBack()

  #arrow event end
