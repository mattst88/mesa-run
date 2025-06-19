# mesa-run

A collection of scripts to build and test [Mesa](https://www.mesa3d.org/) without installing it.

## Scripts

- [nj](nj) - Run [ninja](https://github.com/ninja-build/ninja) from anywhere in the project git repository. (upstream: [nj repo](https://gitlab.freedesktop.org/kwg/nj))
- [mesa-run](mesa-run) - helper script. Not used directly.
- [mesa-debug](mesa-debug) - Debug build
- [mesa-debug-asan](mesa-debug-asan) - Debug build with [AddressSanitizer](https://github.com/google/sanitizers/wiki/AddressSanitizer)
- [mesa-debug-optimized](mesa-debug-optimized) - Debug build with optimization
- [mesa-release](mesa-release) - Release build
- [mesa-gdb](mesa-gdb) - Wrapper around `mesa-debug` that invokes `gdb`
- [deqp-run](deqp-run) - Run dEQP test suites
- [deqp-results-to-markdown](deqp-results-to-markdown) - Generate Markdown table of dEQP test suite results

## Examples

### Configure and build debug build

```console
$ mesa-debug configure
$ nj debug install
```

### Run program with local Mesa build

```console
$ mesa-debug glxinfo
```

### Run dEQP

On ChromeOS, `deqp-run` uses the system-provided `media-gfx/deqp` package. The script should be run from a directory that has space to store the output such as `/mnt/stateful_partition/home/root/`.

On desktop Linux, `deqp-run` should be run from a git checkout of [VK-GL-CTS](https://github.com/KhronosGroup/VK-GL-CTS/) with a build configured with `-DDEQP_TARGET=surfaceless` in `build/`.

#### Single test

```console
$ deqp-run dEQP-VK.graphicsfuzz.spv-stable-pillars-volatile-nontemporal-store
```

#### Test suite

```console
$ deqp-run vk
```

### Make Markdown table of dEQP test results

```console
$ deqp-results-to-markdown
```

#### Example output

|                  | Pass | Fail | Skip | Warn | Timeout | Flake |
| ---------------- | ---: | ---: | ---: | ---: | ------: | ----: |
| **dEQP-GLES2**   |14243| |26| | | |
| **dEQP-GLES3**   |42687| |113|2| | |
| **dEQP-GLES31**   |37576| |55| | | |
| **dEQP-VK**   |486602|2|590787|6|2|1|
