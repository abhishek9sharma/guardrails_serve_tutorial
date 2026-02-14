# guardrails_serve_tutorial
A bunch of tutorials on Using and Serving [Guardrails-AI](https://www.guardrailsai.com/)


## How to Run
- Installa Docker from [here](https://docs.docker.com/get-docker/)
- Run below script/commands
    - Mac/Linux 
        ```bash
        #!/bin/bash
        git clone https://github.com/abhishek9sharma/guardrails_serve_tutorial.git
        cd  guardrails_serve_tutorial
        make up_with_build 
        ```
    - Windows
        ```bash
        #!/bin/bash
        git clone https://github.com/abhishek9sharma/guardrails_serve_tutorial.git
        cd  guardrails_serve_tutorial
        docker-compose up -d --build
        ``` 
- Browse the url http://localhost:8888/lab
- Follow the instructions in the notebooks. They are self contained. 
-  You need to set up some environment variables. The steps are mentioned below. 
    - The default setting of the tutorials is to use [OpenAI](https://openai.com/) services which requires an API key. To get the key, you need to sign up for an account on the [OpenAI website](https://openai.com/product). Once you have your API key, you can set it in your environment variables wherever mentioned in the notebooks.
    - You will also need a guardrails hub token. Please follow the instructions at [https://hub.guardrailsai.com/](https://hub.guardrailsai.com/) and set it in your environment variables wherever mentioned in the notebooks.
- To stop run the below command
    ```docker-compose down``` 

## References

- [https://www.guardrailsai.com/](https://www.guardrailsai.com/)
- [https://docs.litellm.ai/](https://docs.litellm.ai/)
