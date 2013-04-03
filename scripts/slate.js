var grid_size = 8;
var left_fill_size = 3;
var modal_key = ":s,ctrl";
var screenSizeX = slate.screen().visibleRect().width;
var screenSizeY = slate.screen().visibleRect().height;
var ascript = "/usr/bin/osascript ";
var apple_dir = "/Users/andyjoslin/scripts";

var quit_chrome = ascript + apple_dir + "quit_chrome.as";
var change_iterm = ascript + apple_dir + "change_iterm.scpt";
var open_inspector = ascript + apple_dir + "open_inspector.as";
var switch_dark = ascript + apple_dir + "switch_dark.scpt";
var switch_light = ascript + apple_dir + "switch_light.scpt";
var light_state = false;
var left_fill = slate.operation('corner', {
  direction: 'top-left',
  width: (screenSizeX * left_fill_size) / grid_size,
  height: screenSizeY
});
var right_fill = slate.operation('corner', {
  direction: 'top-right',
  width: (screenSizeX * (grid_size - left_fill_size)) / grid_size,
  height: screenSizeY
});
var hide_app = slate.operation('hide', { });
var show_app = slate.operation('show', { });
slate.configAll({
  keyboardLayout: 'dvorak'
});
var app_dev_layout = slate.layout('app_dev', {
  'iTerm': {
    operations: [left_fill]
  },
  'Google Chrome': {
    operations: [right_fill]
  }
});
var app_dev = slate.operation('layout', { name: app_dev_layout });
slate.bind('t' + modal_key, function(win) {
  var iterm_open = false,
      chrome_open = false;
  slate.eachApp(function(app) {
    var name = app.name();
    var hide = slate.operation('hide', {
      app: [name]
    });
    var show = slate.operation('show', {
      app: [name]
    });
    if (name === "iTerm") {
      iterm_open = true;
      win.doOperation(show);
    } else if (name === "Google Chrome") {
      slate.shell(quit_chrome,true);
    } else {
      win.doOperation(hide);
    }
  });
  if (!iterm_open) {
    slate.shell('/usr/bin/open -a iTerm', 
                true);
  }
  slate.shell(change_iterm, true);
  slate.shell(change_iterm, true);
  if (!chrome_open) {
    slate.shell('/usr/bin/open -a "Chrome" --args --disable-web-security localhost:3000', 
                true);
    slate.shell(open_inspector, true);
  }
  app_dev.run();
});
slate.bind('h' + modal_key, slate.operation('focus',{ direction:'left' }));
slate.bind('l' + modal_key, slate.operation('focus',{ direction:'right' }));
slate.bind('k' + modal_key, slate.operation('focus',{ direction:'up' }));
slate.bind('j' + modal_key, slate.operation('focus',{ direction:'down' }));
slate.bind('n' + modal_key, slate.operation('focus',{ direction:'behind' }));
slate.bind('-' + modal_key, function() { 
  if (light_state) {
    slate.shell(switch_dark, false);
  } else {
    slate.shell(switch_light, false); 
  }
  light_state = !light_state;
},false);
