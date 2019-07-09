package procfs;

/**
Path string
**/
typedef Path = String;

/**
Device ID. Major and minor parts can be extracted using utility functions `procfs.devIdGetMinor`, `procfs.devIdGetMajor` and combined using `procfs.devIdFromMajorMinor`.
**/
typedef DevId = Int;

/**
@field mountId unique ID for the mount (may be reused after umount)
@field parentId ID of the parent mount (or of self for the root of this mount namespace's mount tree)
@field devId value of st_dev for files on this filesystem
@field root pathname of the directory in the filesystem which forms the root of this mount
@field mountPoint pathname of the mount point relative to the process's root directory
@field mountOptions per-mount options
@field optionalFields zero or more fields of the form "tag[:value]"
@field type filesystem type in the form "type[.subtype]"
@field mountSource filesystem-specific information or "none"
@field superOptions per-superblock options
**/
typedef ProcessMountinfo = {
	mountId: Int,
	parentId: Int,
	devId: DevId,
	root: String,
	mountPoint: Path,
	mountOptions: Array<String>,
	optionalFields: Array<String>,
	type: String,
	mountSource: String,
	superOptions: Array<String>,
};

/**
@field read `rchar` number of bytes read
@field write `wchar` number of bytes written
@field readSyscalls `syscr` number of read syscalls
@field writeSyscalls `syscw` number of write syscalls
@field readReal `read_bytes` number of bytes read which were really fetched from storage layer
@field writeReal `write_bytes` number of bytes written which were really sent to storage layer
@field writeCancelled `cancelled_write_bytes` number of bytes process caused to not be written
**/
typedef ProcessIo = {
	read: Int,
	write: Int,
	readReal: Int,
	writeReal: Int,
	readSyscalls: Int,
	writeSyscalls: Int,
	writeCancelled: Int,
};

/**
@field targetStart start of the range of IDs in the user namespace of the target process
@field start start of the range of IDs to which the IDs do map
   Interpretation depends on whether the process that opened and the target process pid are in the same user namespace.
   If the two processes are in different user namespaces, it is the start of a range of IDs in the user namespace of the process that opened the file
   If the two processes are in the same user namespace it is the start of the range of IDs in the parent user namespace of target process.
@field length length of the range of IDs that is mapped between the two user namespaces
**/
typedef ProcessIdMapRange = {
	targetStart: Int,
	start: Int,
	length: Int,
};

/**
@field name autogroup name
@field nice autogroup nice value
**/
typedef ProcessAutogroup = {
	name: String,
	nice: Int,
};

typedef ProcessStatm = {
	size: Int,
	resident: Int,
	shared: Int,
	text: Int,
	data: Int,
};

/**
@field hierarchyId `hierarchy-ID` For cgroups version 1 hierarchies, this field contains a unique hierarchy ID number that can be matched to a hierarchy ID in /proc/cgroups. For the cgroups version 2 hierarchy, this field contains the value 0.
@field controllers `controller-list` For cgroups version 1 hierarchies, this field contains a comma-separated list of the controllers bound to the hierarchy. For the cgroups version 2 hierarchy, this field is `undefined`.
@field path `cgroup-path` Pathname of the control group in the hierarchy to which the process belongs. This pathname is relative to the mount point of the hierarchy.
**/
typedef ProcessCgroup = {
	hierarchyId: Int,
	?controllers: Array<String>,
	path: String,
};

/**
@field name `subsys_name` name of the controller
@field hierarchyId `hierarchy` unique ID of the cgroup hierarchy on which this controller is mounted. The value in this field will be 0 if the controller is not mounted on a cgroups v1 hierarchy, if the controller is bound to the cgroups v2 single unified hierarchy or if the controller is disabled.
@field cgroupsNumber `num_cgroups` number of control groups in this hierarchy using this controller
@field enabled `enabled`
**/
typedef CgroupController = {
	name: String,
	hierarchyId: Int,
	cgroupsNumber: Int,
	enabled: Bool,
};

/**
@field name `Limit` resource limit name
@field soft `Soft Limit` soft limit, `undefined` if unlimited
@field hard `Hard Limit` hard limit, `undefined` if unlimited
@field units `Units` units limit is measured in, `undefined` if scalar
**/
typedef ProcessLimit = {
	name: String,
	?soft: Int,
	?hard: Int,
	?units: String,
};



/**
Only (arguably) most valuable fields included so far.
@field pid `pid` The process PID
@field comm `comm` The filename of the executable. Visible whether or not the executable is swapped out.
@field state `state` One of the following characters, indicating process state: `R`(running), `S`(sleeping in an interruptible wait), `D`(waiting in uninterruptible disk sleep), `Z`(Zombie), `T`(stopped or trace stopped), `t`(tracing stop), `X`(dead).
@field parent `ppid` The PID of the parent of the process.
@field processGroup `pgrp` The process group ID of the process.
@field session `session` The session ID of the process.
@field tty `tty_nr` The controlling terminal of the process.
@field terminalProcessGroup `tpgid` The ID of the foreground process group of the controlling terminal of the process.
@field flags `flags` The kernel flags word of the process.
@field minorFaults `minflt` The number of minor faults the process has made which have not required loading a memory page from disk.
@field childMinorFaults `cminflt` The number of minor faults that the process's waited-for children have made.
@field majorFaults `majflt` The number of major faults the process has made which have required loading a memory page from disk.
@field childMajorFaults `cmajflt` The number of major faults that the process's waited-for children have made.
@field userTicks `utime` Amount of time that this process has been scheduled in user mode(includes guest time), in ticks.
@field kernelTicks `stime` Amount of time that this process has been scheduled in kernel mode, in ticks.
@field childUserTicks `cutime` Amount of time that this process's waited-for children have been scheduled in user mode, in ticks.
@field childKernelTicks `cstime` Amount of time that this process's waited-for children have been scheduled in kernel mode, in ticks.
@field priority `priority` For processes running a real-time scheduling policy (policy below), this is the negated scheduling priority, minus one; that is, a number in the range -2 to -100, corresponding to real-time priorities 1 to 99. For processes running under a non-real-time scheduling policy, this is the raw nice value (setpriority(2)) as represented in the kernel. The kernel stores nice values as numbers in the range 0 (high) to 39 (low), corresponding to the user-visible nice range of -20 to 19.
@field nice `nice` The nice value, a value in the range 19(low priority) to -20(high priority).
@field threads `num_threads` Number of threads in this process.
@field startTicks `starttime` The time the process started after system boot, in ticks.
@field vsize `vsize` Virtual memory size in bytes.
@field rss `rss` Resident Set Size, number of pages the process has in real memory. This is just the pages which count toward text, data, or stack space. This does not include pages which have not been demand-loaded in, or which are swapped out.
@field rssSoftLimit `rsslim` Current soft limit in bytes on the rss of the process.
@field exitSignal `exit_signal` Signal to be sent to parent when we die
@field lastCpu `processor` CPU number last executed on.
@field realtimePriority `rt_priority` Real-time scheduling priority, a number in the range 1 to 99 for processes scheduled under a real-time policy, or 0, for non-real-time processes.
@field schedulingPolicy `policy` Scheduling policy.
@field blockIoTicks `delayacct_blkio_ticks` Aggregated block I/O delays, in ticks.
@field guestTicks Guest time of the process (time spent running a virtual CPU for a guest operating system), in ticks.
@field childGuestTicks Guest time of the process's children, in ticks.
**/
typedef ProcessStat = {
	pid: Int,
	comm: String,
	state: String,
	parent: Int,
	processGroup: Int,
	session: Int,
	tty: Int,
	terminalProcessGroup: Int,
	flags: Int,
	minorFaults: Int,
	childMinorFaults: Int,
	majorFaults: Int,
	childMajorFaults: Int,
	userTicks: Int,
	kernelTicks: Int,
	childUserTicks: Int,
	childKernelTicks: Int,
	priority: Int,
	nice: Int,
	threads: Int,
	startTicks: Int,
	vsize: Int,
	rss: Int,
	rssSoftLimit: Float,
	exitSignal: Int,
	lastCpu: Int,
	realtimePriority: Int,
	schedulingPolicy: Int,
	blockIoTicks: Int,
	guestTicks: Int,
	childGuestTicks: Int,
};

/**
@field umask Available since Linux 4.7
@field speculationStoreBypass Available since Linux 4.17
@field rssAnon Available since Linux 4.5
@field rssFile Available since Linux 4.5
@field rssShmem Available since Linux 4.5
@field noNewPrivs Available since Linux 4.10
@field coreDumping Available since Linux 4.15
**/
typedef ProcessStatus = {
	name: String,
	?umask: Int,
	state: String,
	threadGroupId: Int,
	numaGroupId: Int,
	pid: Int,
	parent: Int,
	tracer: Int,
	uidReal: Int,
	uidEffective: Int,
	uidSavedSet: Int,
	uidFilesystem: Int,
	gidReal: Int,
	gidEffective: Int,
	gidSavedSet: Int,
	gidFilesystem: Int,
	fdSize: Int,
	groups: Array<Int>,
	vmPeak: Int,
	vmSize: Int,
	vmLocked: Int,
	vmPinned: Int,
	vmHwm: Int,
	vmRss: Int,
	?rssAnon: Int,
	?rssFile: Int,
	?rssShmem: Int,
	vmData: Int,
	vmStack: Int,
	vmExe: Int,
	vmLib: Int,
	vmPte: Int,
	vmSwap: Int,
	hugetlbPagesSize: Int,
	?coreDumping: Bool,
	threads: Int,
	signalsQueued: Int,
	signalsQueuedLimit: Int,
	signalsPending: Int,
	sharedSignalsPending: Int,
	signalsBlocked: String, //TODO
	signalsIgnored: String, //TODO
	signalsCaught: String, //TODO
	capabilityInheritable: String, //TODO
	capabilityPermitted: String, //TODO
	capabilityEffective: String, //TODO
	capabilityBounding: String, //TODO
	capabilityAmbient: String, //TODO
	?noNewPrivs: Bool,
	seccompMode: Int,
	?speculationStoreBypass: String,
	cpusAllowedMask: Int,
	memoriesAllowedMask: Int,
	contextSwitchesVoluntary: Int,
	contextSwitchesNonvoluntary: Int,
};

typedef CpuCoreInfo = {
	id: Int,
	vendorId: String,
	family: Int,
	model: Int,
	modelName: String,
	stepping: Int,
	microcode: String,
	cpuMhz: Float,
	cacheSize: String,
	physicalId: Int,
	siblings: Int,
	coreId: Int,
	cores: Int,
	apicId: Int,
	initialApicId: Int,
	fpu: Bool,
	fpuException: Bool,
	cpuidLevel: Int,
	wp: Bool,
	flags: Array<String>,
	bugs: Array<String>,
	bogoMips: Int,
	clflushSize: Int,
	cacheAlignment: Int,
	addressSizes: String,
};

/**
	@field jobsAverage1Minute number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 1 minute
	@field jobsAverage5Minutes number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 5 minutes
	@field jobsAverage15Minutes number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 15 minutes
	@field runnableEntities number of currently runnable kernel scheduling entities
	@field existingEntities number of kernel scheduling entities that currently exist on the system
	@field mostRecentlyCreatedPid pid of the process that was most recently created on the system
**/
typedef Loadavg = {
	jobsAverage1Minute: Float,
	jobsAverage5Minutes: Float,
	jobsAverage15Minutes: Float,
	runnableEntities: Float,
	existingEntities: Float,
	mostRecentlyCreatedPid: Float,
};

/**
@field time uptime of the system, including time spend in suspend, in seconds
@field idle amount of time spent in the idle process, in seconds
**/
typedef Uptime = {
	idle: Float,
	time: Float,
};

/**
@field path `Filename`
@field type `Type`
@field size `Size` size, in blocks
@field used `Used` used, in blocks
@field priority `Priority`
**/
typedef Swap = {
	path: Path,
	type: String,
	size: Int,
	used: Int,
	priority: Int,
};

/**
Note: amounts are in units of USER_HZ(a.k.a. ticks) which are 1/100ths of a second on most architectures, use sysconf(_SC_CLK_TCK) to obtain the right value)

@field user `user` time spent in user mode, in ticks
@field nice `nice` time spent in user mode with low priority, in ticks
@field system `system` time spent in system mode, in ticks
@field idle `idle` time spent in the idle task, in ticks
@field iowait `iowait` time waiting for I/O to complete, value is not reliable, in ticks
@field irq `irq` time servicing interrupts, in ticks
@field softirq `softirq` time servicing softirqs, in ticks
@field steal `steal` stolen time, which is the time spent in other operating systems when running in a virtualized environment, in ticks
@field guest `guest` time spent running a virtual CPU for guest operating systems under the control of the Linux kernel, in ticks
@field guestNice `guest_nice` time spent running a niced guest (virtual CPU for guest operating systems under the control of the Linux kernel), in ticks
**/
typedef StatCpuTime = {
	user: Int,
	nice: Int,
	system: Int,
	idle: Int,
	iowait: Int,
	irq: Int,
	softirq: Int,
	steal: Int,
	guest: Int,
	guestNice: Int,
};

/**
@field cpuTime time spent in various states, for each CPU
@field systemCpuTime time system spent in various states
@field interrupts total number of all interrupts serviced including unnumbered architecture specific interrupts
@field numberedInterrupts number of interrupts serviced for each numbered interrupt
@field contextSwitches number of context switches that the system underwent
@field bootTime boot time, in seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC)
@field forks number of forks since boot
@field processesRunning number of processes in runnable state
@field processesBlocked number of processes blocked waiting for I/O to complete
@field softInterrupts total number of soft interrupts serviced
@field numberedSoftInterrupts number of soft interrupts serviced for each softirq
**/
typedef Stat = {
	cpuTime: Array<StatCpuTime>,
	systemCpuTime: StatCpuTime,
	interrupts: Int,
	numberedInterrupts: Array<Int>,
	contextSwitches: Int,
	bootTime: Date,
	forks: Int,
	processesRunning: Int,
	processesBlocked: Int,
	softInterrupts: Int,
	numberedSoftInterrupts: Array<Int>,
};

/**
@field major Device ID major part
@field group Group name
@field type `character` or `block`
**/
typedef Device = {
	major: Int,
	group: String,
	type: String,
};

/**
	@field name filesystem name
	@field requiresBlockDevice if filesystem requires a block device to be mounted (unlike e.g., virtual filesystem, network filesystem)
**/
typedef Filesystem = {
	requiresBlockDevice: Bool,
	name: String,
};

/**
@field reads total number of reads
@field readsMerged number of reads merged
@field sectoresRead total number of sectors read
@field readTime milliseconds spent reading
@field writes total number of writes
@field writesMerged number of writes merged
@field sectorsWriten total number of sectors written
@field writeTime milliseconds spent writing
@field currentIoCount number of of IOs currently in progress
@field ioTime milliseconds spent doing IO
@field weightedIoTime weighted milliseconds spent doing I/Os. This field is incremented at each I/O start, I/O completion, I/O merge, or read of these stats by the number of I/Os in progress times the number of milliseconds spent doing I/O since the last update of this field.  This can provide an easy measure of both I/O completion time and the backlog that may be accumulating.
**/
typedef Diskstat = {
	devId: DevId,
	name: String,
	reads: Int,
	readsMerged: Int,
	sectorsRead: Int,
	readTime: Int,
	writes: Int,
	writesMerged: Int,
	sectorsWriten: Int,
	writeTime: Int,
	currentIoCount: Int,
	ioTime: Int,
	weightedIoTime: Int,
};

/**
@field devId major and minor numbers of device
@field blocks number of 1024-byte blocks on partition
@field name partition name
**/
typedef Partition = {
	devId: DevId,
	blocks: Int,
	name: String,
};

/**
Memory amounts are expressed in KiB.

@field total `MemTotal` Total usable RAM
@field free `MemFree` Amount of free RAM
@field available `MemAvailable` An estimate of how much memory is available for starting new applications, without swapping
@field buffers `Buffers` Relatively temporary storage for raw disk blocks that shouldn't get tremendously large
@field cached `Cached` In-memory cache for files read from the disk (the page cache). Doesn't include Swap‐Cached.
@field swapCached `SwapCached` Memory that once was swapped out, is swapped back in but still also is in the swap file. (If memory pressure is high, these pages don't need to be swapped out again because they are already in the swap file. This saves I/O.)
@field active `Active` Memory that has been used more recently and usually not reclaimed unless absolutely necessary.
@field inactive `Inactive` Memory which has been less recently used. It is more eligible to be reclaimed for other purposes.
@field swapTotal `SwapTotal` Total amount of swap space available.
@field swapFree `SwapFree` Amount of swap space that is currently unused.
@field dirty `Dirty` Memory which is waiting to get written back to the disk.
@field writeback `Writeback` Memory which is actively being written back to the disk.
@field anonPages `AnonPages` Non-file backed pages mapped into user-space page tables.
@field mapped `Mapped` Files which have been mapped into memory (with mmap), such as libraries.
@field shmem `Shmem` Amount of memory consumed in tmpfs filesystems.
@field kernelReclaimable `KReclaimable` Kernel allocations that the kernel will attempt to reclaim under memory pressure. Includes `SReclaimable` and other direct allocations with a shrinker. Available since Linux 4.20.
@field slab `Slab` In-kernel data structures cache.
@field slabReclaimable `SReclaimable` Part of Slab, that might be reclaimed, such as caches.
@field slabUnreclaimable `SUnreclaim` Part of Slab, that cannot be reclaimed on memory pressure.
@field kernelStack `KernelStack` Amount of memory allocated to kernel stacks.
@field pageTables `PageTables` Amount of memory dedicated to the lowest level of page tables.
@field bounceBuffers `Bounce` Memory used for block device "bounce buffers".
@field writebackTmp `WritebackTmp` Memory used by FUSE for temporary writeback buffers.
@field commitLimit `CommitLimit` Total amount of memory currently available to be allocated on the system.
@field vmallocTotal `VmallocTotal` Total size of vmalloc memory area.
@field hardwareCorrupted `HardwareCorrupted` Available if the kernel is configured with `CONFIG_MEMORY_FAILURE`.
@field anonHugePages `AnonHugePages` Non-file backed huge pages mapped into userspace page tables. Available if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field shmemHugePages `ShmemHugePages` Memory used by shared memory and tmpfs allocated with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field shmemPmdMapped `ShmemPmdMapped` Shared memory mapped into user space with huge pages. Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`.
@field hugepagesTotal `HugePages_Total` The size of the pool of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesFree `HugePages_Free` The number of huge pages in the pool that are not yet allocated. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesReserved `HugePages_Rsvd` This is the number of huge pages for which a commitment to allocate from the pool has been made, but no allocation has yet been made. These reserved huge pages guarantee that an application will be able to allocate a huge page from the pool of huge pages at fault time. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepagesSurplus `HugePages_Surp` This is the number of huge pages in the pool above the value in `/proc/sys/vm/nr_hugepages`. The maximum number of surplus huge pages is controlled by `/proc/sys/vm/nr_overcommit_hugepages`. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field hugepageSize `Hugepagesize` The size of huge pages. Available if the kernel is configured with `CONFIG_HUGETLB_PAGE`.
@field directMap4K `DirectMap4k` Number of bytes of RAM linearly mapped by kernel in 4kB pages
@field directMap2M `DirectMap2M` Number of bytes of RAM linearly mapped by kernel in 2MB pages.
@field directMap4M `DirectMap4M` Number of bytes of RAM linearly mapped by kernel in 4MB pages.
@field directMap1G `DirectMap1G` Number of bytes of RAM linearly mapped by kernel in 1GB pages.
**/
typedef Meminfo = {
	total: Int,
	free: Int,
	available: Int,
	buffers: Int,
	cached: Int,
	swapCached: Int,
	active: Int,
	inactive: Int,
	swapTotal: Int,
	swapFree: Int,
	dirty: Int,
	writeback: Int,
	anonPages: Int,
	mapped: Int,
	shmem: Int,
	?kernelReclaimable: Int,
	slab: Int,
	slabReclaimable: Int,
	slabUnreclaimable: Int,
	kernelStack: Int,
	pageTables: Int,
	bounceBuffers: Int,
	writebackTmp: Int,
	commitLimit: Int,
	vmallocTotal: Int,
	?hardwareCorrupted: Int,
	anonHugePages: Int,
	?shmemHugePages: Int,
	?shmemPmdMapped: Int,
	?hugepagesTotal: Int,
	?hugepagesFree: Int,
	?hugepagesReserved: Int,
	?hugepagesSurplus: Int,
	?hugepageSize: Int,
	directMap4K: Int,
	directMap2M: Int,
	directMap4M: Int,
	directMap1G: Int,
};

typedef ProcessFdinfoEpollCounter = {
	fd: Int,
	eventMask: Int,
	data: String, //TODO
};

typedef ProcessFdinfoInotifyFile = {
	wd: Int,
	mask: Int,
	ignoredMask: Int,
	inode: Int,
	deviceId: Int,
};

typedef ProcessFdinfoFanotifyMark = {
	deviceId: Int,
	mask: Int,
	ignoredMask: Int,
	inode: Int,
	flags: Int,
};

typedef ProcessFdinfo = {
	type: String,
	pos: Int,
	mntId: Int,
	flags: Int,
	?eventfdCounter: Int,
	?epollCounters: Array<ProcessFdinfoEpollCounter>,
	?rtSignalMask: Int,
	?signalMask: Int,
	?inotifyFiles: Array<ProcessFdinfoInotifyFile>,
	?fanotifyFlags: Int,
	?fanotifyEventFlags: Int,
	?fanotifyMarks: Array<ProcessFdinfoFanotifyMark>,
	?timerClockId: Int,
	?timerTicks: Int,
	?timerSettimeFlags: Int,
	?timerValue: Array<Int>,
	?timerInterval: Array<Int>,
};

/**
	@field path actual path of executed command
	@field deleted if path have been unlinked
**/
typedef ProcessExe = {
	path: String,
	deleted: Bool,
};

extern class Procfs{
/**
Parses contents of `/proc/<pid>/mountinfo`
@param pid process pid, `self` process if undefined
**/
	public static function processMountinfo(?pid:Int): Array<ProcessMountinfo>;

/**
Parses contents of `/proc/<pid>/io`
@param pid process pid, `self` process if undefined
**/
	public static function processIo(?pid:Int): ProcessIo;

/**
Parses contents of `/proc/<pid>/uid_map`
@param pid process pid, `self` process if undefined
**/
	public static function processUidMap(?pid:Int): Array<ProcessIdMapRange>;

/**
Parses contents of `/proc/<pid>/gid_map`
@param pid process pid, `self` process if undefined
**/
	public static function processGidMap(?pid:Int): Array<ProcessIdMapRange>;

/**
Parses contents of `/proc/<pid>/environ`
@param pid process pid, `self` process if undefined
@unstable
**/
	public static function processEnviron(?pid:Int): Dynamic;

/**
Parses contents of `/proc/<pid>/oom_score`
@param pid process pid, `self` process if undefined
@returns current score that the kernel gives to this process for the purpose of selecting a process for the OOM-killer
**/
	public static function processOomScore(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/timerslack_ns`
@param pid process pid, `self` process if undefined
@returns process's "current" timer slack value, in nanoseconds
**/
	public static function processTimerslackNs(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/cmdline`
Complete list of command-line arguments for the process, unless the process is a zombie. In the latter case, `null`.
Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
@param pid process pid, `self` process if undefined
**/
	public static function processCmdline(?pid:Int): Null<Array<String>>;

/**
Parses contents of `/proc/<pid>/autogroup`
@param pid process pid, `self` process if undefined
**/
	public static function processAutogroup(?pid:Int): ProcessAutogroup;

/**
Parses contents of `/proc/<pid>/statm`
@param pid process pid, `self` process if undefined
@unstable
**/
	public static function processStatm(?pid:Int): ProcessStatm;

/**
Parses contents of `/proc/<pid>/comm`
Note: different threads in the same process may have different comm values

@param pid process pid, `self` process if undefined
@returns the command name associated with the process
**/
	public static function processComm(?pid:Int): String;

/**
Parses contents of `/proc/<pid>/setgroups`
Returns `"allow"` if processes in the user namespace that contains the target process are permitted to employ the `setgroups` system call, `"deny"` otherwise.
Note: regardless of the value, calls to `setgroups` are also not permitted if `/proc/[pid]/gid_map` has not yet been set.

@param pid process pid, `self` process if undefined
@returns `allow` or `deny`
@unstable will be changed to return boolean
**/
	public static function processSetgroups(?pid:Int): String;

/**
Parses contents of `/proc/<pid>/cgroups`
@param pid process pid, `self` process if undefined
@returns control groups to which the process belongs
**/
	public static function processCgroups(?pid:Int): Array<ProcessCgroup>;

/**
Parses contents of `/proc/<pid>/personality`
Process's execution domain, as set by `personality`.
Note: permission to access this file is governed by ptrace access mode `PTRACE_MODE_ATTACH_FSCREDS`

@param pid process pid, `self` process if undefined
**/
	public static function processPersonality(?pid:Int): Int;

/**
Parses contents of `/proc/<pid>/cpuset`
@param pid process pid, `self` process if undefined
@returns path of the process's cpuset directory relative to the root of the cpuset filesystem
**/
	public static function processCpuset(?pid:Int): String;

/**
Parses contents of `/proc/<pid>/limits`
@param pid process pid, `self` process if undefined
@returns process's resource limits
**/
	public static function processLimits(?pid:Int): Array<ProcessLimit>;

/**
Parses contents of `/proc/<pid>/stat`
@param pid process pid, `self` process if undefined
@returns status information about the process(used by `ps`)
**/
	public static function processStat(?pid:Int): ProcessStat;

/**
Parses contents of `/proc/<pid>/status`
Depending on `hidepid` option `procfs` was mounted with, may not be accessible by anyone but process owner.
@param pid process pid, `self` process if undefined
@unstable
**/
	public static function processStatus(?pid:Int): ProcessStatus;

/**
Parses list of `/proc/<pid>/fd/*` entries.
@param pid process pid, `self` process if undefined
@return process's current open fds
**/
	public static function processFds(?pid:Int): Array<Int>;

/**
Parses list of `/proc/<pid>/task/*` entries.
@param pid process pid, `self` process if undefined
@returns process's current threads
**/
	public static function processThreads(?pid:Int): Array<Int>;

/**
Parses contents of `/proc/<pid>/fdinfo/<fd>`
@param pid process pid, `self` process if undefined
@param fd fd in question
@unstable
**/
	public static function processFdinfo(fd:Int, ?pid:Int): ProcessFdinfo;

/**
Parses contents of `/proc/<pid>/fd/<fd>`
@param pid process pid, `self` process if undefined
@param fd fd in question
@unstable
**/
	public static function processFd(fd:Int, ?pid:Int): String;

/**
Reads symlink at `/proc/<pid>/exe`
@param pid process pid, `self` process if undefined
**/
	public static function processExe(?pid:Int): ProcessExe;

/**
Reads symlink at `/proc/<pid>/cwd`
Note: in a multithreaded process, it is not available if the main thread has already terminated.
Note: permission to read this file(symlink) is governed by ptrace access mode `PTRACE_MODE_READ_FSCREDS`.

@param pid process pid, `self` process if undefined
@returns path to process `cwd`
**/
	public static function processCwd(?pid:Int): Path;

/**
Parses contents of `/proc/cpuinfo`
@unstable documentation on that is hard to find, need to get at least a list of fields which are present on all systems or just remove this method from the library
**/
	public static function cpuinfo(): Array<CpuCoreInfo>;

/**
Parses contents of `/proc/loadavg`
**/
	public static function loadavg(): Loadavg;

/**
Parses contents of `/proc/uptime`
**/
	public static function uptime(): Uptime;

/**
Parses contents of `/proc/version`
Note: includes the contents of `/proc/sys/kernel/ostype`, `/proc/sys/kernel/osrelease` and `/proc/sys/kernel/version`.
@returns identifies the kernel version that is currently running
**/
	public static function version(): String;

/**
Parses contents of `/proc/cmdline`
@returns arguments passed to the Linux kernel at boot time
**/
	public static function cmdline(): String;

/**
Parses contents of `/proc/swaps`
@returns swap areas in use
**/
	public static function swaps(): Array<Swap>;

/**
Parses contents of `/proc/stat`
@returns kernel/system statistics
**/
	public static function stat(): Stat;

/**
Parses contents of `/proc/devices`
@returns major numbers and device groups.
**/
	public static function devices(): Array<Device>;

/**
Parses contents of `/proc/filesystems`
@returns filesystems which are supported by the kernel(which were compiled into the kernel or whose kernel modules are currently loaded)
**/
	public static function filesystems(): Array<Filesystem>;

/**
Parses contents of `/proc/diskstats`
@returns I/O statistics for each disk device
**/
	public static function diskstats(): Array<Diskstat>;

/**
Parses contents of `/proc/partitions`
@returns partitions in system
**/
	public static function partitions(): Array<Partition>;

/**
Parses contents of `/proc/meminfo`
@returns statistics about memory usage on the system
**/
	public static function meminfo(): Meminfo;

/**
Parses list of `/proc/*` entries.
Depending on `hidepid` option `procfs` was mounted with, may only contain user's own processes.
@returns pids of currently running processes
**/
	public static function processes(): Array<Int>;

/**
Available if the kernel is configured with `CONFIG_IKCONFIG_PROC`
@returns gunziped content of `/proc/config.gz`
**/
	public static function config(): String;

/**
@returns controllers that are compiled into the kernel
**/
	public static function cgroups(): Array<CgroupController>;

/**
@returns minor part of devId
**/
	public static function devIdGetMinor(devId:DevId):Int;

/**
@returns major part of devId
**/
	public static function devIdGetMajor(devId:DevId):Int;

/**
@param major major part of DevId
@param minor minor part of DevId
@returns id combined from major and minor parts
**/
	public static function devIdFromMajorMinor(major:Int, minor:Int):DevId;
}
