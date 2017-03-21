#!/bin/bash
# init gettingstared
solr start -e dih
solr create_core -c gettingstarted
post -c gettingstarted example/exampledocs/*.*
cp /managed-schema /opt/solr/server/solr/gettingstarted/conf/managed-schema
/bin/bash
