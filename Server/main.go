package main

import (
	hw "grpcHalloWorld/helloworld"
	"log"

	"net"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

type server struct{}

const (
	port = ":8383"
)

func (s *server) SayHello(ctx context.Context, in *hw.HelloRequest) (*hw.HelloReply, error) {
	return &hw.HelloReply{Message: "Hello world!!"}, nil
}

func main() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	hw.RegisterGreeterServer(s, &server{})
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
