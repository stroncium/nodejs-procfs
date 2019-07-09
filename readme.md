# procfs [![Build Status](https://travis-ci.com/stroncium/nodejs-procfs.svg?branch=master)](https://travis-ci.com/stroncium/nodejs-procfs) [![codecov](https://codecov.io/gh/stroncium/nodejs-procfs/branch/master/graph/badge.svg)](https://codecov.io/gh/stroncium/nodejs-procfs)

Zero dependency library for reading and parsing various files from `procfs` for Node.js, implemented in pure JS.

Linux implements `procfs` filesystem mounted at `/proc`(usually). This filesystem is virtual, and can be used to extract various information about kernel state and running processes.

Compatible with releases of Linux since 4.4 SLTS. Attempts to support new features from all the following releases. Features which are deprecated/discontinued in latest releases are not supported. Some features aren't expected to be used from Node.js and so were not implemented, if you need to use some of them, please open a feature request.

## Example

//TODO

## API

Full version of API is available in [api.md](https://github.com/stroncium/nodejs-procfs/blob/master/api.md).

Currently, the folowing `procfs` paths are supported by the library:
 - `/proc/<pid>/autogroup` - [procfs.processAutogroup](api.md#processAutogroup-pid)
 - `/proc/<pid>/cgroups` - [procfs.processCgroups](api.md#processCgroups-pid)
 - `/proc/<pid>/cmdline` - [procfs.processCmdline](api.md#processCmdline-pid)
 - `/proc/<pid>/comm` - [procfs.processComm](api.md#processComm-pid)
 - `/proc/<pid>/cpuset` - [procfs.processCpuset](api.md#processCpuset-pid)
 - `/proc/<pid>/cwd` - [procfs.processCwd](api.md#processCwd-pid)
 - `/proc/<pid>/environ` - [procfs.processEnviron](api.md#processEnviron-pid)
 - `/proc/<pid>/exe` - [procfs.processExe](api.md#processExe-pid)
 - `/proc/<pid>/fd/*` - [procfs.processFds](api.md#processFds-pid)
 - `/proc/<pid>/fd/<fd>` - [procfs.processFd](api.md#processFd-fd-pid)
 - `/proc/<pid>/fdinfo/<fd>` - [procfs.processFdinfo](api.md#processFdinfo-fd-pid)
 - `/proc/<pid>/gid_map` - [procfs.processGidMap](api.md#processGidMap-pid)
 - `/proc/<pid>/io` - [procfs.processIo](api.md#processIo)
 - `/proc/<pid>/limits` - [procfs.processLimits](api.md#processLimits-pid)
 - `/proc/<pid>/mountinfo` - [procfs.processMountinfo](api.md#processMountinfo-pid)
 - `/proc/<pid>/oom_score` - [procfs.processOomScore](api.md#processOomScore-pid)
 - `/proc/<pid>/personality` - [procfs.processPersonality](api.md#processPersonality-pid)
 - `/proc/<pid>/setgroups` - [procfs.processSetgroups](api.md#processSetgroups-pid)
 - `/proc/<pid>/stat` - [procfs.processStat](api.md#processStat-pid)
 - `/proc/<pid>/statm` - [procfs.processStatm](api.md#processStatm-pid)
 - `/proc/<pid>/status` - [procfs.processStatus](api.md#processStatus-pid)
 - `/proc/<pid>/task/*` - [procfs.processThreads](api.md#processThreads-pid)
 - `/proc/<pid>/timerslack_ns` - [procfs.processTimerslackNs](api.md#processtimerslackns-pid)
 - `/proc/<pid>/uid_map` - [procfs.processUidMap](api.md#processUidMap-pid)
 - `/proc/cmdline` - [procfs.cmdline](api.md#cmdline)
 - `/proc/config.gz` - [procfs.config](api.md#config)
 - `/proc/cpuinfo` - [procfs.cpuinfo](api.md#cpuinfo)
 - `/proc/devices` - [procfs.devices](api.md#devices)
 - `/proc/diskstats` - [procfs.diskstats](api.md#diskstats)
 - `/proc/filesystems` - [procfs.filesystems](api.md#filesystems)
 - `/proc/loadavg` - [procfs.loadavg](api.md#loadavg)
 - `/proc/meminfo` - [procfs.meminfo](api.md#meminfo)
 - `/proc/partitions` - [procfs.partitions](api.md#partitions)
 - `/proc/stat` - [procfs.stat](api.md#stat)
 - `/proc/swaps` - [procfs.swaps](api.md#swaps)
 - `/proc/uptime` - [procfs.uptime](api.md#uptime)
 - `/proc/version` - [procfs.version](api.md#version)
 - `/proc/*` - [procfs.processes](api.md#processes)

## Performance
Good performance is considered one of the main goals of this library, but for some calls which aren't expected to be used frequently the parsing might be done in sub-optimal(but still quite performant) way. If you encounter a need for performance optimizations of some call, please open an issue.

Currently, all the IO is done synchronously, in most cases it is faster than asynchronous IO for `procfs`.
For many methods, synchronous IO is *always* faster than asynchronous, as time required to perform full read synchronously is smaller than *just initializing* asynchronous read structures. For others, it is on par. In case when a lot of relatively big files are read at the same time, asynchronous IO can be faster on multi-core systems, so introducing async versions of methods is considered for future versions.

## Development

`npm run test` to perform a test without updating docs nor type asserts.

`npm run fulltest` to `npm run build && npm run test`

`npm run build` builds `api.md` and type asserts for tests from `haxe/procfs/Procfs.hx`.
