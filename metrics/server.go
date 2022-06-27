package metrics

import (
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
)

var (
	callsProcessed = promauto.NewCounter(prometheus.CounterOpts{
		Name: "server_processed_calls",
		Help: "The total number of processed calls",
	})
)

func ServerRecordRequest() {
	go func() {
		callsProcessed.Inc()
	}()
}
