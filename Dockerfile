FROM python:3.12-slim-bookworm
EXPOSE 9001
EXPOSE 8000
EXPOSE 8100
EXPOSE 8265
EXPOSE 8080
EXPOSE 6006


#https://docs.astral.sh/uv/guides/integration/docker/#available-images
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates git tree
ADD https://astral.sh/uv/install.sh /uv-installer.sh
RUN sh /uv-installer.sh && rm /uv-installer.sh
ENV PATH="/root/.local/bin/:$PATH"

RUN uv pip install jupyterlab --system

COPY startup.sh /guardrails_serve_tutorial/startup.sh
RUN chmod +x /guardrails_serve_tutorial/startup.sh
ENTRYPOINT ["/guardrails_serve_tutorial/startup.sh"]