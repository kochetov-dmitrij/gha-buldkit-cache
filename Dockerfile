FROM nginx

#RUN --mount=type=bind,target=/test_cache_folder_1/ echo `date` >> /test_cache_folder_1/test_cache.txt
RUN --mount=type=bind,source=example,target=/data cp /data/* /root/
