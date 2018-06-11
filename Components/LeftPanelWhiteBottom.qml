Rectangle { // TODO: maybe scroll height?
    width: leftPanel.width;
    height: leftPanel.height + insideRect.height;
    x: (app.width - insideRect.width) / 2;
    color: 'white';
    fixed: true;
}