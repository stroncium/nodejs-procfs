module.exports = new Map([
	[3, {type: 'signal', position: 0, mountId: 10, flags: 2, rtSignalMask: 0, signalMask: 6}],
	[4, {type: 'inotify', position: 0, mountId: 11, flags: 0, inotifyFiles: [
		{wd: 2, mask: 134262783, ignoredMask: 0, inode: 8321066, devId: 8388609},
		{wd: 1, mask: 134262783, ignoredMask: 0, inode: 1648167, devId: 8388609},
	]}],
	[5, {type: 'fanotify', position: 0, mountId: 11, flags: 2, fanotifyFlags: 0, fanotifyEventFlags: 0x88002, fanotifyMarks: [
		{devId: 8388609, mask: 1, ignoredMask: 0, inode: 1648207, flags: 0},
	]}],
	[6, {type: 'timer', position: 0, mountId: 13, flags: 526338, timerClockId: 0, timerTicks: 0, timerSettimeFlags: 3, timerValue: [7695568592, 640020877], timerInterval: [0, 0]}],
	[7, {type: 'fanotify', position: 0, mountId: 11, flags: 2, fanotifyFlags: 0, fanotifyEventFlags: 0x88002, fanotifyMarks: [
		{devId: 8388609, mask: 1, ignoredMask: 0, inode: 1648207, flags: 0},
	]}],
	[8, {type: 'signal', position: 0, mountId: 10, flags: 2, rtSignalMask: 0, signalMask: 6}],
]);
