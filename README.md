# texlive-docker

## Configure .latexmkrc

```perl
#!/usr/bin/env perl
$pdf_mode         = 3;
$latex            = 'pdflatex -halt-on-error';
$latex_silent     = 'pdflatex -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
```

##  Run latexmk with docker-compose

### Add docker-compose.yml

```yml
version: '3'

services: 
  texlive:
    image: 'jumpaku/texlive-docker'
    working_dir: '/workdir/'
    command: ['latexmk', '-pvc']
    volumes: 
      - './:/workdir/'
      - './.latexmkrc:/root/.latexmkrc:ro'
```

### Execute docker-compose

```sh
docker-compose run texlive
```

## Open in container with Visual Studio Code Insiders

### Add .devcontainer/docker-compose.yml

```yml
version: '3'

services: 
  texlive:
    image: 'jumpaku/texlive-docker'
    working_dir: '/workdir/'
    command: ["sleep", "infinity"]
    volumes: 
      - './../:/workdir/'
      - './../.latexmkrc:/root/.latexmkrc:ro'
```

### Add .devcontainer/devcontainer.json

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

### Open Visual Studio Code Insiders

1. command + shift + P
2. `Remote-Containers: Open Folder in Container`

