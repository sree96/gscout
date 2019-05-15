FROM alpine

RUN mkdir -p /etc/gcloud/keys

RUN apk add --update && \
		apk add git && \
		apk add python3 && \
		apk add py-pip && \
		apk add curl && \
		apk add which && \ 
		apk add bash && \ 
		pip install virtualenv

RUN curl -sSL https://sdk.cloud.google.com | bash

RUN alias gcloud=/root/google-cloud-sdk/bin/gcloud

RUN cd /opt && \
		git clone https://github.com/nccgroup/G-Scout.git && \
		mv G-Scout gscout && \
		cd gscout && \
		virtualenv -p python3 venv && \
		source venv/bin/activate

WORKDIR /opt/gscout
VOLUME /root
COPY scan.sh /opt/gscout/scan.sh
CMD [ "sh","scan.sh" ]
