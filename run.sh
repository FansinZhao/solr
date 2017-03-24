#!/bin/bash
# init gettingstared
solr start -e dih
solr create_core -c gettingstarted
post -c gettingstarted example/exampledocs/*.*
/bin/bash
