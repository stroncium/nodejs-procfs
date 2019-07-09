## procfs

### processMountinfo ([pid])
Parses contents of `/proc/<pid>/mountinfo`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<[ProcessMountinfo](#type-processmountinfo)>
---


### processIo ([pid])
Parses contents of `/proc/<pid>/io`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessIo](#type-processio)
---


### processUidMap ([pid])
Parses contents of `/proc/<pid>/uid_map`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<[ProcessIdMapRange](#type-processidmaprange)>
---


### processGidMap ([pid])
Parses contents of `/proc/<pid>/gid_map`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<[ProcessIdMapRange](#type-processidmaprange)>
---


### processEnviron ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/environ`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns object
---


### processOomScore ([pid])
Parses contents of `/proc/<pid>/oom_score`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns integer: current score that the kernel gives to this process for the purpose of selecting a process for the OOM-killer
---


### processTimerslackNs ([pid])
Parses contents of `/proc/<pid>/timerslack_ns`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns integer: process's "current" timer slack value, in nanoseconds
---


### processCmdline ([pid])
Parses contents of `/proc/<pid>/cmdline`
		Complete list of command-line arguments for the process, unless the process is a zombie. In the latter case, `null`.
		Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<string>
---


### processAutogroup ([pid])
Parses contents of `/proc/<pid>/autogroup`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessAutogroup](#type-processautogroup)
---


### processStatm ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/statm`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessStatm](#type-processstatm)
---


### processComm ([pid])
Parses contents of `/proc/<pid>/comm`
		Note: different threads in the same process may have different comm values
 - **`pid`** integer: process pid, `self` process if undefined
 - returns string: the command name associated with the process
---


### processSetgroups ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/setgroups`
		Returns `"allow"` if processes in the user namespace that contains the target process are permitted to employ the `setgroups` system call, `"deny"` otherwise.
		Note: regardless of the value, calls to `setgroups` are also not permitted if `/proc/[pid]/gid_map` has not yet been set.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns string: `allow` or `deny`

---


### processCgroups ([pid])
Parses contents of `/proc/<pid>/cgroups`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<[ProcessCgroup](#type-processcgroup)>: control groups to which the process belongs
---


### processPersonality ([pid])
Parses contents of `/proc/<pid>/personality`
		Process's execution domain, as set by `personality`.
		Note: permission to access this file is governed by ptrace access mode `PTRACE_MODE_ATTACH_FSCREDS`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns integer
---


### processCpuset ([pid])
Parses contents of `/proc/<pid>/cpuset`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns string: path of the process's cpuset directory relative to the root of the cpuset filesystem
---


### processLimits ([pid])
Parses contents of `/proc/<pid>/limits`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<[ProcessLimit](#type-processlimit)>: process's resource limits
---


### processStat ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/stat`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessStat](#type-processstat)
---


### processStatus ([pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/status`
		Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessStatus](#type-processstatus)
---


### processFds ([pid])
Parses list of `/proc/<pid>/fd/*` entries.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<integer>: process's current open fds
---


### processThreads ([pid])
Parses list of `/proc/<pid>/task/*` entries.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns Array\<integer>: process's current threads
---


### processFdinfo (fd, [pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/fdinfo/<fd>`
 - **`fd`** integer: fd in question
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessFdinfo](#type-processfdinfo)
---


### processFd (fd, [pid])
⚠️ **unstable**
Parses contents of `/proc/<pid>/fd/<fd>`
 - **`fd`** integer: fd in question
 - **`pid`** integer: process pid, `self` process if undefined
 - returns string
---


### processExe ([pid])
Reads symlink at `/proc/<pid>/exe`
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [ProcessExe](#type-processexe)
---


### processCwd ([pid])
Reads symlink at `/proc/<pid>/cwd`
		Note: in a multithreaded process, it is not available if the main thread has already terminated.
		Note: permission to read this file(symlink) is governed by ptrace access mode `PTRACE_MODE_READ_FSCREDS`.
 - **`pid`** integer: process pid, `self` process if undefined
 - returns [Path](#type-path): path to process `cwd`
---


### cpuinfo ()
⚠️ **unstable**
Parses contents of `/proc/cpuinfo`
 - returns Array\<[CpuCoreInfo](#type-cpucoreinfo)>
---


### loadavg ()
Parses contents of `/proc/loadavg`
 - returns [Loadavg](#type-loadavg)
---


### uptime ()
Parses contents of `/proc/uptime`
 - returns [Uptime](#type-uptime)
---


### version ()
Parses contents of `/proc/version`
		Note: includes the contents of `/proc/sys/kernel/ostype`, `/proc/sys/kernel/osrelease` and `/proc/sys/kernel/version`.
 - returns string: identifies the kernel version that is currently running
---


### cmdline ()
Parses contents of `/proc/cmdline`
 - returns string: arguments passed to the Linux kernel at boot time
---


### swaps ()
Parses contents of `/proc/swaps`
 - returns Array\<[Swap](#type-swap)>: swap areas in use
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
Parses contents of `/proc/filesystems`
 - returns Array\<[Filesystem](#type-filesystem)>: filesystems which are supported by the kernel(which were compiled into the kernel or whose kernel modules are currently loaded)
---


### diskstats ()
⚠️ **unstable**
Parses contents of `/proc/diskstats`
 - returns Array\<[Diskstat](#type-diskstat)>
---


### partitions ()
Parses contents of `/proc/partitions`
 - returns Array\<[Partition](#type-partition)>: partitions in system
---


### meminfo ()
⚠️ **unstable**
Parses contents of `/proc/meminfo`
 - returns [Meminfo](#type-meminfo)
---


### processes ()
Parses list of `/proc/*` entries.
		Depending on `hidepid` option `procfs` was mounted with, may only contain user's own processes.
 - returns Array\<integer>: pids of currently running processes
---


### config ()
Available if the kernel is configured with `CONFIG_IKCONFIG_PROC`
 - returns string: gunziped content of `/proc/config.gz`
---


### cgroups ()
 - returns Array\<[CgroupController](#type-cgroupcontroller)>: controllers that are compiled into the kernel
---


### devIdGetMinor (devId)
 - **`devId`** [DevId](#type-devid)
 - returns integer: minor part of devId
---


### devIdGetMajor (devId)
 - **`devId`** [DevId](#type-devid)
 - returns integer: major part of devId
---


### devIdFromMajorMinor (major, minor)
 - **`major`** integer: major part of DevId
 - **`minor`** integer: minor part of DevId
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
 - **`devId`** [DevId](#type-devid) : value of st_dev for files on this filesystem
 - **`mountId`** integer : unique ID for the mount (may be reused after umount)
 - **`mountOptions`** Array\<string> : per-mount options
 - **`mountPoint`** [Path](#type-path) : pathname of the mount point relative to the process's root directory
 - **`mountSource`** string : filesystem-specific information or "none"
 - **`optionalFields`** Array\<string> : zero or more fields of the form "tag[:value]"
 - **`parentId`** integer : ID of the parent mount (or of self for the root of this mount namespace's mount tree)
 - **`root`** string : pathname of the directory in the filesystem which forms the root of this mount
 - **`superOptions`** Array\<string> : per-superblock options
 - **`type`** string : filesystem type in the form "type[.subtype]"

***


## type ProcessIo
Object with properties:
 - **`read`** integer : `rchar`, number of bytes read
 - **`readReal`** integer : `read_bytes`, number of bytes read which were really fetched from storage layer
 - **`readSyscalls`** integer : `syscr`, number of read syscalls
 - **`write`** integer : `wchar`, number of bytes written
 - **`writeCancelled`** integer : `cancelled_write_bytes`, number of bytes process caused to not be written
 - **`writeReal`** integer : `write_bytes`, number of bytes written which were really sent to storage layer
 - **`writeSyscalls`** integer : `syscw`, number of write syscalls

***


## type ProcessIdMapRange
Object with properties:
 - **`length`** integer : length of the range of IDs that is mapped between the two user namespaces
 - **`start`** integer : start of the range of IDs to which the IDs do map
Interpretation depends on whether the process that opened and the target process pid are in the same user namespace.
If the two processes are in different user namespaces, it is the start of a range of IDs in the user namespace of the process that opened the file
If the two processes are in the same user namespace it is the start of the range of IDs in the parent user namespace of target process.
 - **`targetStart`** integer : start of the range of IDs in the user namespace of the target process

***


## type ProcessAutogroup
Object with properties:
 - **`name`** string : autogroup name
 - **`nice`** integer : autogroup nice value

***


## type ProcessStatm
Object with properties:
 - **`data`** integer
 - **`resident`** integer
 - **`shared`** integer
 - **`size`** integer
 - **`text`** integer

***


## type ProcessCgroup
Object with properties:
 - **`hierarchyId`** integer : `hierarchy-ID`, for cgroups version 1 hierarchies, this field contains a unique hierarchy ID number that can be matched to a hierarchy ID in /proc/cgroups. For the cgroups version 2 hierarchy, this field contains the value 0.
 - **`path`** string : `cgroup-path`, pathname of the control group in the hierarchy to which the process belongs. This pathname is relative to the mount point of the hierarchy.
 - *optional* **`controllers`** Array\<string> : `controller-list`. For cgroups version 1 hierarchies, this field contains a comma-separated list of the controllers bound to the hierarchy. For the cgroups version 2 hierarchy, this field is `undefined`.

***


## type CgroupController
Object with properties:
 - **`cgroupsNumber`** integer : `num_cgroups`, number of control groups in this hierarchy using this controller
 - **`enabled`** boolean : `enabled`
 - **`hierarchyId`** integer : `hierarchy`, unique ID of the cgroup hierarchy on which this controller is mounted. The value in this field will be 0 if the controller is not mounted on a cgroups v1 hierarchy, if the controller is bound to the cgroups v2 single unified hierarchy or if the controller is disabled.
 - **`name`** string : `subsys_name`, name of the controller

***


## type ProcessLimit
Object with properties:
 - **`name`** string : `Limit`, resource limit name
 - *optional* **`hard`** integer : `Hard Limit`, hard limit, `undefined` if unlimited
 - *optional* **`soft`** integer : `Soft Limit`, soft limit, `undefined` if unlimited
 - *optional* **`units`** string : `Units`, units limit is measured in, `undefined` if scalar

***


## type ProcessStat
Object with properties:
 - **`blockIoTicks`** integer
 - **`childGuestTicks`** integer
 - **`childKernelTicks`** integer
 - **`childMajorFaults`** integer
 - **`childMinorFaults`** integer
 - **`childUserTicks`** integer
 - **`comm`** string
 - **`exitSignal`** integer
 - **`flags`** integer
 - **`guestTicks`** integer
 - **`kernelTicks`** integer
 - **`lastCpu`** integer
 - **`majorFaults`** integer
 - **`minorFaults`** integer
 - **`nice`** integer
 - **`parent`** integer
 - **`pid`** integer
 - **`priority`** integer
 - **`processGroup`** integer
 - **`realtimePriority`** integer
 - **`rss`** integer
 - **`rssSoftLimit`** Float
 - **`schedulingPolicy`** integer
 - **`session`** integer
 - **`startTicks`** integer
 - **`state`** string
 - **`terminalProcessGroup`** integer
 - **`threads`** integer
 - **`tty`** integer
 - **`userTicks`** integer
 - **`vsize`** integer

***


## type ProcessStatus
Object with properties:
 - **`capabilityAmbient`** string
 - **`capabilityBounding`** string
 - **`capabilityEffective`** string
 - **`capabilityInheritable`** string
 - **`capabilityPermitted`** string
 - **`contextSwitchesNonvoluntary`** integer
 - **`contextSwitchesVoluntary`** integer
 - **`cpusAllowedMask`** integer
 - **`fdSize`** integer
 - **`gidEffective`** integer
 - **`gidFilesystem`** integer
 - **`gidReal`** integer
 - **`gidSavedSet`** integer
 - **`groups`** Array\<integer>
 - **`hugetlbPagesSize`** integer
 - **`memoriesAllowedMask`** integer
 - **`name`** string
 - **`numaGroupId`** integer
 - **`parent`** integer
 - **`pid`** integer
 - **`seccompMode`** integer
 - **`sharedSignalsPending`** integer
 - **`signalsBlocked`** string
 - **`signalsCaught`** string
 - **`signalsIgnored`** string
 - **`signalsPending`** integer
 - **`signalsQueued`** integer
 - **`signalsQueuedLimit`** integer
 - **`state`** string
 - **`threadGroupId`** integer
 - **`threads`** integer
 - **`tracer`** integer
 - **`uidEffective`** integer
 - **`uidFilesystem`** integer
 - **`uidReal`** integer
 - **`uidSavedSet`** integer
 - **`vmData`** integer
 - **`vmExe`** integer
 - **`vmHwm`** integer
 - **`vmLib`** integer
 - **`vmLocked`** integer
 - **`vmPeak`** integer
 - **`vmPinned`** integer
 - **`vmPte`** integer
 - **`vmRss`** integer
 - **`vmSize`** integer
 - **`vmStack`** integer
 - **`vmSwap`** integer
 - *optional* **`coreDumping`** boolean : Available since Linux 4.15
 - *optional* **`noNewPrivs`** boolean : Available since Linux 4.10
 - *optional* **`rssAnon`** integer : Available since Linux 4.5
 - *optional* **`rssFile`** integer : Available since Linux 4.5
 - *optional* **`rssShmem`** integer : Available since Linux 4.5
 - *optional* **`speculationStoreBypass`** string : Available since Linux 4.17
 - *optional* **`umask`** integer : Available since Linux 4.7

***


## type CpuCoreInfo
Object with properties:
 - **`addressSizes`** string
 - **`apicId`** integer
 - **`bogoMips`** integer
 - **`bugs`** Array\<string>
 - **`cacheAlignment`** integer
 - **`cacheSize`** string
 - **`clflushSize`** integer
 - **`coreId`** integer
 - **`cores`** integer
 - **`cpuMhz`** Float
 - **`cpuidLevel`** integer
 - **`family`** integer
 - **`flags`** Array\<string>
 - **`fpu`** boolean
 - **`fpuException`** boolean
 - **`id`** integer
 - **`initialApicId`** integer
 - **`microcode`** string
 - **`model`** integer
 - **`modelName`** string
 - **`physicalId`** integer
 - **`siblings`** integer
 - **`stepping`** integer
 - **`vendorId`** string
 - **`wp`** boolean

***


## type Loadavg
Object with properties:
 - **`existingEntities`** Float : number of kernel scheduling entities that currently exist on the system
 - **`jobsAvg15Min`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 15 minutes
 - **`jobsAvg1Min`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 1 minute
 - **`jobsAvg5Min`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 5 minutes
 - **`mostRecentlyCreatedPid`** Float : pid of the process that was most recently created on the system
 - **`runnableEntities`** Float : number of currently runnable kernel scheduling entities

***


## type Uptime
Object with properties:
 - **`idle`** Float : amount of time spent in the idle process, in seconds
 - **`time`** Float : uptime of the system, including time spend in suspend, in seconds

***


## type Swap
Object with properties:
 - **`path`** [Path](#type-path) : `Filename`
 - **`priority`** integer : `Priority`
 - **`size`** integer : `Size` size, in blocks
 - **`type`** string : `Type`
 - **`used`** integer : `Used` used, in blocks

***


## type StatCpuTime
Object with properties:
 - **`guest`** integer
 - **`guestNice`** integer
 - **`idle`** integer
 - **`iowait`** integer
 - **`irq`** integer
 - **`nice`** integer
 - **`softirq`** integer
 - **`steal`** integer
 - **`system`** integer
 - **`user`** integer

***


## type Stat
Object with properties:
 - **`bootTime`** Date
 - **`contextSwitches`** integer
 - **`cpuTime`** Array\<[StatCpuTime](#type-statcputime)>
 - **`interrupts`** integer
 - **`numberedInterrupts`** Array\<integer>
 - **`numberedSoftInterrupts`** Array\<integer>
 - **`processes`** integer
 - **`processesBlocking`** integer
 - **`processesRunning`** integer
 - **`softInterrupts`** integer
 - **`systemCpuTime`** [StatCpuTime](#type-statcputime)
 - *optional* **`pageIn`** integer
 - *optional* **`pageOut`** integer
 - *optional* **`swapIn`** integer
 - *optional* **`swapOut`** integer

***


## type Device
Object with properties:
 - **`group`** string : Group name
 - **`major`** integer : Device ID major part
 - **`type`** string : `character` or `block`

***


## type Filesystem
Object with properties:
 - **`name`** string : filesystem name
 - **`requiresBlockDevice`** boolean : if filesystem requires a block device to be mounted (unlike e.g., virtual filesystem, network filesystem)

***


## type Diskstat
Object with properties:
 - **`currentIoCount`** integer
 - **`ioTime`** integer
 - **`major`** integer
 - **`minor`** integer
 - **`name`** string
 - **`readTime`** integer
 - **`reads`** integer
 - **`readsMerged`** integer
 - **`sectorsRead`** integer
 - **`sectorsWriten`** integer
 - **`weightedIoTime`** integer
 - **`writeTime`** integer
 - **`writes`** integer
 - **`writesMerged`** integer

***


## type Partition
Object with properties:
 - **`blocks`** integer : number of 1024-byte blocks on partition
 - **`devId`** [DevId](#type-devid) : major and minor numbers of device
 - **`name`** string : partition name

***


## type Meminfo
Object with properties:
 - **`active`** integer
 - **`anonHugePages`** integer
 - **`anonPages`** integer
 - **`available`** integer
 - **`bounceBuffers`** integer
 - **`buffers`** integer
 - **`cached`** integer
 - **`commitLimit`** integer
 - **`directMap1G`** integer
 - **`directMap2M`** integer
 - **`directMap4K`** integer
 - **`directMap4M`** integer
 - **`dirty`** integer
 - **`free`** integer
 - **`hardwareCorrupted`** integer
 - **`hugepageSize`** integer
 - **`hugepagesFree`** integer
 - **`hugepagesReserved`** integer
 - **`hugepagesSurplus`** integer
 - **`hugepagesTotal`** integer
 - **`inactive`** integer
 - **`kernelStack`** integer
 - **`mapped`** integer
 - **`pageTables`** integer
 - **`shmem`** integer
 - **`slab`** integer
 - **`slabReclaimable`** integer
 - **`slabUnreclaimable`** integer
 - **`swapCached`** integer
 - **`swapFree`** integer
 - **`swapTotal`** integer
 - **`total`** integer
 - **`vmallocTotal`** integer
 - **`writeback`** integer
 - **`writebackTmp`** integer
 - *optional* **`kernelReclaimable`** integer : Available since Linux 4.20
 - *optional* **`shmemHugePages`** integer : Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`
 - *optional* **`shmemPmdMapped`** integer : Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`

***


## type ProcessFdinfoEpollCounter
Object with properties:
 - **`data`** string
 - **`eventMask`** integer
 - **`fd`** integer

***


## type ProcessFdinfoInotifyFile
Object with properties:
 - **`deviceId`** integer
 - **`ignoredMask`** integer
 - **`inode`** integer
 - **`mask`** integer
 - **`wd`** integer

***


## type ProcessFdinfoFanotifyMark
Object with properties:
 - **`deviceId`** integer
 - **`flags`** integer
 - **`ignoredMask`** integer
 - **`inode`** integer
 - **`mask`** integer

***


## type ProcessFdinfo
Object with properties:
 - **`flags`** integer
 - **`mntId`** integer
 - **`pos`** integer
 - **`type`** string
 - *optional* **`epollCounters`** Array\<[ProcessFdinfoEpollCounter](#type-processfdinfoepollcounter)>
 - *optional* **`eventfdCounter`** integer
 - *optional* **`fanotifyEventFlags`** integer
 - *optional* **`fanotifyFlags`** integer
 - *optional* **`fanotifyMarks`** Array\<[ProcessFdinfoFanotifyMark](#type-processfdinfofanotifymark)>
 - *optional* **`inotifyFiles`** Array\<[ProcessFdinfoInotifyFile](#type-processfdinfoinotifyfile)>
 - *optional* **`rtSignalMask`** integer
 - *optional* **`signalMask`** integer
 - *optional* **`timerClockId`** integer
 - *optional* **`timerInterval`** Array\<integer>
 - *optional* **`timerSettimeFlags`** integer
 - *optional* **`timerTicks`** integer
 - *optional* **`timerValue`** Array\<integer>

***


## type ProcessExe
Object with properties:
 - **`deleted`** boolean : if path have been unlinked
 - **`path`** string : actual path of executed command

***


