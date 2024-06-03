#!/bin/bash

function start_app {
    docker build -t my-java-app .
    docker run -d -p 8081:8081 my-java-app
}

function stop_app {
    docker stop $(docker ps -q --filter ancestor=my-java-app)
}

function status_app {
    curl localhost:8080
}

PS3='Please enter your choice: '
options=("Start" "Stop" "Status" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Start")
            start_app
            ;;
        "Stop")
            stop_app
            ;;
        "Status")
            status_app
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
