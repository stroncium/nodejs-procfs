## procfs

### processMountinfo ([pid])
Parses contents of `/proc/<pid>/mountinfo`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<[ProcessMountinfo](#type-processmountinfo)>
---


### processIo ([pid])
Parses contents of `/proc/<pid>/io`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessIo](#type-processio)
---


### processUidMap ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/uid_map`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<[ProcessIdMapEntry](#type-processidmapentry)>
---


### processGidMap ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/gid_map`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<[ProcessIdMapEntry](#type-processidmapentry)>
---


### processEnviron ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/environ`
 - `pid` integer: Process pid, self process if omitted
 - returns object
---


### processOomScore ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/oom_score`
 - `pid` integer: Process pid, self process if omitted
 - returns integer
---


### processTimerslackNs ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/timerslack_ns`
 - `pid` integer: Process pid, self process if omitted
 - returns integer
---


### processCmdline ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/cmdline`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<string>
---


### processAutogroup ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/autogroup`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessAutogroup](#type-processautogroup)
---


### processStatm ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/statm`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessStatm](#type-processstatm)
---


### processComm ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/comm`
 - `pid` integer: Process pid, self process if omitted
 - returns string
---


### processSetgroups ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/setgroups`
 - `pid` integer: Process pid, self process if omitted
 - returns string
---


### processCgroups ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/cgroups`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<[ProcessCgroup](#type-processcgroup)>
---


### processPersonality ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/personality`
 - `pid` integer: Process pid, self process if omitted
 - returns integer
---


### processCpuset ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/cpuset`
 - `pid` integer: Process pid, self process if omitted
 - returns string
---


### processLimits ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/limits`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<[ProcessLimit](#type-processlimit)>
---


### processStat ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/stat`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessStat](#type-processstat)
---


### processStatus ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/status`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessStatus](#type-processstatus)
---


### processFds ([pid])
⚠️ **unstable**
Lists process curent fds, `/proc/<pid>/fd/*`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<integer>
---


### processThreads ([pid])
⚠️ **unstable**
Lists process curent threads, `/proc/<pid>/task/*`
 - `pid` integer: Process pid, self process if omitted
 - returns Array\<integer>
---


### processFdinfo (fd, [pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/fdinfo/<fd>`
 - `fd` integer: fd in question
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessFdinfo](#type-processfdinfo)
---


### processFd (fd, [pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/fd/<fd>`
 - `fd` integer: fd in question
 - `pid` integer: Process pid, self process if omitted
 - returns string
---


### processExe ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/exe`
 - `pid` integer: Process pid, self process if omitted
 - returns [ProcessExe](#type-processexe)
---


### processCwd ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/cwd`
 - `pid` integer: Process pid, self process if omitted
 - returns string
---


### cpuinfo ()
⚠️ **unstable**
Parses contents of `/proc/cpuinfo`
 - returns Array\<[CpuCoreInfo](#type-cpucoreinfo)>
---


### loadavg ()
⚠️ **unstable**
Parses contents of `/proc/loadavg`
 - returns [Loadavg](#type-loadavg)
---


### uptime ()
⚠️ **unstable**
Parses contents of `/proc/uptime`
 - returns [Uptime](#type-uptime)
---


### version ()
⚠️ **unstable**
Parses contents of `/proc/version`
 - returns string
---


### cmdline ()
⚠️ **unstable**
Parses contents of `/proc/cmdline`
 - returns string
---


### swaps ()
⚠️ **unstable**
Parses contents of `/proc/swaps`
 - returns Array\<[Swap](#type-swap)>
---


### stat ()
⚠️ **unstable**
Parses contents of `/proc/stat`
 - returns [Stat](#type-stat)
---


### devices ()
⚠️ **unstable**
Parses contents of `/proc/devices`
 - returns Array\<[Device](#type-device)>
---


### filesystems ()
⚠️ **unstable**
Parses contents of `/proc/filesystems`
 - returns Array\<[Filesystem](#type-filesystem)>
---


### diskstats ()
⚠️ **unstable**
Parses contents of `/proc/diskstats`
 - returns Array\<[Diskstat](#type-diskstat)>
---


### partitions ()
⚠️ **unstable**
Parses contents of `/proc/partitions`
 - returns Array\<[Partition](#type-partition)>
---


### meminfo ()
⚠️ **unstable**
Parses contents of `/proc/meminfo`
 - returns [Meminfo](#type-meminfo)
---


### processes ()
Parses list of `/proc/*` entries
 - returns Array\<integer>: pids of currently running processes
---


### config ()
Available if the kernel is configured with `CONFIG_IKCONFIG_PROC`
 - returns string: gunziped content of `/proc/config.gz`
---


### devIdGetMinor (devId)
 - `devId` [DevId](#type-devid)
 - returns integer: minor part of devId
---


### devIdGetMajor (devId)
 - `devId` [DevId](#type-devid)
 - returns integer: major part of devId
---


### devIdFromMajorMinor (major, minor)
 - `major` integer: major part of DevId
 - `minor` integer: minor part of DevId
 - returns [DevId](#type-devid): id combined from major and minor parts
---


## type Path
Path string

Type: string

***


## type DevId
Device ID. Major and minor parts can be extracted using utility functions `procfs.devIdGetMinor`, `procfs.devIdGetMajor` and combined using `procfs.devIdFromMajorMinor`.

Type: integer

***


## type ProcessMountinfo
Object with properties:
 - `devId` [DevId](#type-devid) : value of st_dev for files on this filesystem
 - `mountId` integer : unique ID for the mount (may be reused after umount)
 - `mountOptions` Array\<string> : per-mount options
 - `mountPoint` [Path](#type-path) : pathname of the mount point relative to the process's root directory
 - `mountSource` string : filesystem-specific information or "none"
 - `optionalFields` Array\<string> : zero or more fields of the form "tag[:value]"
 - `parentId` integer : ID of the parent mount (or of self for the root of  this  mount  namespace's mount tree)
 - `root` string : pathname of the directory in the filesystem which forms the root of this mount
 - `superOptions` Array\<string> : per-superblock options
 - `type` string : filesystem type in the form "type[.subtype]"

***


## type ProcessIo
Object with properties:
 - `read` integer : `rchar`, number of bytes read
 - `readReal` integer : `read_bytes`, number of bytes read which were really fetched from storage layer
 - `readSyscalls` integer : `syscr`, number of read syscalls
 - `write` integer : `wchar`, number of bytes written
 - `writeCancelled` integer : `cancelled_write_bytes`, number of bytes process caused to not be written
 - `writeReal` integer : `write_bytes`, number of bytes written which were really sent to storage layer
 - `writeSyscalls` integer : `syscw`, number of write syscalls

***


## type ProcessIdMapEntry
Object with properties:
 - `length` integer : length of the range of IDs that is mapped between the two user namespaces
 - `start` integer : start of the range of IDs to which the IDs do map
Interpretation depends on whether the process that opened and the target process pid are in the same user namespace.
If the two processes are in different user namespaces, it is the start of a range of IDs in the user namespace of the process that opened the file
If the two processes are in the same user namespace it is the start of the range of IDs in the parent user namespace of target process.
 - `targetStart` integer : start of the range of IDs in the user namespace of the target process

***


## type ProcessAutogroup
Object with properties:
 - `name` string
 - `nice` integer

***


## type ProcessStatm
Object with properties:
 - `data` integer
 - `resident` integer
 - `shared` integer
 - `size` integer
 - `text` integer

***


## type ProcessCgroup
Object with properties:
 - `group` string
 - `id` integer
 - `subsystems` Array\<string>

***


## type ProcessLimit
Object with properties:
 - `name` string
 - *optional* `hard` integer
 - *optional* `soft` integer
 - *optional* `units` string

***


## type ProcessStat
Object with properties:
 - `blockIoTicks` integer
 - `childGuestTicks` integer
 - `childKernelTicks` integer
 - `childMajorFaults` integer
 - `childMinorFaults` integer
 - `childUserTicks` integer
 - `comm` string
 - `exitSignal` integer
 - `flags` integer
 - `guestTicks` integer
 - `kernelTicks` integer
 - `lastCpu` integer
 - `majorFaults` integer
 - `minorFaults` integer
 - `nice` integer
 - `parent` integer
 - `pid` integer
 - `priority` integer
 - `processGroup` integer
 - `realtimePriority` integer
 - `rss` integer
 - `rssSoftLimit` Float
 - `schedulingPolicy` integer
 - `session` integer
 - `startTicks` integer
 - `state` string
 - `terminalProcessGroup` integer
 - `threads` integer
 - `tty` integer
 - `userTicks` integer
 - `vsize` integer

***


## type ProcessStatus
Object with properties:
 - `capabilityAmbient` string
 - `capabilityBounding` string
 - `capabilityEffective` string
 - `capabilityInheritable` string
 - `capabilityPermitted` string
 - `contextSwitchesNonvoluntary` integer
 - `contextSwitchesVoluntary` integer
 - `cpusAllowedMask` integer
 - `fdSize` integer
 - `gidEffective` integer
 - `gidFilesystem` integer
 - `gidReal` integer
 - `gidSavedSet` integer
 - `groups` Array\<integer>
 - `hugetlbPagesSize` integer
 - `memoriesAllowedMask` integer
 - `name` string
 - `numaGroupId` integer
 - `parent` integer
 - `pid` integer
 - `seccompMode` integer
 - `sharedSignalsPending` integer
 - `signalsBlocked` string
 - `signalsCaught` string
 - `signalsIgnored` string
 - `signalsPending` integer
 - `signalsQueued` integer
 - `signalsQueuedLimit` integer
 - `state` string
 - `threadGroupId` integer
 - `threads` integer
 - `tracer` integer
 - `uidEffective` integer
 - `uidFilesystem` integer
 - `uidReal` integer
 - `uidSavedSet` integer
 - `vmData` integer
 - `vmExe` integer
 - `vmHwm` integer
 - `vmLib` integer
 - `vmLocked` integer
 - `vmPeak` integer
 - `vmPinned` integer
 - `vmPte` integer
 - `vmRss` integer
 - `vmSize` integer
 - `vmStack` integer
 - `vmSwap` integer
 - *optional* `coreDumping` boolean : Available since Linux 4.15
 - *optional* `noNewPrivs` boolean : Available since Linux 4.10
 - *optional* `rssAnon` integer : Available since Linux 4.5
 - *optional* `rssFile` integer : Available since Linux 4.5
 - *optional* `rssShmem` integer : Available since Linux 4.5
 - *optional* `speculationStoreBypass` string : Available since Linux 4.17
 - *optional* `umask` integer : Available since Linux 4.7

***


## type CpuCoreInfo
Object with properties:
 - `addressSizes` string
 - `apicId` integer
 - `bogoMips` integer
 - `bugs` Array\<string>
 - `cacheAlignment` integer
 - `cacheSize` string
 - `clflushSize` integer
 - `coreId` integer
 - `cores` integer
 - `cpuMhz` Float
 - `cpuidLevel` integer
 - `family` integer
 - `flags` Array\<string>
 - `fpu` boolean
 - `fpuException` boolean
 - `id` integer
 - `initialApicId` integer
 - `microcode` string
 - `model` integer
 - `modelName` string
 - `physicalId` integer
 - `siblings` integer
 - `stepping` integer
 - `vendorId` string
 - `wp` boolean

***


## type Loadavg
Object with properties:
 - `existingEntities` Float
 - `jobsAvg15Min` Float
 - `jobsAvg1Min` Float
 - `jobsAvg5Min` Float
 - `mostRecentlyCreatedPid` Float
 - `runnableEntities` Float

***


## type Uptime
Object with properties:
 - `idle` Float
 - `time` Float

***


## type Swap
Object with properties:
 - `filename` [Path](#type-path)
 - `priority` integer
 - `size` integer
 - `type` string
 - `used` integer

***


## type StatCpuTime
Object with properties:
 - `guest` integer
 - `guestNice` integer
 - `idle` integer
 - `iowait` integer
 - `irq` integer
 - `nice` integer
 - `softirq` integer
 - `steal` integer
 - `system` integer
 - `user` integer

***


## type Stat
Object with properties:
 - `bootTime` Date
 - `contextSwitches` integer
 - `cpuTime` Array\<[StatCpuTime](#type-statcputime)>
 - `interrupts` integer
 - `numberedInterrupts` Array\<integer>
 - `numberedSoftInterrupts` Array\<integer>
 - `processes` integer
 - `processesBlocking` integer
 - `processesRunning` integer
 - `softInterrupts` integer
 - `systemCpuTime` [StatCpuTime](#type-statcputime)
 - *optional* `pageIn` integer
 - *optional* `pageOut` integer
 - *optional* `swapIn` integer
 - *optional* `swapOut` integer

***


## type Device
Object with properties:
 - `group` string : Group name
 - `major` integer : Device ID major part
 - `type` string : `character` or `block`

***


## type Filesystem
Object with properties:
 - `name` string
 - `requiresBlockDevice` boolean

***


## type Diskstat
Object with properties:
 - `currentIoCount` integer
 - `ioTime` integer
 - `major` integer
 - `minor` integer
 - `name` string
 - `readTime` integer
 - `reads` integer
 - `readsMerged` integer
 - `sectorsRead` integer
 - `sectorsWriten` integer
 - `weightedIoTime` integer
 - `writeTime` integer
 - `writes` integer
 - `writesMerged` integer

***


## type Partition
Object with properties:
 - `blocks` integer
 - `devId` [DevId](#type-devid)
 - `name` string

***


## type Meminfo
Object with properties:
 - `active` integer
 - `anonHugePages` integer
 - `anonPages` integer
 - `available` integer
 - `bounceBuffers` integer
 - `buffers` integer
 - `cached` integer
 - `commitLimit` integer
 - `directMap1G` integer
 - `directMap2M` integer
 - `directMap4K` integer
 - `directMap4M` integer
 - `dirty` integer
 - `free` integer
 - `hardwareCorrupted` integer
 - `hugepageSize` integer
 - `hugepagesFree` integer
 - `hugepagesReserved` integer
 - `hugepagesSurplus` integer
 - `hugepagesTotal` integer
 - `inactive` integer
 - `kernelStack` integer
 - `mapped` integer
 - `pageTables` integer
 - `shmem` integer
 - `slab` integer
 - `slabReclaimable` integer
 - `slabUnreclaimable` integer
 - `swapCached` integer
 - `swapFree` integer
 - `swapTotal` integer
 - `total` integer
 - `vmallocTotal` integer
 - `writeback` integer
 - `writebackTmp` integer
 - *optional* `kernelReclaimable` integer : Available since Linux 4.20
 - *optional* `shmemHugePages` integer : Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`
 - *optional* `shmemPmdMapped` integer : Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`

***


## type ProcessFdinfoEpollCounter
Object with properties:
 - `data` string
 - `eventMask` integer
 - `fd` integer

***


## type ProcessFdinfoInotifyFile
Object with properties:
 - `deviceId` integer
 - `ignoredMask` integer
 - `inode` integer
 - `mask` integer
 - `wd` integer

***


## type ProcessFdinfoFanotifyMark
Object with properties:
 - `deviceId` integer
 - `flags` integer
 - `ignoredMask` integer
 - `inode` integer
 - `mask` integer

***


## type ProcessFdinfo
Object with properties:
 - `flags` integer
 - `mntId` integer
 - `pos` integer
 - `type` string
 - *optional* `epollCounters` Array\<[ProcessFdinfoEpollCounter](#type-processfdinfoepollcounter)>
 - *optional* `eventfdCounter` integer
 - *optional* `fanotifyEventFlags` integer
 - *optional* `fanotifyFlags` integer
 - *optional* `fanotifyMarks` Array\<[ProcessFdinfoFanotifyMark](#type-processfdinfofanotifymark)>
 - *optional* `inotifyFiles` Array\<[ProcessFdinfoInotifyFile](#type-processfdinfoinotifyfile)>
 - *optional* `rtSignalMask` integer
 - *optional* `signalMask` integer
 - *optional* `timerClockId` integer
 - *optional* `timerInterval` Array\<integer>
 - *optional* `timerSettimeFlags` integer
 - *optional* `timerTicks` integer
 - *optional* `timerValue` Array\<integer>

***


## type ProcessExe
Object with properties:
 - `deleted` boolean
 - `path` string

***


