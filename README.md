# README

## Overview

Install and setup a substrate for machinic machines using [`envgen`](https://github.com/galencm/ma) tooling

A _substrate_ encompasses:

* nomad: 
    * to schedule, restart and persist processes
    * to automatically and dynamically assign host and port information if requested (xml attribute: `wireup` )
    * run nomad(and consul) via systemd and all other processes as nomad jobs rather than creating systemd services for every process

* consul:
    * for service discovery, nomad jobs are automatically discoverable
    * language bindings make service host and port lookups simple

* systemd:
    * always run nomad/consul as service on startup
    * a systemd service is optional: see ` start-machinic-session.sh` to run nomad and consul directly

## Quickstart
Clone the repo:
```
git clone https://github.com/galencm/machinic-env
```

Start services:
```
cd ~/machinic-env
./environment.sh
cd env
./install-machinic-services.sh
```

(Re)generate files from `environment.xml` using [`envgen`](https://github.com/galencm/ma) ( which calls [`gsl`](https://github.com/zeromq/gsl) for generation):
```
git clone https://github.com/galencm/ma
cd ~/ma/envgen
./envgen.sh ~/machinic-env/environment.xml ~/machinic-env
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
