ARG version=latest
FROM ubuntu:$version

#MAINTAINER JCD "jcd717@outlook.com"

# Les directives les + stables sont a faire au début. 
#economisons les couches

LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

COPY heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; \
    echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile sur les ports qu'ouvre le container (facultatif)
EXPOSE 1234/udp 4321/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["battement"]

