FROM nginx

RUN --mount=type=bind,source=ex,target=/mount_bind cp /mount_bind/* /root/ && echo `date` >> /root/file.txt
