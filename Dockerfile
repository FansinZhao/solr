# This dockerfile uses the ubuntu image
# VERSION 1
# Author: FansinZhao
# Command format : Instruction [arguments / command ]..

# 1 use offical solr
FROM solr

# 2 auth
MAINTAINER FansinZhao 171388204@qq.com

# 3 command
# need chmod a+x run.sh before build.
ADD run.sh /run.sh
# simplechinese replace
ADD managed-schema /managed-schema

# 4 run
CMD ["solr-foreground"]
ENTRYPOINT /run.sh
