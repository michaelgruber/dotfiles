var isFullscreen = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();
    if (winRect.width === screen.width &&
        winRect.height === screen.height
    ) {
        return true;
    }
    return false;
};

var isPushedRight = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x + screen.width / 2 &&
        winRect.y === screen.y &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height
    ) {
        return true;
    }
    return false;
};

var isPushedLeft = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x &&
        winRect.y === screen.y &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height
    ) {
        return true;
    }
    return false;
};

var isTopRightCornered = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x + (screen.width / 2) &&
        winRect.y === screen.y &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height / 2
    ) {
        return true;
    }
    return false;
}

var isBottomRightCornered = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x + (screen.width / 2) &&
        winRect.y === screen.y + (screen.height / 2) &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height / 2
    ) {
        return true;
    }
    return false;
}

var isBottomLeftCornered = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x &&
        winRect.y === screen.y + (screen.height / 2) &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height / 2
    ) {
        return true;
    }
    return false;
}

var isTopLeftCornered = function (win) {
    if (!win) {
        return false;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    if (winRect.x === screen.x &&
        winRect.y === screen.y &&
        winRect.width === screen.width / 2 &&
        winRect.height === screen.height / 2
    ) {
        return true;
    }
    return false;
}

var throwNext = function (win) {
    if (!win) {
        return;
    }
    var winRect = win.rect();
    var screen = win.screen().visibleRect();

    var newX = (winRect.x - screen.x) / screen.width + "*screenSizeX+screenOriginX";
    var newY = (winRect.y - screen.y) / screen.height + "*screenSizeY+screenOriginY";
    var newWidth = winRect.width / screen.width + "*screenSizeX";
    var newHeight = winRect.height / screen.height + "*screenSizeY";
    var throwNext = slate.operation("throw", {
        "x": newX,
        "y": newY,
        "width": newWidth,
        "height": newHeight,
        "screen": "next"
    });
    win.doOperation(throwNext);
};

var fullscreen = slate.operation("move", {
    "x": "screenOriginX",
    "y": "screenOriginY",
    "width": "screenSizeX",
    "height": "screenSizeY"
});

var throwNextFullscreen = slate.operation("throw", {
    "x": "screenOriginX",
    "y": "screenOriginY",
    "width": "screenSizeX",
    "height": "screenSizeY",
    "screen": "next"
});

var pushRight = slate.operation("push", {
    "direction": "right",
    "style": "bar-resize:screenSizeX/2"
});

var pushLeft = slate.operation("push", {
    "direction": "left",
    "style": "bar-resize:screenSizeX/2"
});

var throwNextLeft = slate.operation("throw", {
    "width": "screenSizeX/2",
    "height": "screenSizeY",
    "screen": "next"
});

var throwNextRight = slate.operation("throw", {
    "x": "screenOriginX+(screenSizeX)/2",
    "y": "screenOriginY",
    "width": "screenSizeX/2",
    "height": "screenSizeY",
    "screen": "next"
});

var topRightCorner = slate.operation("corner", {
    "direction" : "top-right",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});

var bottomRightCorner = slate.operation("corner", {
    "direction" : "bottom-right",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});

var bottomLeftCorner = slate.operation("corner", {
    "direction" : "bottom-left",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});

var topLeftCorner = slate.operation("corner", {
    "direction" : "top-left",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});

var nextTopRightCorner = slate.operation("corner", {
    "direction" : "top-right",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2",
    "screen" : "next"
});

var nextBottomRightCorner = slate.operation("corner", {
    "direction" : "bottom-right",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2",
    "screen" : "next"
});

var nextBottomLeftCorner = slate.operation("corner", {
    "direction" : "bottom-left",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2",
    "screen" : "next"
});

var nextTopLeftCorner = slate.operation("corner", {
    "direction" : "top-left",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2",
    "screen" : "next"
});

slate.bind("up:cmd,shift", function (win) {
    if (!win) {
        return;
    }

    if (isFullscreen(win)) {
        win.doOperation(throwNextFullscreen);
    } else {
        win.doOperation(fullscreen);
    }
});

slate.bind("down:cmd,shift", function (win) {
    if (!win) {
        return;
    }

    if (isPushedLeft(win)) {
        win.doOperation(throwNextLeft);
    } else if (isPushedRight(win)) {
        win.doOperation(throwNextRight);
    } else if (isFullscreen(win)) {
        win.doOperation(throwNextFullscreen);
    } else {
        throwNext(win);
    }
});

slate.bind("right:cmd", function (win) {
    if (!win) {
        return;
    }

    if (isPushedRight(win)) {
        win.doOperation(throwNextRight);
    } else {
        win.doOperation(pushRight);
    }
});

slate.bind("left:cmd", function (win) {
    if (!win) {
        return;
    }
    if (isPushedLeft(win)) {
        win.doOperation(throwNextLeft);
    } else {
        win.doOperation(pushLeft);
    }
});

slate.bind("right:cmd,shift", function (win) {
    if (!win) {
        return;
    }

    if (isTopRightCornered(win)) {
        win.doOperation(nextTopRightCorner);
    } else {
        win.doOperation(topRightCorner);
    }
});

slate.bind("right:cmd,alt", function (win) {
    if (!win) {
        return;
    }

    if (isBottomRightCornered(win)) {
        win.doOperation(nextBottomRightCorner);
    } else {
        win.doOperation(bottomRightCorner);
    }
});

slate.bind("left:cmd,alt", function (win) {
    if (!win) {
        return;
    }

    if (isBottomLeftCornered(win)) {
        win.doOperation(nextBottomLeftCorner);
    } else {
        win.doOperation(bottomLeftCorner);
    }
});

slate.bind("left:cmd,shift", function (win) {
    if (!win) {
        return;
    }

    if (isTopLeftCornered(win)) {
        win.doOperation(nextTopLeftCorner);
    } else {
        win.doOperation(topLeftCorner);
    }
});
