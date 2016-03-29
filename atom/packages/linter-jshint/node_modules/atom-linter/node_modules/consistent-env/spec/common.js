'use babel'

// Jasmine 1.3.x has no sane way of resetting to native clocks, and since we're
// gonna test promises and such, we're gonna need it
function resetClock() {
  for (const key in jasmine.Clock.real) {
    window[key] = jasmine.Clock.real[key]
  }
}

beforeEach(function() {
  resetClock()
})
