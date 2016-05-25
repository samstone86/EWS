var arrowL, arrowR, background, buttonN, buttonN2, buttonN3, buttonS, buttonS2, buttonS3, buttonZ, buttonZ2, buttonZ3, content, device, map, navigation;

device = new Framer.DeviceView();

device.setupContext();

device.deviceType = "google-nexus-5x";

device.contentScale = 1;

background = new BackgroundLayer({
  backgroundColor: "red"
});

content = new Layer({
  y: 160,
  backgroundColor: "rgb(0, 94, 100)",
  width: background.width,
  height: background.height - 160
});

navigation = new Layer({
  backgroundColor: "rgb(0, 94, 255)",
  width: background.width,
  height: 160
});

map = new Layer({
  width: 1700,
  height: 4550,
  image: "images/s0-superior.png"
});

map.x = 0;

map.y = 0;

map.draggable.enabled = true;

map.draggable.constraints = {
  x: -(map.width - background.width),
  y: -(map.height - background.height),
  width: (map.width * 2) - background.width,
  height: (map.height * 2) - background.height
};

map.pinchable.maxScale = 3;

map.pinchable.enabled = true;

map.pinchable.rotate = false;

map.onScaleEnd(function() {
  return map.animate({
    properties: {
      scale: 1
    }
  });
});

content.addChild(map);

buttonZ = new Layer({
  x: 325,
  y: 1875,
  width: 70,
  height: 70,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: map
});

buttonZ2 = new Layer({
  width: 60,
  height: 60,
  backgroundColor: "rgb(255, 255, 255)",
  borderRadius: 50,
  parent: buttonZ
});

buttonZ2.center();

buttonZ3 = new Layer({
  width: 40,
  height: 40,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: buttonZ2
});

buttonZ3.center();

buttonS = new Layer({
  x: 865,
  y: 1705,
  width: 70,
  height: 70,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: map
});

buttonS2 = new Layer({
  width: 60,
  height: 60,
  backgroundColor: "rgb(255, 255, 255)",
  borderRadius: 50,
  parent: buttonS
});

buttonS2.center();

buttonS3 = new Layer({
  width: 40,
  height: 40,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: buttonS2
});

buttonS3.center();

buttonN = new Layer({
  x: 865,
  y: 1705,
  width: 70,
  height: 70,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: map
});

buttonN2 = new Layer({
  width: 60,
  height: 60,
  backgroundColor: "rgb(255, 255, 255)",
  borderRadius: 50,
  parent: buttonN
});

buttonN2.center();

buttonN3 = new Layer({
  width: 40,
  height: 40,
  backgroundColor: "rgb(0, 255, 10)",
  borderRadius: 50,
  parent: buttonN2
});

buttonN3.center();

arrowL = new Layer({
  x: 100,
  y: 1500,
  z: -1000,
  width: 100,
  height: 100,
  backgroundColor: "rgb(0, 0, 0)",
  borderRadius: 50
});

arrowR = new Layer({
  x: 1600,
  y: 1500,
  z: -1000,
  width: 100,
  height: 100,
  backgroundColor: "rgb(0, 0, 0)",
  borderRadius: 50
}, arrowR.on(Events.Tap, function(event) {
  return print("you got me");
}), arrowL.on(Events.Tap, function(event) {
  return print("you got me");
}));
