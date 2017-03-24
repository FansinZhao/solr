# solr
## solr 学习例子

solr 添加 中文分词, mysql/orale数据导入

# HOW TO

    docker build -t my-solr ./
    docker run -it --name my-solr my-solr

#  EXAMPLE
## ORACLE
    docker run -it --name my-solr-oracle -v /home/your/docker/solr/oracle-data-config.xml:/opt/solr/example/example-DIH/solr/db/conf/db-data-config.xml my-solr



# More

  参考 [docker solr](https://store.docker.com/images/f4e3929d-d8bc-491e-860c-310d3f40fff2?tab=description "solr")
