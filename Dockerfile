FROM elasticsearch:5.2

MAINTAINER Maxime DELAUNAY <maxime.delaunay@gmail.com>

CMD ["bash -c 'ip addr && IP=$$(ip addr | awk -F\"[ /]*\" \"/inet .*\/24/{print \$$3}\") && exec /docker-entrypoint.sh -Enetwork.bind_host=0.0.0.0 -Enetwork.publish_host=$$IP -Ediscovery.zen.minimum_master_nodes=2 -Ediscovery.zen.ping.unicast.hosts=tasks.elasticsearch'"]
