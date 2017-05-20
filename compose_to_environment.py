import yaml
import argparse


def parse(container, docker_file='docker-compose.yml'):
    with open(docker_file) as content:
        container = container
        parsedYaml = yaml.load(content)
        environment = parsedYaml[container]['environment']

        for k, v in environment.items():
            print("export {}={}".format(k, v))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--docker-file')
    parser.add_argument('-c', '--container')
    args = parser.parse_args()
    parse(args.container, args.docker_file)
