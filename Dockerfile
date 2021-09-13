FROM busybox

RUN --mount=type=cache,target=/test_cache_folder_1/ echo `date` >> /test_cache_folder_1/test_cache.txt && cp /test_cache_folder_1/test_cache.txt /test_cache.txt

#RUN mkdir -p /test_cache_folder_2 && echo `date` >> /test_cache_folder_2/test_cache.txt
#RUN mkdir -p /test_cache_folder_3
#
#RUN cp /test_cache_folder_1/test_cache.txt /test_cache_folder_3/test_cache.txt

#
#FROM kek
#
#RUN echo 33 > /tmp/33