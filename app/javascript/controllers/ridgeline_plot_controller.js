import {Controller} from "@hotwired/stimulus"
import p5 from "p5"

// Many thanks to https://maxhalford.github.io/blog/unknown-pleasures/ and https://github.com/robertobetini/unknownpleasures
// for the inspiration
// Connects to data-controller="ridgeline-plot"
export default class extends Controller {
    config = {
        frameRate: 60,
        count: 60,
        separation: 18,
        width: window.innerWidth,
        speed: 0.0025,
        arity: 0.04
    }
    lines = [];
    time = 0;

    initialize() {
        this.timeStamp = Date.now()
        new p5(this.plotter)
    }

    plotter = (sketch) => {
        this.sketch = sketch
        sketch.setup = this.setupCanvas
        sketch.draw = this.drawCanvas
    }

    advanceTime() {
        const dt = Date.now() - this.timeStamp
        this.time += this.config.speed * dt * 0.057
        this.timeStamp = Date.now()
    }

    setupCanvas = () => {
        this.sketch.createCanvas(window.innerWidth, window.innerHeight, this.element)
        this.sketch.frameRate(this.config.frameRate)

        for (let i = 0; i < this.config.count; i++) {
            const baseline = i * this.config.separation
            this.lines.push(new Line(this.sketch, baseline, this.config.width, this.config.arity))
        }
    }

    drawCanvas = () => {
        this.sketch.background(0);
        this.sketch.translate(this.sketch.width / 2 - this.config.width / 2,
            this.sketch.height / 1.8 - (this.config.count * this.config.separation) / 2)

        this.lines.forEach(line => line.draw(this.time))

        this.advanceTime()
    }
}

class Line {
    sketch;
    baseline;
    width;
    arity;
    patternOffset;
    sampling = 3;

    constructor(sketch, baseline, width, arity) {
        this.sketch = sketch;
        this.baseline = baseline;
        this.width = width;
        this.arity = arity;
        this.patternOffset = this.sketch.random(1000);
    }

    draw(time) {
        this.sketch.stroke(255);
        this.sketch.strokeWeight(1);
        this.sketch.fill(0);

        let noiseOffset = this.patternOffset;
        const steps = this.width / this.sampling;

        this.sketch.beginShape();
        for (let i = 0; i < steps; i++) {
            const noiseValue = this.sketch.noise(noiseOffset, time);
            const gaussValue = this.gaussianPDF(i - (steps / 2)) + 10;
            const value = this.sketch.abs(this.sketch.map(noiseValue, 0, 1, -gaussValue, gaussValue));
            this.sketch.vertex(this.sampling * i, this.baseline - value);
            noiseOffset += this.arity;
        }
        this.sketch.endShape();
    };

    // first num is deviation, second is mean, ...I think
    // 15 and 100 match more closely the values in the original article
    gaussianPDF = x => Math.exp(-(Math.pow(x / 20, 2) / 2)) * 120;
}
