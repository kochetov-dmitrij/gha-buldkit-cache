FROM busybox as kek

RUN echo 11 > /tmp/11
RUN echo 22 > /tmp/22


FROM kek

RUN echo 33 > /tmp/33