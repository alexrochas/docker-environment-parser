# Docker Environment Parser

Tool for extract docker-compose environments.

## Usage

```
eval $(python ~/compose_to_environment.py -c web -d docker-compose.yml)
```

* **-d, --docker-file**: docker-compose file
* **-c, --container**: container name
