#!/bin/bash

git_upt() {
    git submodule foreach git fetch
    git submodule foreach git pull
}

kube() {
    kubectl apply -f kubernetes/
}

dc() {
    docker-compose up -d
}

display_help() {
    echo "   -h, --help          Display help"
    echo "   git-upt             Update all git submodules"
    echo "   kube                Deploy kubernetes resources"
    echo "   dc                  Deploy docker-compose resources"
    exit 1
}

# Main Script
case "$1" in
    git-upt)
        git_upt
        ;;
    kube)
        kube
        ;;
    dc)
        dc
        ;;
    help | --help | -h)
        display_help
        ;;
    *)
        echo "Command not found"
        ;;
esac
