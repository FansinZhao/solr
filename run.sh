#!/bin/bash
# init gettingstared
solr start
solr create_core -c gettingstarted
post -c gettingstarted example/exampledocs/*.*
tail -f server/logs/solr.log
