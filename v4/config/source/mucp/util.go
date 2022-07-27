package mucp

import (
	"time"

	proto "github.com/laymer110/go-plugins/v4/config/source/mucp/proto"
	"go-micro.dev/v4/config/source"
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
