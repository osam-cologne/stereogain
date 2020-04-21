# Stereo Gain

A stereo gain plugin with parameter smoothing

## Description

This stereo audio effect outputs the input signal with some gain or attenuation
adjustable between -90 and +30 dBFS.

The plugin relies on the host to provide a generic UI for parameter control.


## Formats

This audio effect supports a variety of audio and plug-in frameworks:

* [JACK] (stand-alone command line program)
* [LV2]
* [VST2]
* [LADSPA]


## Compiling

Make sure, you have installed the required build tools and libraries (see
section "Prerequisites" below) and the clone this repository (including
sub-modules) and simply run `make` in the project's root directory:

    $ git clone --recursive https://github.com/osamc-lv2-workshop/stereogain.git
    $ cd stereogain
    $ make


## Installation

After compilation has finished, copy the desired plug-in shared libraries or
bundles or the stand-alone program to the appropriate locations.

The makefile also provides an `install` target:

    make install

There is also an `install-user` target, to install the binaries in the proper
locations under the current user's home directory.

    make install-user


## Prerequisites

* The GCC C++ compiler and the usual associated software build tools
  (`make`, etc.).

  Debian / Ubuntu users should install the `build-essential` package
  to get these.

* [pkgconf]

The LV2, LADSPA and VST2 (vestige) headers are included in the [DPF] framework,
which is integrated as a Git sub-module. These need not be installed separately
to build the software in the respective plug-in formats. Some formats do have
additional dependencies, though:

* JACK client (stand-alone command line program): JACK development library
  and headers and pkgconf file.

  Debian / Ubuntu users should install the `libjack-dev` or `libjack-jackd2-dev`
  package to get these.

## License

This software is distributed under the MIT License.

See the file [LICENSE](LICENSE) for more information.


## Author

This software was put together by *Christopher Arndt*.


[cookiecutter-dpf-effect]: https://github.com/SpotlightKid/cookiecutter-dpf-effect
[DPF]: https://github.com/DISTRHO/DPF
[JACK]: https://jackaudio.org/
[LV2]: https://lv2plug.in/
[LADSPA]: http://www.ladspa.org/
[pkgconf]: https://github.com/pkgconf/pkgconf
[VST2]: https://en.wikipedia.org/wiki/Virtual_Studio_Technology
