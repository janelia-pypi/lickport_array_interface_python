# Description

-   **Name:** lickport\_array\_interface\_python
-   **Version:** 1.0.0
-   **License:** BSD 3-Clause License
-   **URL:** <https://github.com/janelia-pypi/lickport_array_interface_python>
-   **Author:** Peter Polidoro
-   **Email:** peter@polidoro.io
    
    This Python package (lickport\_array\_interface)


## Example Usage

```python

from lickport_array_interface import LickportArrayInterface
dev = LickportArrayInterface() # Try to automatically detect port
dev = LickportArrayInterface(port='/dev/ttyACM0') # Linux specific port
dev = LickportArrayInterface(port='/dev/tty.usbmodem262471') # Mac OS X specific port
dev = LickportArrayInterface(port='COM3') # Windows specific port

data_path_string = '~/lickport_array_data/data_file'

dev.start_acquiring_data()
dev.start_saving_data(data_path_string)
dev.stop_saving_data()
dev.stop_acquiring_data()

dev.controller.dispense_lickport_for_duration(0,200)
dev.controller.dispense_lickports_for_duration([0,1],200)
dev.controller.dispense_all_lickports_for_duration(200)
dev.controller.get_activated_lickports()
dev.controller.activate_only_lickport(0)
dev.controller.activate_only_lickports([0,1])
dev.controller.activate_lickport(0)
dev.controller.activate_lickports([0,1])
dev.controller.deactivate_lickport(0)
dev.controller.deactivate_lickports([0,1])
dev.controller.activate_all_lickports()
dev.controller.deactivate_all_lickports()

```


# Data

    
    time,millis,lickport_0,lickport_1,lickport_2,lickport_3,lickport_4,lickport_5,lickport_6,lickport_7,lickport_8,lickport_9,lickport_10,lickport_11
    1649700627,12084104,,,,,,,,,,,L,
    1649700628,12085195,L,,,,,,,,,,,
    1649700628,12085749,,,,,,,,,,,,L


## time

time in seconds since the epoch

The epoch is the point where the time starts, and is platform dependent. For Unix, the epoch is January 1, 1970, 00:00:00 (UTC)

The term seconds since the epoch refers to the total number of elapsed seconds since the epoch, typically excluding leap seconds. Leap seconds are excluded from this total on all POSIX-compliant platforms.


## millis

The number of milliseconds passed since the LickportArrayController board was powered. This number will overflow (go back to zero), after approximately 50 days.


## lickport\_n

| Symbol       | Meaning                                         |
|------------ |----------------------------------------------- |
| "L"          | lickport\_n lick detected                       |
| "A"          | lickport\_n activated                           |
| "LA" or "AL" | lickport\_n lick detected and activated         |
| ""           | lickport\_n neither lick detected nor activated |


# Installation

<https://github.com/janelia-pypi/python_setup>


## Linux and Mac OS X

```sh

python3 -m venv ~/venvs/lickport_array_interface
source ~/venvs/lickport_array_interface/bin/activate
pip install lickport_array_interface

```


## Windows

```sh

python3 -m venv C:\venvs\lickport_array_interface
C:\venvs\lickport_array_interface\Scripts\activate
pip install lickport_array_interface

```


## Guix

```sh

git clone https://github.com/janelia-pypi/lickport_array_interface_python
cd lickport_array_interface_python
guix time-machine -C channels.scm -- shell --pure -f guix.scm python-ipython
ipython

```


# Development


## Guix

```sh

git clone https://github.com/janelia-pypi/lickport_array_interface_python
cd lickport_array_interface_python
guix time-machine -C channels.scm -- shell --pure -D -f guix.scm
python3 setup.py sdist bdist_wheel
twine upload dist/*
git add --all
git clean -xdf
exit

```