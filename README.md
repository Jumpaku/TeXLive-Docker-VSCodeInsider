# texlive-docker

## Run with docker-compose

Execute the following command
```sh
docker-compose run texlive
```
with the following `docker-compose.yml`
```yml
version: '3'

services: 
  texlive:
    image: 'jumpaku/texlive-docker'
    working_dir: '/workdir/'
    command: ['latexmk', '-pvc']
    volumes: 
      - './:/workdir/'
#      - './.latexmkrc:/root/.latexmkrc:ro'
```

## Open in container with Visual Studio Code Insiders

Open your directory with the following files.
* `.devcontainer/devcontainer.json` 
```json
{
    "name": "texlive",
    "dockerComposeFile": "./docker-compose.yml",
    "service": "texlive",
    "workspaceFolder": "/workdir/",
    "extensions": [
        "james-yu.latex-workshop"
    ],
    "settings": {
        "editor.formatOnSave": true
    }
}
```
* `.devcontainer/docker-compose.yml`
```yml
version: '3'

services: 
  texlive:
    image: 'jumpaku/texlive-docker'
    working_dir: '/workdir/'
    command: ["sleep", "infinity"]
    volumes: 
      - './../:/workdir/'
#      - './../.latexmkrc:/root/.latexmkrc:ro'
```

## Configure .latexmkrc

Mount the following `.latexmkrc` to `/root/.latexmkrc` in the container.

```perl
#!/usr/bin/env perl
$pdf_mode         = 3;
$latex            = 'pdflatex -halt-on-error';
$latex_silent     = 'pdflatex -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
```
