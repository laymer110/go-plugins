package grpc

import (
	"time"

	proto "github.com/laymer110/go-plugins/v2/config/source/grpc/proto"
	"github.com/micro/go-micro/v2/config/source"
)

func toChangeSet(c *proto.ChangeSet) *source.ChangeSet {
	return &source.ChangeSet{
		Data:      c.Data,
		Checksum:  c.Checksum,
		Format:    c.Format,
		Timestamp: time.Unix(c.Timestamp, 0),
		Source:    c.Source,
	}
}
