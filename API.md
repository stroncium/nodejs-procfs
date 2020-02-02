## procfs

### processMountinfo ([pid])
Parses contents of `/proc/<pid>/mountinfo`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[ProcessMountinfo](#type-processmountinfo)>
 - throws [ProcfsError](#procfserror)
***


### processIo ([pid])
Parses contents of `/proc/<pid>/io`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessIo](#type-processio)
 - throws [ProcfsError](#procfserror)
***


### processUidMap ([pid])
Parses contents of `/proc/<pid>/uid_map`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[ProcessIdMapRange](#type-processidmaprange)>
 - throws [ProcfsError](#procfserror)
***


### processGidMap ([pid])
Parses contents of `/proc/<pid>/gid_map`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[ProcessIdMapRange](#type-processidmaprange)>
 - throws [ProcfsError](#procfserror)
***


### processEnviron ([pid])
Parses contents of `/proc/<pid>/environ`

Note: the result can be used to create map, `new Map(result)`.

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<Array\<string>>: key-value pairs of initial environment process was started with
 - throws [ProcfsError](#procfserror)
***


### processOomScore ([pid])
Parses contents of `/proc/<pid>/oom_score`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns integer: current score that the kernel gives to this process for the purpose of selecting a process for the OOM-killer
 - throws [ProcfsError](#procfserror)
***


### processTimerslackNs ([pid])
Parses contents of `/proc/<pid>/timerslack_ns`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns integer: process's "current" timer slack value, in nanoseconds
 - throws [ProcfsError](#procfserror)
***


### processCmdline ([pid])
Parses contents of `/proc/<pid>/cmdline`

Complete list of command-line arguments for the process, unless the process is a zombie. In the latter case, `null`.

Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<string>
 - throws [ProcfsError](#procfserror)
***


### processAutogroup ([pid])
Parses contents of `/proc/<pid>/autogroup`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessAutogroup](#type-processautogroup)
 - throws [ProcfsError](#procfserror)
***


### processStatm ([pid])
Parses contents of `/proc/<pid>/statm`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessStatm](#type-processstatm): information about process memory usage
 - throws [ProcfsError](#procfserror)
***


### processComm ([pid])
Parses contents of `/proc/<pid>/comm`

Note: different threads in the same process may have different comm values

 - **`pid`** integer: process PID, `self` process if undefined
 - returns string: the command name associated with the process
 - throws [ProcfsError](#procfserror)
***


### processCgroups ([pid])
Parses contents of `/proc/<pid>/cgroups`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[ProcessCgroup](#type-processcgroup)>: control groups to which the process belongs
 - throws [ProcfsError](#procfserror)
***


### processPersonality ([pid])
Parses contents of `/proc/<pid>/personality`

Process's execution domain, as set by `personality`.

Note: permission to access this file is governed by ptrace access mode `PTRACE_MODE_ATTACH_FSCREDS`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns integer
 - throws [ProcfsError](#procfserror)
***


### processCpuset ([pid])
Parses contents of `/proc/<pid>/cpuset`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns string: path of the process's cpuset directory relative to the root of the cpuset filesystem
 - throws [ProcfsError](#procfserror)
***


### processLimits ([pid])
Parses contents of `/proc/<pid>/limits`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[ProcessLimit](#type-processlimit)>: process's resource limits
 - throws [ProcfsError](#procfserror)
***


### processStat ([pid])
Parses contents of `/proc/<pid>/stat`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessStat](#type-processstat): status information about the process(used by `ps`)
 - throws [ProcfsError](#procfserror)
***


### processStatus ([pid])
Parses contents of `/proc/<pid>/status`

Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessStatus](#type-processstatus)
 - throws [ProcfsError](#procfserror)
***


### processFds ([pid])
Parses list of `/proc/<pid>/fd/*` entries.

Note: In a multithreaded process, the contents of this directory are not available if the main thread has already terminated (typically by calling pthread_exit).

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<integer>: process's current open fds
 - throws [ProcfsError](#procfserror)
***


### processThreads ([pid])
Parses list of `/proc/<pid>/task/*` entries.

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<integer>: process's current threads
 - throws [ProcfsError](#procfserror)
***


### processFdinfo (fd, [pid])
Parses contents of `/proc/<pid>/fdinfo/<fd>`

 - **`fd`** integer: target fd
 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessFdinfo](#type-processfdinfo): information about target file descriptor
 - throws [ProcfsError](#procfserror)
***


### processFd (fd, [pid])
Parses symlink at `/proc/<pid>/fd/<fd>`

Note: Permission to read this is governed by a ptrace access mode `PTRACE_MODE_READ_FSCREDS` check.

 - **`fd`** integer: target fd
 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessFd](#type-processfd): information about target file descriptor
 - throws [ProcfsError](#procfserror)
***


### processExe ([pid])
Parses symlink at `/proc/<pid>/exe`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [ProcessExe](#type-processexe)
 - throws [ProcfsError](#procfserror)
***


### processCwd ([pid])
Parses symlink at `/proc/<pid>/cwd`

Note: in a multithreaded process, it is not available if the main thread has already terminated.

Note: permission to read this file(symlink) is governed by ptrace access mode `PTRACE_MODE_READ_FSCREDS`.

 - **`pid`** integer: process PID, `self` process if undefined
 - returns [Path](#type-path): path to process `cwd`
 - throws [ProcfsError](#procfserror)
***


### processNetDev ([pid])
Parses contents of `/proc/<pid>/net/dev`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetDevice](#type-netdevice)>: statuses of network devices present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetWireless ([pid])
Parses contents of `/proc/<pid>/net/wireless`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetWirelessDevice](#type-netwirelessdevice)>: statuses of wireless network devices present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetUnix ([pid])
Parses contents of `/proc/<pid>/net/unix`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetUnixSocket](#type-netunixsocket)>: statuses of UNIX domain sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetTcp4 ([pid])
Parses contents of `/proc/<pid>/net/tcp`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetSocket4](#type-netsocket4)>: statuses of IPv4 TCP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetUdp4 ([pid])
Parses contents of `/proc/<pid>/net/udp`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetSocket4](#type-netsocket4)>: statuses of IPv4 UDP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetTcp6 ([pid])
Parses contents of `/proc/<pid>/net/tcp6`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetSocket6](#type-netsocket6)>: statuses of IPv6 TCP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### processNetUdp6 ([pid])
Parses contents of `/proc/<pid>/net/udp6`

 - **`pid`** integer: process PID, `self` process if undefined
 - returns Array\<[NetSocket6](#type-netsocket6)>: statuses of IPv6 UDP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### netDev ()
Parses contents of `/proc/net/dev`

 - returns Array\<[NetDevice](#type-netdevice)>: statuses of network devices present within the system
 - throws [ProcfsError](#procfserror)
***


### netWireless ()
Parses contents of `/proc/net/wireless`

 - returns Array\<[NetWirelessDevice](#type-netwirelessdevice)>: statuses of wireless network devices present within the system
 - throws [ProcfsError](#procfserror)
***


### netUnix ()
Parses contents of `/proc/net/unix`

 - returns Array\<[NetUnixSocket](#type-netunixsocket)>: statuses of UNIX domain sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### netTcp4 ()
Parses contents of `/proc/net/tcp`

 - returns Array\<[NetSocket4](#type-netsocket4)>: statuses of IPv4 TCP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### netUdp4 ()
Parses contents of `/proc/net/udp`

 - returns Array\<[NetSocket4](#type-netsocket4)>: statuses of IPv4 UDP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### netTcp6 ()
Parses contents of `/proc/net/tcp6`

 - returns Array\<[NetSocket6](#type-netsocket6)>: statuses of IPv6 TCP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### netUdp6 ()
Parses contents of `/proc/net/udp6`

 - returns Array\<[NetSocket6](#type-netsocket6)>: statuses of IPv6 UDP sockets present within the system
 - throws [ProcfsError](#procfserror)
***


### cpuinfo ()
	⚠️ Unstable: documentation on that is hard to find, need to get at least a list of fields which are present on all systems or just remove this method from the library

Parses contents of `/proc/cpuinfo`

 - returns Array\<[CpuCoreInfo](#type-cpucoreinfo)>
 - throws [ProcfsError](#procfserror)
***


### loadavg ()
Parses contents of `/proc/loadavg`

 - returns [Loadavg](#type-loadavg)
 - throws [ProcfsError](#procfserror)
***


### uptime ()
Parses contents of `/proc/uptime`

 - returns [Uptime](#type-uptime)
 - throws [ProcfsError](#procfserror)
***


### version ()
Parses contents of `/proc/version`

Note: includes the contents of `/proc/sys/kernel/ostype`, `/proc/sys/kernel/osrelease` and `/proc/sys/kernel/version`.

 - returns string: identifies the kernel version that is currently running
 - throws [ProcfsError](#procfserror)
***


### cmdline ()
Parses contents of `/proc/cmdline`

 - returns string: arguments passed to the Linux kernel at boot time
 - throws [ProcfsError](#procfserror)
***


### swaps ()
Parses contents of `/proc/swaps`

 - returns Array\<[Swap](#type-swap)>: swap areas in use
 - throws [ProcfsError](#procfserror)
***


### stat ()
Parses contents of `/proc/stat`

 - returns [Stat](#type-stat): kernel/system statistics
 - throws [ProcfsError](#procfserror)
***


### devices ()
Parses contents of `/proc/devices`

 - returns Array\<[Device](#type-device)>: major numbers and device groups.
 - throws [ProcfsError](#procfserror)
***


### filesystems ()
Parses contents of `/proc/filesystems`

 - returns Array\<[Filesystem](#type-filesystem)>: filesystems which are supported by the kernel(which were compiled into the kernel or whose kernel modules are currently loaded)
 - throws [ProcfsError](#procfserror)
***


### diskstats ()
Parses contents of `/proc/diskstats`

 - returns Array\<[Diskstat](#type-diskstat)>: I/O statistics for each disk device
 - throws [ProcfsError](#procfserror)
***


### partitions ()
Parses contents of `/proc/partitions`

 - returns Array\<[Partition](#type-partition)>: partitions in system
 - throws [ProcfsError](#procfserror)
***


### meminfo ()
Parses contents of `/proc/meminfo`

 - returns [Meminfo](#type-meminfo): statistics about memory usage on the system
 - throws [ProcfsError](#procfserror)
***


### processes ()
Parses list of `/proc/*` entries.

Depending on `hidepid` option `procfs` was mounted with, may only contain user's own processes.

 - returns Array\<integer>: pids of currently running processes
 - throws [ProcfsError](#procfserror)
***


### config ()
Parses contents of `/proc/config.gz`

Available if the kernel is configured with `CONFIG_IKCONFIG_PROC`

 - returns string: kernel config
 - throws [ProcfsError](#procfserror)
***


### cgroups ()
Parses contents of `/proc/cgroups`

 - returns Array\<[CgroupController](#type-cgroupcontroller)>: controllers that are compiled into the kernel
 - throws [ProcfsError](#procfserror)
***


### devIdGetMinor (devId)
 - **`devId`** [DevId](#type-devid)
 - returns integer: minor part of devId
***


### devIdGetMajor (devId)
 - **`devId`** [DevId](#type-devid)
 - returns integer: major part of devId
***


### devIdFromMajorMinor (major, minor)
 - **`major`** integer: major part of DevId
 - **`minor`** integer: minor part of DevId
 - returns [DevId](#type-devid): id combined from major and minor parts
***


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
 - **`read`** integer : `rchar` number of bytes read
 - **`readReal`** integer : `read_bytes` number of bytes read which were really fetched from storage layer
 - **`readSyscalls`** integer : `syscr` number of read syscalls
 - **`write`** integer : `wchar` number of bytes written
 - **`writeCancelled`** integer : `cancelled_write_bytes` number of bytes process caused to not be written
 - **`writeReal`** integer : `write_bytes` number of bytes written which were really sent to storage layer
 - **`writeSyscalls`** integer : `syscw` number of write syscalls

***


## type ProcessIdMapRange
Object with properties:
 - **`length`** integer : length of the range of IDs that is mapped between the two user namespaces
 - **`start`** integer : start of the range of IDs to which the IDs do map
Interpretation depends on whether the process that opened and the target process are in the same user namespace.
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
 - **`data`** integer : data + stack, in pages
 - **`resident`** integer : resident set size(same as VmRSS in `/proc/<pid>/status`), in pages
 - **`shared`** integer : number of resident shared pages(same as RssFile + RssShmem in `/proc/<pid>/status`), in pages
 - **`size`** integer : total program size(same as VmSize in `/proc/<pid>/status`), in pages
 - **`text`** integer : text (code), in pages

***


## type ProcessCgroup
Object with properties:
 - **`hierarchyId`** integer : `hierarchy-ID` For cgroups version 1 hierarchies, this field contains a unique hierarchy ID number that can be matched to a hierarchy ID in /proc/cgroups. For the cgroups version 2 hierarchy, this field contains the value 0.
 - **`path`** string : `cgroup-path` Pathname of the control group in the hierarchy to which the process belongs. This pathname is relative to the mount point of the hierarchy.
 - *optional* **`controllers`** Array\<string> : `controller-list` For cgroups version 1 hierarchies, this field contains a comma-separated list of the controllers bound to the hierarchy. For the cgroups version 2 hierarchy, this field is `undefined`.

***


## type CgroupController
Object with properties:
 - **`cgroupsNumber`** integer : `num_cgroups` number of control groups in this hierarchy using this controller
 - **`enabled`** boolean : `enabled`
 - **`hierarchyId`** integer : `hierarchy` unique ID of the cgroup hierarchy on which this controller is mounted. The value in this field will be 0 if the controller is not mounted on a cgroups v1 hierarchy, if the controller is bound to the cgroups v2 single unified hierarchy or if the controller is disabled.
 - **`name`** string : `subsys_name` name of the controller

***


## type ProcessLimit
Object with properties:
 - **`name`** string : `Limit` resource limit name
 - *optional* **`hard`** integer : `Hard Limit` hard limit, `undefined` if unlimited
 - *optional* **`soft`** integer : `Soft Limit` soft limit, `undefined` if unlimited
 - *optional* **`units`** string : `Units` units limit is measured in, `undefined` if scalar

***


## type ProcessState
Process state, consists of one character. Possible values:
 - `R`: running
 - `S`: sleeping in an interruptible wait
 - `D`: waiting in uninterruptible disk sleep
 - `Z`: zombie
 - `T`: stopped or trace stopped
 - `t`: tracing stop
 - `X`: dead

Type: string

***


## type ProcessStat
Only (arguably) most valuable fields included so far.

Object with properties:
 - **`blockIoTicks`** integer : `delayacct_blkio_ticks` Aggregated block I/O delays, in ticks.
 - **`childGuestTicks`** integer : Guest time of the process's children, in ticks.
 - **`childKernelTicks`** integer : `cstime` Amount of time that this process's waited-for children have been scheduled in kernel mode, in ticks.
 - **`childMajorFaults`** integer : `cmajflt` The number of major faults that the process's waited-for children have made.
 - **`childMinorFaults`** integer : `cminflt` The number of minor faults that the process's waited-for children have made.
 - **`childUserTicks`** integer : `cutime` Amount of time that this process's waited-for children have been scheduled in user mode, in ticks.
 - **`comm`** string : `comm` The filename of the executable. Visible whether or not the executable is swapped out.
 - **`exitSignal`** integer : `exit_signal` Signal to be sent to parent when we die
 - **`flags`** integer : `flags` The kernel flags word of the process.
 - **`guestTicks`** integer : Guest time of the process (time spent running a virtual CPU for a guest operating system), in ticks.
 - **`kernelTicks`** integer : `stime` Amount of time that this process has been scheduled in kernel mode, in ticks.
 - **`lastCpu`** integer : `processor` CPU number last executed on.
 - **`majorFaults`** integer : `majflt` The number of major faults the process has made which have required loading a memory page from disk.
 - **`minorFaults`** integer : `minflt` The number of minor faults the process has made which have not required loading a memory page from disk.
 - **`nice`** integer : `nice` The nice value, a value in the range 19(low priority) to -20(high priority).
 - **`parent`** integer : `ppid` The PID of the parent of the process.
 - **`pid`** integer : `pid` The process PID
 - **`priority`** integer : `priority` For processes running a real-time scheduling policy (policy below), this is the negated scheduling priority, minus one; that is, a number in the range -2 to -100, corresponding to real-time priorities 1 to 99. For processes running under a non-real-time scheduling policy, this is the raw nice value (setpriority(2)) as represented in the kernel. The kernel stores nice values as numbers in the range 0 (high) to 39 (low), corresponding to the user-visible nice range of -20 to 19.
 - **`processGroup`** integer : `pgrp` The process group ID of the process.
 - **`realtimePriority`** integer : `rt_priority` Real-time scheduling priority, a number in the range 1 to 99 for processes scheduled under a real-time policy, or 0, for non-real-time processes.
 - **`rss`** integer : `rss` Resident Set Size, number of pages the process has in real memory. This is just the pages which count toward text, data, or stack space. This does not include pages which have not been demand-loaded in, or which are swapped out.
 - **`rssSoftLimit`** Float : `rsslim` Current soft limit in bytes on the rss of the process.
 - **`schedulingPolicy`** integer : `policy` Scheduling policy.
 - **`session`** integer : `session` The session ID of the process.
 - **`startTicks`** integer : `starttime` The time the process started after system boot, in ticks.
 - **`state`** [ProcessState](#type-processstate) : `state` process state
 - **`terminalProcessGroup`** integer : `tpgid` The ID of the foreground process group of the controlling terminal of the process.
 - **`threads`** integer : `num_threads` Number of threads in this process.
 - **`tty`** integer : `tty_nr` The controlling terminal of the process.
 - **`userTicks`** integer : `utime` Amount of time that this process has been scheduled in user mode(includes guest time), in ticks.
 - **`vsize`** integer : `vsize` Virtual memory size in bytes.

***


## type ProcessStatus
Object with properties:
 - **`contextSwitchesNonvoluntary`** integer : `nonvoluntary_ctxt_switches` Number of involuntary context switches.
 - **`contextSwitchesVoluntary`** integer : `voluntary_ctxt_switches` Number of voluntary context switches.
 - **`cpusAllowedMask`** integer : `Cpus_allowed` Mask of CPUs on which this process may run.
 - **`fdSlots`** integer : `FDSize` Number of file descriptor slots currently allocated.
 - **`gidEffective`** integer : `Gid` Effective GID.
 - **`gidFilesystem`** integer : `Gid` Filesystem GID.
 - **`gidReal`** integer : `Gid` Real GID.
 - **`gidSavedSet`** integer : `Gid` Saved set GID.
 - **`groups`** Array\<integer> : `Groups` Supplementary groups.
 - **`hugetlbPagesSize`** integer : `HugetlbPages` Size of hugetlb memory portions.
 - **`memoriesAllowedMask`** integer : `Mems_allowed` Mask of memory nodes allowed to this process.
 - **`name`** string : `Name` Command run by the process.
 - **`numaGroupId`** integer : `Ngid` NUMA group ID.
 - **`parentPid`** integer : `PPid` PID of parent process
 - **`pid`** integer : `Pid` Thread ID.
 - **`rtSignalsBlocked`** integer : `SigBlk` Mask indicating signals being blocked, high part(realtime signals).
 - **`rtSignalsCaught`** integer : `SigCgt` Mask indicating signals being caught, high part(realtime signals).
 - **`rtSignalsIgnored`** integer : `SigIgn` Mask indicating signals being ignored, high part(realtime signals).
 - **`sharedSignalsPending`** integer : `ShdPnd` Number of signals pending for process as a whole.
 - **`signalsBlocked`** integer : `SigBlk` Mask indicating signals being blocked, low part.
 - **`signalsCaught`** integer : `SigCgt` Mask indicating signals being caught, low part.
 - **`signalsIgnored`** integer : `SigIgn` Mask indicating signals being ignored, low part.
 - **`signalsPending`** integer : `SigPnd` Number of signals pending for thread.
 - **`signalsQueued`** integer : `SigQ` The number of currently queued signals for real UID of the process.
 - **`signalsQueuedLimit`** integer : `SigQ` Resource limit on the number of queued signals for this process.
 - **`state`** [ProcessState](#type-processstate) : `State` Current state of the process.
 - **`threadGroupId`** integer : `Tgid` Thread group ID.
 - **`threads`** integer : `Threads` Number of threads in process containing this thread.
 - **`tracerPid`** integer : `TracerPid` PID of process tracing this process (0 if not being traced)
 - **`uidEffective`** integer : `Uid` Effective UID.
 - **`uidFilesystem`** integer : `Uid` Filesystem UID.
 - **`uidReal`** integer : `Uid` Real UID.
 - **`uidSavedSet`** integer : `Uid` Saved set UID.
 - **`vmData`** integer : `VmData` Size of data segment.
 - **`vmExe`** integer : `VmExe` Size of text segment.
 - **`vmHwm`** integer : `VmHWM` Peak resident set size.
 - **`vmLib`** integer : `VmLib` Shared library code size.
 - **`vmLocked`** integer : `VmLck` Locked memory size.
 - **`vmPeak`** integer : `VmPeak` Peak virtual memory size.
 - **`vmPinned`** integer : `VmPin` Pinned memory size. These are pages that can't be moved because something needs to directly access physical memory.
 - **`vmPte`** integer : `VmPTE` Page table entries size.
 - **`vmRss`** integer : `VmRSS` Resident  set  size. Note: value is the sum of `rssAnon`, `rssFile`, and `rssShmem`(which might not be available depending on kernel version).
 - **`vmSize`** integer : `VmSize` Virtual memory size.
 - **`vmStack`** integer : `VmStk` Size of stack segment.
 - **`vmSwap`** integer : `VmSwap` Swapped-out virtual memory size by anonymous private pages; shmem swap usage is not included.
 - *optional* **`rssAnon`** integer
 - *optional* **`rssFile`** integer
 - *optional* **`rssShmem`** integer
 - *optional* **`seccompMode`** integer : `Seccomp` Seccomp  mode of the process. `0` means SECCOMP_MODE_DISABLED; `1` means SECCOMP_MODE_STRICT; `2` means SECCOMP_MODE_FILTER. Available if the kernel is configured with `CONFIG_SECCOMP`.
 - *optional* **`speculationStoreBypass`** string
 - *optional* **`umask`** integer

***


## type CpuCoreInfo
Object with properties:
 - **`addressSizes`** string
 - **`apicId`** integer
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
 - *optional* **`bogoMips`** Float

***


## type Loadavg
Object with properties:
 - **`existingEntities`** Float : number of kernel scheduling entities that currently exist on the system
 - **`jobsAverage15Minutes`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 15 minutes
 - **`jobsAverage1Minute`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 1 minute
 - **`jobsAverage5Minutes`** Float : number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 5 minutes
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
 - **`path`** [Path](#type-path) : `Filename` path to device, partition or file
 - **`priority`** integer : `Priority`swap area usage priority
 - **`size`** integer : `Size` size, in blocks
 - **`type`** string : `Type` commonly `partition` or `file`(theoretically, other values are possible)
 - **`used`** integer : `Used` used, in blocks

***


## type StatCpuTime
Note: amounts are in units of USER_HZ(a.k.a. ticks) which are 1/100ths of a second on most architectures, use sysconf(_SC_CLK_TCK) to obtain the right value).

Object with properties:
 - **`guest`** integer : `guest` time spent running a virtual CPU for guest operating systems under the control of the Linux kernel, in ticks
 - **`guestNice`** integer : `guest_nice` time spent running a niced guest (virtual CPU for guest operating systems under the control of the Linux kernel), in ticks
 - **`idle`** integer : `idle` time spent in the idle task, in ticks
 - **`iowait`** integer : `iowait` time waiting for I/O to complete, value is not reliable, in ticks
 - **`irq`** integer : `irq` time servicing interrupts, in ticks
 - **`nice`** integer : `nice` time spent in user mode with low priority, in ticks
 - **`softirq`** integer : `softirq` time servicing softirqs, in ticks
 - **`steal`** integer : `steal` stolen time, which is the time spent in other operating systems when running in a virtualized environment, in ticks
 - **`system`** integer : `system` time spent in system mode, in ticks
 - **`user`** integer : `user` time spent in user mode, in ticks

***


## type Stat
Object with properties:
 - **`bootTime`** Date : boot time, in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC)
 - **`contextSwitches`** integer : number of context switches that the system underwent
 - **`cpuTime`** Array\<[StatCpuTime](#type-statcputime)> : time spent in various states, for each CPU
 - **`forks`** integer : number of forks since boot
 - **`interrupts`** integer : total number of all interrupts serviced including unnumbered architecture specific interrupts
 - **`numberedInterrupts`** Array\<integer> : number of interrupts serviced for each numbered interrupt
 - **`numberedSoftInterrupts`** Array\<integer> : number of soft interrupts serviced for each softirq
 - **`processesBlocked`** integer : number of processes blocked waiting for I/O to complete
 - **`processesRunning`** integer : number of processes in runnable state
 - **`softInterrupts`** integer : total number of soft interrupts serviced
 - **`systemCpuTime`** [StatCpuTime](#type-statcputime) : time system spent in various states

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
 - **`currentIoCount`** integer : number of of IOs currently in progress
 - **`devId`** [DevId](#type-devid) : device id
 - **`ioTime`** integer : milliseconds spent doing IO
 - **`name`** string : device name
 - **`readTime`** integer : milliseconds spent reading
 - **`reads`** integer : total number of reads
 - **`readsMerged`** integer : number of reads merged
 - **`sectorsRead`** integer : total number of sectors read
 - **`sectorsWriten`** integer : total number of sectors written
 - **`weightedIoTime`** integer : weighted milliseconds spent doing I/Os. This field is incremented at each I/O start, I/O completion, I/O merge, or read of these stats by the number of I/Os in progress times the number of milliseconds spent doing I/O since the last update of this field.  This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.
 - **`writeTime`** integer : milliseconds spent writing
 - **`writes`** integer : total number of writes
 - **`writesMerged`** integer : number of writes merged

***


## type Partition
Object with properties:
 - **`blocks`** integer : number of 1024-byte blocks on partition
 - **`devId`** [DevId](#type-devid) : major and minor numbers of device
 - **`name`** string : partition name

***


## type Meminfo
Memory amounts are expressed in bytes.

Object with properties:
 - **`active`** integer : `Active` Memory that has been used more recently and usually not reclaimed unless absolutely necessary.
 - **`anonHugePages`** integer : `AnonHugePages` Non-file backed huge pages mapped into userspace page tables. Available if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
 - **`anonPages`** integer : `AnonPages` Non-file backed pages mapped into user-space page tables.
 - **`available`** integer : `MemAvailable` An estimate of how much memory is available for starting new applications, without swapping
 - **`bounceBuffers`** integer : `Bounce` Memory used for block device "bounce buffers".
 - **`buffers`** integer : `Buffers` Relatively temporary storage for raw disk blocks that shouldn't get tremendously large
 - **`cached`** integer : `Cached` In-memory cache for files read from the disk (the page cache). Doesn't include Swap‐Cached.
 - **`commitLimit`** integer : `CommitLimit` Total amount of memory currently available to be allocated on the system.
 - **`directMap1G`** integer : `DirectMap1G` Number of bytes of RAM linearly mapped by kernel in 1GB pages.
 - **`directMap2M`** integer : `DirectMap2M` Number of bytes of RAM linearly mapped by kernel in 2MB pages.
 - **`directMap4K`** integer : `DirectMap4k` Number of bytes of RAM linearly mapped by kernel in 4kB pages
 - **`directMap4M`** integer : `DirectMap4M` Number of bytes of RAM linearly mapped by kernel in 4MB pages.
 - **`dirty`** integer : `Dirty` Memory which is waiting to get written back to the disk.
 - **`free`** integer : `MemFree` Amount of free RAM
 - **`inactive`** integer : `Inactive` Memory which has been less recently used. It is more eligible to be reclaimed for other purposes.
 - **`kernelStack`** integer : `KernelStack` Amount of memory allocated to kernel stacks.
 - **`mapped`** integer : `Mapped` Files which have been mapped into memory (with mmap), such as libraries.
 - **`pageTables`** integer : `PageTables` Amount of memory dedicated to the lowest level of page tables.
 - **`shmem`** integer : `Shmem` Amount of memory consumed in tmpfs filesystems.
 - **`slab`** integer : `Slab` In-kernel data structures cache.
 - **`slabReclaimable`** integer : `SReclaimable` Part of Slab, that might be reclaimed, such as caches.
 - **`slabUnreclaimable`** integer : `SUnreclaim` Part of Slab, that cannot be reclaimed on memory pressure.
 - **`swapCached`** integer : `SwapCached` Memory that once was swapped out, is swapped back in but still also is in the swap file. (If memory pressure is high, these pages don't need to be swapped out again because they are already in the swap file. This saves I/O.)
 - **`swapFree`** integer : `SwapFree` Amount of swap space that is currently unused.
 - **`swapTotal`** integer : `SwapTotal` Total amount of swap space available.
 - **`total`** integer : `MemTotal` Total usable RAM
 - **`vmallocTotal`** integer : `VmallocTotal` Total size of vmalloc memory area.
 - **`writeback`** integer : `Writeback` Memory which is actively being written back to the disk.
 - **`writebackTmp`** integer : `WritebackTmp` Memory used by FUSE for temporary writeback buffers.
 - *optional* **`hardwareCorrupted`** integer : `HardwareCorrupted` Available if the kernel is configured with `CONFIG_MEMORY_FAILURE`.
 - *optional* **`hugepageSize`** integer : `Hugepagesize` The size of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
 - *optional* **`hugepagesFree`** integer : `HugePages_Free` The number of huge pages in the pool that are not yet allocated. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
 - *optional* **`hugepagesReserved`** integer : `HugePages_Rsvd` This is the number of huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made. These reserved huge pages guarantee that an application will be able to allocate a huge page from the pool of huge pages at fault time. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
 - *optional* **`hugepagesSurplus`** integer : `HugePages_Surp` This is the number of huge pages in the pool above the value in `/proc/sys/vm/nr_hugepages`. The maximum number of surplus huge pages is controlled by `/proc/sys/vm/nr_overcommit_hugepages`. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
 - *optional* **`hugepagesTotal`** integer : `HugePages_Total` The size of the pool of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
 - *optional* **`kernelReclaimable`** integer : `KReclaimable` Kernel allocations that the kernel will attempt to reclaim under memory pressure. Includes `SReclaimable` and other direct allocations with a shrinker. Available since Linux 4.20.
 - *optional* **`shmemHugePages`** integer : `ShmemHugePages` Memory used by shared memory and tmpfs allocated with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
 - *optional* **`shmemPmdMapped`** integer : `ShmemPmdMapped` Shared memory mapped into user space with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.

***


## type ProcessFdinfoEpollCounter
Object with properties:
 - **`fd`** integer : `tfd`, file descriptor
 - **`mask`** integer : `events`, mask of events being monitored for fd

***


## type ProcessFdinfoInotifyFile
Object with properties:
 - **`devId`** [DevId](#type-devid) : `sdev`, ID of the device where the file resides
 - **`ignoredMask`** integer : `ignored_mask`, event mask that is ignored for target file
 - **`inode`** integer : `ino`, inode of the target file
 - **`mask`** integer : `mask`, mask of events being monitored for the file
 - **`wd`** integer : `wd`, watch descriptor number

***


## type ProcessFdinfoFanotifyMark
Object with properties:
 - **`devId`** [DevId](#type-devid) : `sdev`, ID of the device where the file resides
 - **`flags`** integer : `flags`, mark flags
 - **`ignoredMask`** integer : `ignored_mask`, event mask that is ignored for this mark
 - **`inode`** integer : `ino`, inode of the target file
 - **`mask`** integer : `mask`, event mask for this mark

***


## type ProcessFdinfoType
Type of file descriptor. Possible values:
 - `regular`: regular file descriptor
 - `event`: eventfd file descriptor
 - `epoll`: epoll file descriptor
 - `signal`: signalfd file descriptor
 - `inotify`: intofiy file descriptor
 - `fanotify`: fanotify file descriptor
 - `timer`: timerfd file descriptor

Type: string

***


## type ProcessFdinfo
Object with properties:
 - **`flags`** integer : file access mode and status flags
 - **`mountId`** integer : ID of the mount point containing the file
 - **`position`** integer : file offset
 - **`type`** [ProcessFdinfoType](#type-processfdinfotype) : fd type
 - *optional* **`epollCounters`** Array\<[ProcessFdinfoEpollCounter](#type-processfdinfoepollcounter)> : for type `epoll`, information about file descriptors being monitoring
 - *optional* **`eventCounter`** integer : for type `event`, current value of the event counter
 - *optional* **`fanotifyEventFlags`** integer : for type 'fanotify`, `event_f_flags` argument given to `fanotify_init`
 - *optional* **`fanotifyFlags`** integer : for type `fanotify`, `flags` argument given to `fanotify_init`
 - *optional* **`fanotifyMarks`** Array\<[ProcessFdinfoFanotifyMark](#type-processfdinfofanotifymark)> : for type `fanotify`, information about marks in fanotify group
 - *optional* **`inotifyFiles`** Array\<[ProcessFdinfoInotifyFile](#type-processfdinfoinotifyfile)> : for type `inotify`, information of files being monitored
 - *optional* **`rtSignalMask`** integer : for type `signal`, mask of signals being monitored, high part
 - *optional* **`signalMask`** integer : for type `signal`, mask of signals being monitored, low part
 - *optional* **`timerClockId`** integer : for type `timer`,  clock ID
 - *optional* **`timerInterval`** Array\<integer> : for type `timer`, interval of the timer, seconds and nanoseconds
 - *optional* **`timerSettimeFlags`** integer : for type `timer`, flags with which timer was last armed
 - *optional* **`timerTicks`** integer : for type `timer`, number of timer expirations that have occured
 - *optional* **`timerValue`** Array\<integer> : for type `timer`, amount of time until the timer will next expire, seconds and nanoseconds

***


## type ProcessFd
Object with properties:
 - **`type`** string : `pipe`, `socket`, `file` or `anon-inode`
 - *optional* **`anonInodeType`** string : for `type` `anon-inode`, the file type, like `eventfd`, `eventpoll`
 - *optional* **`inode`** integer : for `type`s `pipe` and `socket`, the inode of this pipe or socket
 - *optional* **`path`** string : for `type` `file`, the file path

***


## type ProcessExe
Object with properties:
 - **`deleted`** boolean : if path have been unlinked
 - **`path`** string : actual path of executed command

***


## type NetDevice
Object with properties:
 - **`name`** string : `Interface` interface name
 - **`rxBytes`** integer : `Receive/bytes` number of received bytes
 - **`rxCompressed`** integer : `Receive/compressed` number of compressed packets received
 - **`rxDrop`** integer : `Receive/drop` number of received packets dropped
 - **`rxErrors`** integer : `Receive/errs` total number of receive errors
 - **`rxFifo`** integer : `Receive/fifo` number of receive FIFO buffer errors
 - **`rxFrame`** integer : `Receive/frame` number of packet framing errors
 - **`rxMulticast`** integer : `Receive/multicast` number of multicast frames received
 - **`rxPackets`** integer : `Receive/packets` number of received packets
 - **`txBytes`** integer : `Transmit/bytes` transmitted bytes
 - **`txCarrier`** integer : `Transmit/carrier` number of carrier losses detected on the interface
 - **`txColls`** integer : `Transmit/colls` number of collisions detected on the interface
 - **`txCompressed`** integer : `Transmit/compressed` number of compressed packets transmitted
 - **`txDrop`** integer : `Transmit/drop` number of transmit packets dropped
 - **`txErrors`** integer : `Transmit/errs` total number of transmit errors
 - **`txFifo`** integer : `Transmit/fifo` number of transmit FIFO buffer errors
 - **`txPackets`** integer : `Transmit/packets` transmitted packets

***


## type NetWirelessDevice
Object with properties:
 - **`discardedCrypt`** integer : number of packets discarded due to
 - **`discardedFrag`** integer : number of packets discarded due to inability to perform MAC reassembly
 - **`discardedMisc`** integer : number of packets discarded due to other reasons
 - **`discardedNwid`** integer : number of packets discarded due to wrong nwid/essid
 - **`discardedRetry`** integer : number of packets discarded due to max MAC retries num reached
 - **`level`** Float : signal strength at the receiver
 - **`link`** Float : general quality of the reception
 - **`missedBeacons`** integer : number of missed beacons/superframes
 - **`name`** string : interface name
 - **`noise`** Float : silence level (no packet) at the receiver

***


## type NetUnixSocket
Object with properties:
 - **`referenceCount`** integer : number of users of the socket
 - **`slot`** string : kernel table slot number
 - **`type`** integer : socket type, `1` for `SOCK_STREAM` sockets, `2` for `SOCK_DGRAM` sockets, `5` for `SOCK_SEQPACKET` sockets
 - *optional* **`path`** string : bound pathname (if any) of the socket. For sockets in the abstract namespace, starts with at sign(char code 64).

***


## type NetSocket4
Object with properties:
 - **`localAddress`** integer : local address as 32 bit integer
 - **`localPort`** integer : local port
 - **`remoteAddress`** integer : remote address as 32 bit integer
 - **`remotePort`** integer : remote port
 - **`rxQueue`** integer : incoming queue memory usage
 - **`slot`** integer : kernel hash slot for the socket
 - **`txQueue`** integer : outgoing queue memory usage
 - **`uid`** integer : effective UID of the creator of the socket

***


## type NetSocket6
Object with properties:
 - **`localAddress`** string : local address as hexadecimal string
 - **`localPort`** integer : local port
 - **`remoteAddress`** string : remote address as hexadecimal string
 - **`remotePort`** integer : remote port
 - **`rxQueue`** integer : incoming queue memory usage
 - **`slot`** integer : kernel hash slot for the socket
 - **`txQueue`** integer : outgoing queue memory usage
 - **`uid`** integer : effective UID of the creator of the socket

***


## ProcfsError
extends `Error` with properties:
 - **`code`** string: error code, one of:
   - `EPARSE`(`Procfs.ERR_PARSING_FAILED`): guard error, if you see this, consider submitting a bug report
   - `EUNKNOWN`(`Procfs.ERR_UNKNOWN`): completely unexpected error, if you see this, consider submitting a bug report
   - `ENOENT`(`Procfs.ERR_NOT_FOUND`): target file not found(or we were denied access)
 - *optional* **`sourceText`** string: for parsing errors, a part of file we encountered problem with
 - *optional* **`sourceError`** Error: when applicable, underlying error



