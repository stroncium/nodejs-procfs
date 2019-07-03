## procfs

### processMounts ([pid])
Parses contents of `/proc/<pid>/mounts`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessMount](#type-processmount)>


### processMountinfo ([pid])
Parses contents of `/proc/<pid>/mountinfo`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessMountinfo](#type-processmountinfo)>


### processIo ([pid])
Parses contents of `/proc/<pid>/io`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessIo](#type-processio)


### processUidMap ([pid])
Parses contents of `/proc/<pid>/uid_map`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessIdMapEntry](#type-processidmapentry)>


### processGidMap ([pid])
Parses contents of `/proc/<pid>/gid_map`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessIdMapEntry](#type-processidmapentry)>


### processEnviron ([pid])
Parses contents of `/proc/<pid>/environ`
 - `pid` integer - Process pid, self process if omitted
 - returns object


### processOomScore ([pid])
Parses contents of `/proc/<pid>/oom_score`
 - `pid` integer - Process pid, self process if omitted
 - returns integer


### processTimerslackNs ([pid])
Parses contents of `/proc/<pid>/timerslack_ns`
 - `pid` integer - Process pid, self process if omitted
 - returns integer


### processCmdline ([pid])
Parses contents of `/proc/<pid>/cmdline`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<string>


### processAutogroup ([pid])
Parses contents of `/proc/<pid>/autogroup`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessAutogroup](#type-processautogroup)


### processStatm ([pid])
Parses contents of `/proc/<pid>/statm`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessStatm](#type-processstatm)


### processComm ([pid])
Parses contents of `/proc/<pid>/comm`
 - `pid` integer - Process pid, self process if omitted
 - returns string


### processSetgroups ([pid])
Parses contents of `/proc/<pid>/setgroups`
 - `pid` integer - Process pid, self process if omitted
 - returns string


### processCgroups ([pid])
Parses contents of `/proc/<pid>/cgroups`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessCgroup](#type-processcgroup)>


### processPersonality ([pid])
Parses contents of `/proc/<pid>/personality`
 - `pid` integer - Process pid, self process if omitted
 - returns integer


### processCpuset ([pid])
Parses contents of `/proc/<pid>/cpuset`
 - `pid` integer - Process pid, self process if omitted
 - returns string


### processLimits ([pid])
Parses contents of `/proc/<pid>/limits`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<[ProcessLimit](#type-processlimit)>


### processStat ([pid])
Parses contents of `/proc/<pid>/stat`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessStat](#type-processstat)


### processStatus ([pid])
Parses contents of `/proc/<pid>/status`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessStatus](#type-processstatus)


### processFds ([pid])
Lists process curent fds, `/proc/<pid>/fd/*`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<integer>


### processThreads ([pid])
Lists process curent threads, `/proc/<pid>/task/*`
 - `pid` integer - Process pid, self process if omitted
 - returns Array\<integer>


### processFdinfo (fd, [pid])
Parses contents of `/proc/<pid>/fdinfo/<fd>`
 - `fd` integer - fd in question
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessFdinfo](#type-processfdinfo)


### processFd (fd, [pid])
Parses contents of `/proc/<pid>/fd/<fd>`
 - `fd` integer - fd in question
 - `pid` integer - Process pid, self process if omitted
 - returns string


### processExe ([pid])
Parses contents of `/proc/<pid>/exe`
 - `pid` integer - Process pid, self process if omitted
 - returns [ProcessExe](#type-processexe)


### processCwd ([pid])
Parses contents of `/proc/<pid>/cwd`
 - `pid` integer - Process pid, self process if omitted
 - returns string


### cpuinfo ()
Parses contents of `/proc/cpuinfo`
 - returns Array\<[CpuCoreInfo](#type-cpucoreinfo)>


### loadavg ()
Parses contents of `/proc/loadavg`
 - returns [Loadavg](#type-loadavg)


### uptime ()
Parses contents of `/proc/uptime`
 - returns [Uptime](#type-uptime)


### version ()
Parses contents of `/proc/version`
 - returns string


### cmdline ()
Parses contents of `/proc/cmdline`
 - returns string


### swaps ()
Parses contents of `/proc/swaps`
 - returns Array\<[Swap](#type-swap)>


### stat ()
Parses contents of `/proc/stat`
 - returns [Stat](#type-stat)


### devices ()
Parses contents of `/proc/devices`
 - returns Array\<[Device](#type-device)>


### filesystems ()
Parses contents of `/proc/filesystems`
 - returns Array\<[Filesystem](#type-filesystem)>


### diskstats ()
Parses contents of `/proc/diskstats`
 - returns Array\<[Diskstat](#type-diskstat)>


### partitions ()
Parses contents of `/proc/partitions`
 - returns Array\<[Partition](#type-partition)>


### meminfo ()
Parses contents of `/proc/meminfo`
 - returns [Meminfo](#type-meminfo)


### processes ()
Lists currently running processes pids, `/proc/*`
 - returns Array\<integer>


### config ()
Gets gunziped content of `/proc/config`
 - returns string


## type Path
Path string
Type: string


## type DevId
Device ID. Major and minor parts can be extracted using utility functions `devIdGetMinor`, `devIdGetMajor` and combined using `devIdFromMajorMinor`.
Type: integer


## type ProcessMount
Object with properties:
 - `file` [Path](#type-path)
 - `freq` integer
 - `mntops` Array\<string>
 - `passno` integer
 - `spec` string
 - `vfstype` string


## type ProcessMountinfo
Object with properties:
 - `devId` [DevId](#type-devid)
 - `mountId` integer
 - `mountOptions` Array\<string>
 - `mountPoint` [Path](#type-path)
 - `mountSource` string
 - `optionalFields` Array\<string>
 - `parentId` integer
 - `root` string
 - `superOptions` Array\<string>
 - `type` string


## type ProcessIo
Object with properties:
 - `cancelledWrite` integer
 - `read` integer
 - `readSyscalls` integer
 - `realRead` integer
 - `realWrite` integer
 - `write` integer
 - `writeSyscalls` integer


## type ProcessIdMapEntry
Object with properties:
 - `destinationStart` integer
 - `length` integer
 - `sourceStart` integer


## type ProcessAutogroup
Object with properties:
 - `name` string
 - `nice` integer


## type ProcessStatm
Object with properties:
 - `data` integer
 - `resident` integer
 - `shared` integer
 - `size` integer
 - `text` integer


## type ProcessCgroup
Object with properties:
 - `group` string
 - `id` integer
 - `subsystems` Array\<string>


## type ProcessLimit
Object with properties:
 - `name` string
 - *optional* `hard` integer
 - *optional* `soft` integer
 - *optional* `units` string


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


## type ProcessStatus
Object with properties:
 - `capabilityAmbient` string
 - `capabilityBounding` string
 - `capabilityEffective` string
 - `capabilityInheritable` string
 - `capabilityPermitted` string
 - `contextSwitchesNonvoluntary` integer
 - `contextSwitchesVoluntary` integer
 - `coreDumping` Bool
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
 - `noNewPrivs` Bool
 - `numaGroupId` integer
 - `parent` integer
 - `pid` integer
 - `rssAnon` integer
 - `rssFile` integer
 - `rssShmem` integer
 - `seccompMode` integer
 - `sharedSignalsPending` integer
 - `signalsBlocked` string
 - `signalsCaught` string
 - `signalsIgnored` string
 - `signalsPending` integer
 - `signalsQueued` integer
 - `signalsQueuedLimit` integer
 - `speculationStoreBypass` string
 - `state` string
 - `threadGroupId` integer
 - `threads` integer
 - `tracer` integer
 - `uidEffective` integer
 - `uidFilesystem` integer
 - `uidReal` integer
 - `uidSavedSet` integer
 - `umask` integer
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
 - `fpu` Bool
 - `fpuException` Bool
 - `id` integer
 - `initialApicId` integer
 - `microcode` string
 - `model` integer
 - `modelName` string
 - `physicalId` integer
 - `siblings` integer
 - `stepping` integer
 - `vendorId` string
 - `wp` Bool


## type Loadavg
Object with properties:
 - `existingEntities` Float
 - `jobsAvg15Min` Float
 - `jobsAvg1Min` Float
 - `jobsAvg5Min` Float
 - `mostRecentlyCreatedPid` Float
 - `runnableEntities` Float


## type Uptime
Object with properties:
 - `idle` Float
 - `time` Float


## type Swap
Object with properties:
 - `filename` [Path](#type-path)
 - `priority` integer
 - `size` integer
 - `type` string
 - `used` integer


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


## type Device
Object with properties:
 - `group` string - Group name
 - `major` integer - Device ID major part
 - `type` string - `character` or `block`


## type Filesystem
Object with properties:
 - `name` string
 - `requiresBlockDevice` Bool


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


## type Partition
Object with properties:
 - `blocks` integer
 - `devId` [DevId](#type-devid)
 - `name` string


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
 - `kernelReclaimable` integer
 - `kernelStack` integer
 - `mapped` integer
 - `pageTables` integer
 - `shmem` integer
 - `shmemHugePages` integer
 - `shmemPmdMapped` integer
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


## type ProcessFdinfoEpollCounter
Object with properties:
 - `data` string
 - `eventMask` integer
 - `fd` integer


## type ProcessFdinfoInotifyFile
Object with properties:
 - `deviceId` integer
 - `ignoredMask` integer
 - `inode` integer
 - `mask` integer
 - `wd` integer


## type ProcessFdinfoFanotifyMark
Object with properties:
 - `deviceId` integer
 - `flags` integer
 - `ignoredMask` integer
 - `inode` integer
 - `mask` integer


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


## type ProcessExe
Object with properties:
 - `deleted` Bool
 - `path` string


