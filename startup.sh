#!/bin/bash
jupyter lab --notebook-dir=guardrails_serve_tutorial --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password='' -y & jupnb=$!
wait $jupnb
