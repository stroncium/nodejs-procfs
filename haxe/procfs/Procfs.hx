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
@field parentId ID of the parent mount (or of self for the root of  this  mount  namespace's mount tree)
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
@field read `rchar`, number of bytes read
@field write `wchar`, number of bytes written
@field readSyscalls `syscr`, number of read syscalls
@field writeSyscalls `syscw`, number of write syscalls
@field readReal `read_bytes`, number of bytes read which were really fetched from storage layer
@field writeReal `write_bytes`, number of bytes written which were really sent to storage layer
@field writeCancelled `cancelled_write_bytes`, number of bytes process caused to not be written
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

typedef ProcessCgroup = {
	id: Int,
	subsystems: Array<String>,
	group: String,
};

/**
@field name `Limit`, resource limit name
@field soft `Soft Limit`, soft limit, `undefined` if unlimited
@field hard `Hard Limit`, hard limit, `undefined` if unlimited
@field units `Units`, units limit is measured in, `undefined` if scalar
**/
typedef ProcessLimit = {
	name: String,
	?soft: Int,
	?hard: Int,
	?units: String,
};

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
	kernelTicks: Int, //TODO systemTicks
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
	@field jobsAvg1Min number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 1 minute
	@field jobsAvg5Min number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 5 minutes
	@field jobsAvg15Min number of jobs in the run queue (state R) or waiting for disk I/O (state D) averaged over 15 minutes
	@field runnableEntities number of currently runnable kernel scheduling entities
	@field existingEntities number of kernel scheduling entities that currently exist on the system
	@field mostRecentlyCreatedPid pid of the process that was most recently created on the system
**/
typedef Loadavg = {
	jobsAvg1Min: Float,
	jobsAvg5Min: Float,
	jobsAvg15Min: Float,
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
@field filename `Filename`
@field type `Type`
@field size `Size`
@field used `Used`
@field priority `Priority`
**/
typedef Swap = {
	filename: Path,
	type: String,
	size: Int,
	used: Int,
	priority: Int,
};

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

typedef Stat = {
	cpuTime: Array<StatCpuTime>,
	systemCpuTime: StatCpuTime,
	interrupts: Int,
	numberedInterrupts: Array<Int>,
	contextSwitches: Int,
	bootTime: Date,
	processes: Int,
	processesRunning: Int,
	processesBlocking: Int,
	softInterrupts: Int,
	numberedSoftInterrupts: Array<Int>,
	?pageIn: Int,
	?pageOut: Int,
	?swapIn: Int,
	?swapOut: Int,
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

typedef Diskstat = {
	major: Int,
	minor: Int,
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
@field shmemPmdMapped Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`
@field shmemHugePages Available since Linux 4.8 if the kernel is configured with `CONFIG_TRANSPARENT_HUGEPAGE`
@field kernelReclaimable Available since Linux 4.20
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
	hardwareCorrupted: Int,
	anonHugePages: Int,
	?shmemHugePages: Int,
	?shmemPmdMapped: Int,
	hugepagesTotal: Int,
	hugepagesFree: Int,
	hugepagesReserved: Int,
	hugepagesSurplus: Int,
	hugepageSize: Int,
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
		@unstable
	**/
	public static function processSetgroups(?pid:Int): String;

	/**
		Parses contents of `/proc/<pid>/cgroups`
		@param pid process pid, `self` process if undefined
		@unstable
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
		@unstable
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
		@unstable
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
		@unstable
	**/
	public static function swaps(): Array<Swap>;

	/**
		Parses contents of `/proc/stat`
		@unstable
	**/
	public static function stat(): Stat;

	/**
		Parses contents of `/proc/devices`
		@unstable
	**/
	public static function devices(): Array<Device>;

	/**
		Parses contents of `/proc/filesystems`
		@returns filesystems which are supported by the kernel(which were compiled into the kernel or whose kernel modules are currently loaded)
	**/
	public static function filesystems(): Array<Filesystem>;

	/**
		Parses contents of `/proc/diskstats`
		@unstable
	**/
	public static function diskstats(): Array<Diskstat>;

	/**
		Parses contents of `/proc/partitions`
		@returns partitions in system
	**/
	public static function partitions(): Array<Partition>;

	/**
		Parses contents of `/proc/meminfo`
		@unstable
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
