package procfs;

/**
Path string
**/
typedef Path = String;

/**
Device ID. Major and minor parts can be extracted using utility functions `procfs.devIdGetMinor`, `procfs.devIdGetMajor` and combined using `procfs.devIdFromMajorMinor`.
**/
typedef DevId = Int;

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

typedef ProcessIo = {
	read: Int,
	write: Int,
	readSyscalls: Int,
	writeSyscalls: Int,
	realRead: Int,
	realWrite: Int,
	cancelledWrite: Int,
};

typedef ProcessIdMapEntry = {
	sourceStart: Int,
	destinationStart: Int,
	length: Int,
};

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

typedef Loadavg = {
	jobsAvg1Min: Float,
	jobsAvg5Min: Float,
	jobsAvg15Min: Float,
	runnableEntities: Float,
	existingEntities: Float,
	mostRecentlyCreatedPid: Float,
};

typedef Uptime = {
	idle: Float,
	time: Float,
};

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

typedef ProcessExe = {
	path: String,
	deleted: Bool,
};

extern class Procfs{
	/**
		Parses contents of `/proc/<pid>/mountinfo`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processMountinfo(?pid:Int): Array<ProcessMountinfo>;

	/**
		Parses contents of `/proc/<pid>/io`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processIo(?pid:Int): ProcessIo;

	/**
		Parses contents of `/proc/<pid>/uid_map`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processUidMap(?pid:Int): Array<ProcessIdMapEntry>;

	/**
		Parses contents of `/proc/<pid>/gid_map`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processGidMap(?pid:Int): Array<ProcessIdMapEntry>;

	/**
		Parses contents of `/proc/<pid>/environ`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processEnviron(?pid:Int): Dynamic;

	/**
		Parses contents of `/proc/<pid>/oom_score`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processOomScore(?pid:Int): Int;

	/**
		Parses contents of `/proc/<pid>/timerslack_ns`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processTimerslackNs(?pid:Int): Int;

	/**
		Parses contents of `/proc/<pid>/cmdline`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processCmdline(?pid:Int): Array<String>;

	/**
		Parses contents of `/proc/<pid>/autogroup`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processAutogroup(?pid:Int): ProcessAutogroup;

	/**
		Parses contents of `/proc/<pid>/statm`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processStatm(?pid:Int): ProcessStatm;

	/**
		Parses contents of `/proc/<pid>/comm`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processComm(?pid:Int): String;

	/**
		Parses contents of `/proc/<pid>/setgroups`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processSetgroups(?pid:Int): String;

	/**
		Parses contents of `/proc/<pid>/cgroups`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processCgroups(?pid:Int): Array<ProcessCgroup>;

	/**
		Parses contents of `/proc/<pid>/personality`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processPersonality(?pid:Int): Int;

	/**
		Parses contents of `/proc/<pid>/cpuset`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processCpuset(?pid:Int): String;

	/**
		Parses contents of `/proc/<pid>/limits`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processLimits(?pid:Int): Array<ProcessLimit>;

	/**
		Parses contents of `/proc/<pid>/stat`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processStat(?pid:Int): ProcessStat;

	/**
		Parses contents of `/proc/<pid>/status`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processStatus(?pid:Int): ProcessStatus;

	/**
		Lists process curent fds, `/proc/<pid>/fd/*`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processFds(?pid:Int): Array<Int>;

	/**
		Lists process curent threads, `/proc/<pid>/task/*`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processThreads(?pid:Int): Array<Int>;

	/**
		Parses contents of `/proc/<pid>/fdinfo/<fd>`
		@param pid Process pid, self process if omitted
		@param fd fd in question
		@unstable
	**/
	public static function processFdinfo(fd:Int, ?pid:Int): ProcessFdinfo;

	/**
		Parses contents of `/proc/<pid>/fd/<fd>`
		@param pid Process pid, self process if omitted
		@param fd fd in question
		@unstable
	**/
	public static function processFd(fd:Int, ?pid:Int): String;

	/**
		Parses contents of `/proc/<pid>/exe`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processExe(?pid:Int): ProcessExe;

	/**
		Parses contents of `/proc/<pid>/cwd`
		@param pid Process pid, self process if omitted
		@unstable
	**/
	public static function processCwd(?pid:Int): String;

	/**
		Parses contents of `/proc/cpuinfo`
		@unstable
	**/
	public static function cpuinfo(): Array<CpuCoreInfo>;

	/**
		Parses contents of `/proc/loadavg`
		@unstable
	**/
	public static function loadavg(): Loadavg;

	/**
		Parses contents of `/proc/uptime`
		@unstable
	**/
	public static function uptime(): Uptime;

	/**
		Parses contents of `/proc/version`
		@unstable
	**/
	public static function version(): String;

	/**
		Parses contents of `/proc/cmdline`
		@unstable
	**/
	public static function cmdline(): String;

	/**
		Parses contents of `/proc/swaps`
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
		@unstable
	**/
	public static function filesystems(): Array<Filesystem>;

	/**
		Parses contents of `/proc/diskstats`
		@unstable
	**/
	public static function diskstats(): Array<Diskstat>;

	/**
		Parses contents of `/proc/partitions`
		@unstable
	**/
	public static function partitions(): Array<Partition>;

	/**
		Parses contents of `/proc/meminfo`
		@unstable
	**/
	public static function meminfo(): Meminfo;

	/**
		Parses list of `/proc/*` entries
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
