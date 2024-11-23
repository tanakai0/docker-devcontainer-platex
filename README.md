# docker-devcontainer-platex
pLaTeX and pdfLaTeX environment with Docker and VSCode Devcontainer.

# Environment
- VSCode
- Devcontainer extension: ms-vscode-remote.remote-containers
- Docker (including Ubuntu22.04, $\TeX$, $\LaTeX$, and Japanese language support)

The Docker image is based on tanakai/devcontainer-platex-ubuntu22:latest.
This repository also provides a Dockerfile and Makefile as references for running the environment without a devcontainer.


# Usage

1. Open the devcontainer environment.
    - Use the VSCode command palette and select ```Reopen in Container```


2. Compile $\LaTeX$ files.
    - Compile all `.tex` files with:
       ```bash
       latexmk
       ```
    - Or compile a specific `.tex` file with:
      ```bash
      latexmk test
      ```
    - The default engine is **upLaTeX**. You can switch to **pdfLaTeX** or **pLaTeX** by editing the `.latexmkrc` file.
    - To change the font style used in the compiled document, see the sqitch_font script: 
      ```
      ./switch_font.sh
      ```
      Currently, you can switch between Mincho (`ipaex`) and Gothic (`noEmbed`) fonts by editing the `switch_font.sh` script.

# Reference
- [TeX.gitignore](https://github.com/github/gitignore/blob/main/TeX.gitignore)
