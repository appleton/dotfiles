# eval "$(docker-machine env default &> /dev/null)"
# sudo route add -net 192.168.99.0/24 -interface vboxnet0

function dlogs {
  docker ps | grep $1 | cut -f 1 -d " " | xargs docker logs "${@:2}"
}
