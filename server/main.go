package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/kelseyhightower/envconfig"
	log "github.com/sirupsen/logrus"

	"github.com/fluktuid/vortrag-kit-code/config"
	"github.com/fluktuid/vortrag-kit-code/metrics"
)

func main() {
	var c config.Server
	err := envconfig.Process("", &c)
	log.WithField("config", c).Info("Import Config")
	if err != nil {
		log.Fatal(err)
	}
	metrics.InitAsync()
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello there!")
		time.Sleep(time.Duration(c.DelayResponse) * time.Millisecond)
		defer metrics.ServerRecordRequest()
	})

	log.Info("Starting server at port 8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
