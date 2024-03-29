FROM python:3.10-bullseye

ENV DEBIAN_FRONTEND noninteractive
COPY pyproject.toml poetry.loc[k] /
RUN curl -sSL https://install.python-poetry.org | python - && \
    echo 'export PATH="/root/.local/bin:$PATH"' > ~/.bashrc && \
    export PATH="/root/.local/bin:$PATH"  && \
    poetry config virtualenvs.create false && \
    poetry self add poetry-bumpversion && \
    poetry install && \
    echo "/workspaces/monitor-rosa-library/src/" > /usr/local/lib/python3.10/site-packages/monitor_rosa_library.pth