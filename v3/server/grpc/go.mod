module github.com/laymer110/go-plugins/v3/server/grpc

go 1.16

require (
	github.com/asim/go-micro/v3 v3.7.1
	github.com/laymer110/go-plugins/v3/broker/memory v1.0.0
	github.com/laymer110/go-plugins/v3/client/grpc v1.0.0
	github.com/laymer110/go-plugins/v3/transport/grpc v1.0.0
	github.com/golang/protobuf v1.5.2
	golang.org/x/net v0.0.0-20210614182718-04defd469f4e
	google.golang.org/genproto v0.0.0-20200806141610-86f49bd18e98
	google.golang.org/grpc v1.38.0
)

replace (
	github.com/laymer110/go-plugins/v3/broker/memory => ../../broker/memory
	github.com/laymer110/go-plugins/v3/client/grpc => ../../client/grpc
	github.com/laymer110/go-plugins/v3/transport/grpc => ../../transport/grpc
)
