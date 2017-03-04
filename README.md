# elasticsearch_swarmmode
Elasticsearch swarm mode cluster

This Docker image provides an easily configurable Elasticsearch cluster for Docker Swarm mode.



## Configuration file docker-compose.yml

This is an example, not use for production.

```yaml
 version: '3'
 services:
    elasticsearch:
      image: maximedelaunay/elasticsearch
      networks:
        - esbacknet
      deploy:
        mode: global
      ulimits:
        memlock: -1
        nofile:
          hard: 65536
          soft: 65536
        nproc: 65538
      environment:
        ES_JAVA_OPTS: -Xms16g -Xmx16g
    kibana:
      image: kibana
      networks: 
        - esbacknet
      ports:
        - 5601:5601
      depends_on: 
        - elasticsearch
      deploy:
        placement:
          constraints: [node.role == manager]
 networks:
   esbacknet:
     driver: overlay    
```

## Create cluster
```bash
 docker stack deploy --compose-file docker-compose.yml escluster
```
