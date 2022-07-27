module github.com/laymer110/go-plugins/v3/wrapper/monitoring/prometheus

go 1.16

require (
	github.com/asim/go-micro/v3 v3.7.1
	github.com/laymer110/go-plugins/v3/broker/memory v1.0.0
	github.com/laymer110/go-plugins/v3/registry/memory v1.0.0
	github.com/prometheus/client_golang v1.11.0
	github.com/prometheus/client_model v0.2.0
	github.com/stretchr/testify v1.7.0
)

replace (
	github.com/laymer110/go-plugins/v3/broker/memory => ../../../broker/memory
	github.com/laymer110/go-plugins/v3/registry/memory => ../../../registry/memory
)
