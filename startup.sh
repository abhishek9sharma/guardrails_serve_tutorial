#!/bin/bash
ls -lah
jupyter lab --notebook-dir=guardrails_serve_tutorial --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token='' --NotebookApp.password='' -y & jupnb=$!
streamlit run guardrails_serve_tutorial/src/streamlit/main.py --server.runOnSave=True &streamlit_pid=$!
wait $jupnb $streamlit_pid
