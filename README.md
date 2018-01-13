# README

## Overview
* Make initial setup as easy and robust as possible
* Scripts to install foundational services for machines
* Download and install binaries if not found on system using [`bork`](https://github.com/mattly/bork) and `which`
* Xml model to modify and (re)generate scripts as necessary

Currently 'foundational services' means: 

* nomad: 
    * to schedule and restart processes on failure
    * to persist processes to be run despite stop/starting of nomad 
    * to automatically and dynamically assign host and port information if requested (xml attribute: `wireup` )
    * run nomad via systemd if desired and rest of processes as nomad jobs rather than all processes as systemd services

* consul:
    * for service discovery, nomad jobs are automatically discoverable
    * language bindings make service host and port lookups simple

* systemd(optional):
    * always run nomad/consul as service on startup

By using code generation( [`gsl`](https://github.com/zeromq/gsl) ) other configurations can be easily supported.

## Quickstart
Clone the repo:
```
git clone https://github.com/galencm/machinic-env
```

Start services:
```
cd ~/machinic-ev
./environment.sh
cd env
./install-machinic-services.sh
```

(Re)generate from xml using [`envgen`](https://github.com/galencm/ma):
```
git clone https://github.com/galencm/ma
cd ~/ma/envgen
./envgen.sh ~/machinic-env/environment.xml ~/machinic-env
```

(Re)generate with key:values from commandline:
```
./envgen.sh ~/machinic-env/environment.xml ~/machinic-env ./ENVS interface:localhost
./envgen.sh ~/machinic-env/environment.xml ~/machinic-env ./ENVS interface:eth0
```

See what changed after generation:
```
git status
```

## Contributing

This project uses the C4 process 

[https://rfc.zeromq.org/spec:42/C4/](https://rfc.zeromq.org/spec:42/C4/)

## License
Mozilla Public License, v. 2.0 

[http://mozilla.org/MPL/2.0/](http://mozilla.org/MPL/2.0/)


