var apple_dir = "/Users/andyjoslin/scripts";
var switch_dark = apple_dir + "/switch_dark.scpt";
var switch_light = apple_dir + "/switch_light.scpt";
var modal_key = ":s,ctrl";

function ascript(file) {
  return slate.shell("/usr/bin/osascript " + file, false);
}


// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

var RECT = slate.screen().rect;


// Operations
var lapChat = S.op("corner", {
  "direction" : "top-left",
  "width" : "screenSizeX/9",
  "height" : "screenSizeY"
});
var full = S.op("move", {
  x: 0, y: 0,
  direction: "top-left",
  width: "screenSizeX",
  height: "screenSizeY"
});
var halfLeft = S.op("move", {
  x: 0, y: 0,
  width: "screenSizeX/2", 
  height: "screenSizeY"
});
var halfRight = halfLeft.dup({
  x: "screenSizeX/2"
});

// Batch bind everything. Less typing.
S.bnda({
  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "l:alt,cmd,shift" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
  "h:alt,cmd,shift" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
  "k:alt,cmd,shift" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
  "j:alt,cmd,shift" : S.op("resize", { "width" : "+0", "height" : "+10%" }),

  "l:ctrl,cmd,shift" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  "h:ctrl,cmd,shift" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "top-right" }),
  "k:ctrl,cmd,shift" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  "j:ctrl,cmd,shift" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "l:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "h:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "k:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "j:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),
  "m:ctrl;shift" : S.op("push", { "direction": "left", "style": "bar-resize:screenSizeX" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "l:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  "h:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  "k:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  "j:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),
  
  // Window Hints
  "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid")
});

function appIsOpen(name) {
  var isOpen = false;
  slate.eachApp(function(app) {
    if (app.name == name) isOpen = true;
  });
  return isOpen;
}

var focus_apps = {
  f: 'iTerm',
  t: 'Messages',
  x: 'Xcode',
  s: 'iOS Simulator',
  m: function() {
    if (appIsOpen("iTunes")) {
      return "iTunes";
    }
    return "Spotify";
  },
  d: function() {
    if (appIsOpen("Google Chrome Canary")) { 
      return "Google Chrome Canary";
    }
    return "Google Chrome";
  }
};

_(focus_apps).forEach(function(app, key) {
  S.bind(key + modal_key, S.op("focus", {app: app}));
});
