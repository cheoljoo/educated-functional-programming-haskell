https://hub.docker.com/_/haskell/ 
 
 $  docker pull haskell
Using default tag: latest
Warning: failed to get default registry endpoint from daemon (Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?). Using system default: https://index.docker.io/v1/
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

 06:12  lotto645  home/cheoljoo.lee  $  sudo service docker restart
stop: Unknown instance:
docker start/running, process 196089



$ docker pull haskell

$  docker run -it --rm haskell:8
Unable to find image 'haskell:8' locally
8: Pulling from library/haskell
Digest: sha256:a242e9eb11bdecf0f30dfd4d82627d77ddab45cba5a87d7783102f3cc5d50afb
Status: Downloaded newer image for haskell:8
GHCi, version 8.6.5: http://www.haskell.org/ghc/  :? for help
Prelude>


