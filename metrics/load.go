package metrics

import (
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
)

var (
	callsSent = promauto.NewCounter(prometheus.CounterOpts{
		Name: "caller_sent_calls",
		Help: "The total number of sent calls",
	})
	callsSuccesful = promauto.NewCounter(prometheus.CounterOpts{
		Name: "caller_sent_calls_successful",
		Help: "The total number of sent calls",
	})
	callsFailed = promauto.NewCounter(prometheus.CounterOpts{
		Name: "caller_sent_calls_failed",
		Help: "The total number of sent calls",
	})
	callsDuration = promauto.NewHistogram(prometheus.HistogramOpts{
		Name:    "caller_duration_calls",
		Help:    "The duration of processed calls",
		Buckets: []float64{0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 150, 200, 250, 500, 1000},
	})
)

func LoadRecordRequest() {
	go func() {
		callsSent.Inc()
	}()
}

func LoadRecordResponse(succesful bool, durationMillis int64) {
	go func() {
		if succesful {
			callsSuccesful.Inc()
		} else {
			callsFailed.Inc()
		}
		callsDuration.Observe(float64(durationMillis))
	}()
}
