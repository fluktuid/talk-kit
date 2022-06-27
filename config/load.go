package config

type Load struct {
	ParallelRequests  int    `envconfig:"PARALLEL_REQUESTS" default:"1"`
	WaitMillisBetween int    `envconfig:"WAIT_MILLIS_BETWEEN" default:"1000"`
	CallURL           string `envconfig:"CALL_URL" default:"http://localhost:8080"`
}

type Server struct {
	DelayResponse int `envconfig:"DELAY_RESPONSE" default:"1000"`
}
