# solr
## solr 学习例子

solr 添加 中文分词, mysql/orale数据导入

# HOW TO USE

    docker run --name my-solr -it -d fansin/solr-zh

visit http://172.17.0.2:8983/solr/ , `172.17.0.2` use your container IP
    
# HOW TO BUILD
    
    docker build -t my-solr ./
    docker run -it --name my-solr my-solr

#  EXAMPLE

>1. `solrconfig.xml` line84左右,添加中文分词包,此包在solr的`contrib/analysis-extras/lucene-libs/` 目录下

    <lib path="${solr.install.dir:../../../..}/contrib/analysis-extras/lucene-libs/lucene-analyzers-smartcn-6.4.2.jar"/>

>2.添加驱动jar到`/opt/solr/server/lib`,这个已经在`Dockerfile` build过程已添加,也可以在启动时添加

>3.在`managed-schema`文件添加中文分析器,例如我使用solr demo例子,那就在`/opt/solr/example/example-DIH/solr/db/conf/db-data-config.xml`添加分析器.

    <fieldType name="text_zh" class="solr.TextField" positionIncrementGap="100">
        <analyzer>
          <tokenizer class="solr.HMMChineseTokenizerFactory"/>
          <filter class="solr.StopFilterFactory"
          words="org/apache/lucene/analysis/cn/smart/stopwords.txt"/>
          <filter class="solr.PorterStemFilterFactory"/>
        </analyzer>
    </fieldType>
>4.在`managed-schema`文件添加自定义字段,默认已经有很多字段,可以复用,如果需要新增,可以自行添加,例如添加

    <field name="text" type="string" indexed="true" stored="true"/>

>5.docker run之后,oracle使用命令[ORACLE](#oracle)/mysql使用命令[MYSQL](#mysql)使用dataimport,成功后,在查询界面可以看到导入的数据.

<h2 id='oracle'> ORACLE </h2>

    docker run -it --rm --name my-solr-oracle -v /home/zhaofeng/dev/docker/solr/oracle-data-config.xml:/opt/solr/example/example-DIH/solr/db/conf/db-data-config.xml -v /home/zhaofeng/dev/docker/solr/solrconfig.xml:/opt/solr/example/example-DIH/solr/db/conf/solrconfig.xml -v /home/zhaofeng/dev/docker/solr/managed-schema:/opt/solr/example/example-DIH/solr/db/conf/managed-schema my-solr


<h2 id='mysql'> MYSQL</h2>

    docker run -it --rm --name my-solr-oracle -v /home/zhaofeng/dev/docker/solr/mysql-data-config.xml:/opt/solr/example/example-DIH/solr/db/conf/db-data-config.xml -v /home/zhaofeng/dev/docker/solr/solrconfig.xml:/opt/solr/example/example-DIH/solr/db/conf/solrconfig.xml -v /home/zhaofeng/dev/docker/solr/managed-schema:/opt/solr/example/example-DIH/solr/db/conf/managed-schema my-solr



# More

  参考 [docker solr](https://store.docker.com/images/f4e3929d-d8bc-491e-860c-310d3f40fff2?tab=description "solr")
