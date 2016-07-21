#!/usr/bin/env bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
echo $DIR
cd $DIR
before=`sudo du /var/lib/docker/ -sh`
docker rm -f -l -v $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi -f $(docker images -q -f dangling=true)
docker rmi -f $(docker images -q -a)
sudo python .clear-volumes.py
echo "before=$before"
echo "after:"
sudo du /var/lib/docker/ -sh
