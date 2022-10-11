<h1 align="center">My Workspace</h1>

# How to get started

replace `<PROJECT NAME>` with your preferred project name and run the command below:

```bash 
PROJECT_NAME=<PROJECT NAME> \
    && WORKSPACE_URL="https://raw.githubusercontent.com/ryuichi24/my-workspace/main/init.sh" \
    && curl -s ${WORKSPACE_URL} | bash -s -- ${PROJECT_NAME} \
    && cd ${PROJECT_NAME}
```
