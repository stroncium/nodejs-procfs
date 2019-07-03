module.exports = new Map([
	[3, {type: 'signal', pos: 0, mntId: 10, flags: 2, rtSignalMask: 0, signalMask: 6}],
	[4, {type: 'inotify', pos: 0, mntId: 11, flags: 0, inotifyFiles: [
		{wd: 2, mask: 134262783, ignoredMask: 0, inode: 8321066, deviceId: 8388609},
		{wd: 1, mask: 134262783, ignoredMask: 0, inode: 1648167, deviceId: 8388609},
	]}],
	[5, {type: 'fanotify', pos: 0, mntId: 11, flags: 2, fanotifyFlags: 0, fanotifyEventFlags: 0x88002, fanotifyMarks: [
		{deviceId: 8388609, mask: 1, ignoredMask: 0, inode: 1648207, flags: 0},
	]}],
	[6, {type: 'timer', pos: 0, mntId: 13, flags: 526338, timerClockId: 0, timerTicks: 0, timerSettimeFlags: 3, timerValue: [7695568592, 640020877], timerInterval: [0, 0]}],
	[7, {type: 'fanotify', pos: 0, mntId: 11, flags: 2, fanotifyFlags: 0, fanotifyEventFlags: 0x88002, fanotifyMarks: [
		{deviceId: 8388609, mask: 1, ignoredMask: 0, inode: 1648207, flags: 0},
	]}],
	[8, {type: 'signal', pos: 0, mntId: 10, flags: 2, rtSignalMask: 0, signalMask: 6}],
]);
