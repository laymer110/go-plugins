package mucp

import (
	"time"

	"github.com/asim/go-micro/v3/config/source"
	proto "github.com/laymer110/go-plugins/v3/config/source/mucp/proto"
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
