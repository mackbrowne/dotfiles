var apple_dir = "/Users/andyjoslin/scripts";
var modal_key = ":s,ctrl";

// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

var RECT = slate.screen().rect;

// Batch bind everything. Less typing.
S.bnda({
  // Push Bindings
  "l:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "h:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "k:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "j:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),
  "m:ctrl;shift" : S.op("push", { "direction": "left", "style": "bar-resize:screenSizeX" }),
});

function appIsOpen(name) {
  var isOpen = false;
  slate.eachApp(function(app) {
    if (app.name == name) isOpen = true;
  });
  return isOpen;
}

// Binds modal key + {char} to focus different open apps
// ctrl-s + h = focus hipchat
// ctrl-s + f = focus iterm
// etc
var focus_apps = {
  f: 'iTerm',
  t: 'Messages',
  h: 'HipChat',
  x: 'Xcode',
  s: 'iOS Simulator',
  m: 'iTunes',
  n: 'Spotify',
  d: 'Google Chrome',
  a: 'Safari',
  r: 'Google Chrome Canary',
  v: 'DEVONthink Pro Office',
  p: 'Pandora'
};

_(focus_apps).forEach(function(app, key) {
  S.bind(key + modal_key, S.op("focus", {app: app}));
});
