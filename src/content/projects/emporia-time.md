---
title: emporia-time
description: an energy aware time command
repo: https://github.com/zimeg/emporia-time
order: 7
---

this project was motivated by wanting to measure the overall energy consumption
and efficiency of programs.

it uses a simple approach that sums the total power used over the duration of a
command, which is energy.

measurements are taken from the wall outlet a computer is plugged into using
[this smart plug][plug].

i wish i had sponsorship or an affiliate link for this.

## some example usage

outputs of `etime` are similar to the standard `time` command. only information
about energy measurements is added.

nuances of the program are detailed in [the project description][readme].

interesting measurements to make might include sorting programs or the idle
baseline of a system:

```sh
$ ./etime sleep 12
       12.00 real         0.00 user         0.00 sys
      922.63 joules      76.87 watts      100.0% sure
```

## hacking the hardware

the plug taking measurements probably wasn't meant to be polled.

this is most apparent in occasional missing values from api responses, hence the
sureness score.

and also the lack of official documentation.

but being an api that can be accessed from the web, the
[endpoints were documented][endpoints] anyways and are now relied upon.

## understanding energy and power

the original maintainer of this project had forgotten the difference between
measurements of energy and power.

values for power were initially shown as energy in joules.

a constant energy value for commands of different durations seemed expected for
some reason.

the maintainer is now humbly aware of this difference.

[endpoints]: https://github.com/magico13/PyEmVue/blob/master/api_docs.md#api-documentation
[plug]: https://www.emporiaenergy.com/emporia-smart-plug
[readme]: https://github.com/zimeg/emporia-time#program-information
