function getRndFloat(min, max) {
    return Math.random() * (max - min) + min;
}

exports("getRndFloat", getRndFloat);