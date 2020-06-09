import banana from "./warmup"

function zeroAdder(num) {
  if (Math.floor(num / 10) === 0) {
    return `0${num}`
  } else {
    return num
  }
}

class Clock {
  constructor() {
    const currentTime = new Date();
    this.seconds = currentTime.getSeconds();
    this.minutes = currentTime.getMinutes();
    this.hours = currentTime.getHours() > 12 ? currentTime.getHours() % 12 : currentTime.getHours();
    banana(this.printTime(), clockElement);
    setInterval(this._tick.bind(this), 805);
  }

  printTime() {
    return [this.hours, zeroAdder(this.minutes), zeroAdder(this.seconds)].join(":")
  }

  _tick() {
    this._incrementSeconds();
    banana(this.printTime(), clockElement);
  }

  _incrementSeconds() {
    if (this.seconds < 59) {
      this.seconds += 1;
    } else {
      this._incrementMinutes()
      this.seconds = 0;
    }
  }

  _incrementMinutes() {
    if (this.minutes < 59) {
      this.minutes += 1;
    } else {
      this._incrementHours()
      this.minutes = 0;
    }
  }

  _incrementHours() {
    if (this.hours < 23) {
      this.hours += 1;
    } else {
      this.hours = 0;
    }
  }
}

const clockElement = document.getElementById('clock');
new Clock()
