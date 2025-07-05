from typing import List, Optional

from pydantic import BaseModel

import streamlit as st


import requests


class Message(BaseModel):
    role: str
    content: str


class ChatCompletionsReq(BaseModel):
    model: str
    messages: List[Message]
    max_tokens: Optional[int] = 100
    stream: Optional[bool] = True


class ChatCompletionsReqGuarded(BaseModel):
    model: str
    messages: List[Message]
    max_tokens: Optional[int] = 100
    stream: Optional[bool] = True
    input_guard_to_apply: Optional[str] = None
    output_guard_to_apply: Optional[str] = None


def guarded_chat():
    st.title("Guarded Chat Completion")

    if "messages" not in st.session_state:
        st.session_state.messages = []

    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

    if prompt := st.chat_input("What is up?"):
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)

        with st.chat_message("assistant"):
            try:
                response = requests.post(
                    "http://localhost:8000/ChatCompletionsReqGuarded",
                    headers={
                        "accept": "application/json",
                        "Content-Type": "application/json",
                    },
                    json={
                        "messages": st.session_state.messages,
                        "stream": True,
                        "max_tokens": 50,
                        "model": "gpt-3.5-turbo",
                        "input_guard_to_apply": "Profanity",
                        "output_guard_to_apply": "PII",
                    },
                )
                if response.status_code == 200:
                    content = response.text
                    st.markdown(content)
                    st.session_state.messages.append(
                        {"role": "assistant", "content": content}
                    )
                else:
                    st.error(f"Error: {response.text}\n\n Please make sure you have run the notebook 02_serving_gr_fastapi.ipynb to start the FastAPI server.")
                    st.markdown("Please make sure you have run the notebook 02_serving_gr_fastapi.ipynb to start the FastAPI server")
            except requests.exceptions.RequestException as e:
                st.error(f"Request failed: {e}")
                st.markdown("Please make sure you have run the full notebook 02_serving_gr_fastapi.ipynb to start the FastAPI server")


if __name__ == "__main__":
    guarded_chat()
