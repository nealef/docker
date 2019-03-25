#!/usr/bin/sh
cd /go/src/github.com/grafana/grafana
echo "***** Buildind Docker Image *****"
tar -czf /output/grafana-latest.tar.gz bin public scripts conf VERSION LICENSE.md README.md NOTICE.md
echo "***** Build Complete *****"
exit
