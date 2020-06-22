# Dockerized NSGClient 

## Documentation is ongoing i am still trying to find time to finish the documentation

## First build the docker image
- Reason for privleged is that it needs to adjust some kernel parameters
- For dbus, it's a hard requirement for the container to the nsgverctl service and network manager 
- Download nsgclient to the certain directory. Together with the docker file
  
```shell
    docker run  --privileged --rm -d  --volume /var/run/dbus:/var/run/dbus  nsgclient:latest 
    - login to the container
    docker exec -it 340291ae417aa70f4be554da9b0be64609c39631054e6d300cfd3e08328c4704 /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

    once on the container
    
    Run /opt/Citrix/NSGClient/service/nsgverctl
```

## Login using ssh

``` 
Run ssh -X test@${Container_Ip
-  /opt/Citrix/NSGClient/bin/NSGClient keep this running on backroun
- firefox - this is to get the vpn details




