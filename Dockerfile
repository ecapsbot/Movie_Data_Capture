FROM python:slim
WORKDIR /jav

# RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
#     && sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list
# RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U \
#     && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN apt-get update \
    && apt-get install -y wget ca-certificates

COPY Movie_Data_Capture /jav

RUN ( pip install --no-cache-dir -r requirements.txt || true ) \
    && pip install --no-cache-dir requests lxml Beautifulsoup4 pillow \

CMD python /jav/AV_Data_Capture.py