FROM opengisch/qgis:stable

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \
    xvfb \
    iputils-ping \
    postgresql-client \
    wget \
    qttools5-dev-tools \
    qt5-default

CMD xvfb-run /usr/src/scripts/create_project_translation.py
