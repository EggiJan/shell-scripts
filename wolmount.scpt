JsOsaDAS1.001.00bplist00�Vscript_app = Application.currentApplication();
app.includeStandardAdditions = true;

// The IP Range the mount should work
// Example: 192.168.1.
ipRange = '';

// Absolute location of the wolcmd script
// You can get it here: https://www.depicus.com/wake-on-lan/wake-on-lan-for-apple-mac
wolcmdLocation = '/path/to/wolcmd';

// MAC Address of the NAS
// Example: 5fbff441ff5f
nasMAC = '';

// IP Adresse of the NAS
nasIP = '';

// I will mount by hostname -> don't forget the entry in /etc/hosts
nasHostname = 'NAS';

// Array of share names that should be mounted
// Example: ['STORAGE', 'BIGSTORAGE']
shares = [];

function isCorrectIpRange() {
	try {
		
		// Works only with en0
		ipWifi = app.doShellScript('ipconfig getifaddr en0');
		rx = new RegExp(ipRange);
		return ipWifi.match(rx);
	} catch(e) {
		return false;
	}
}

function isOnline() {
	try {
		connect = app.doShellScript('ping -c 2 -t 2 ' + nasIP)
		rx = new RegExp('2 packets received')
		return connect.match(rx);
	} catch(e) {
		return false
	}
}

function wakeNAS() {
	script = wolcmdLocation + ' ' + nasMAC + ' ' + nasIP + ' 255.255.255.0 4343';
	try {
		app.doShellScript(script);
		return true;
	} catch(e) {
		return false
	}
}

function mount(shares) {
	for (i = 0; i < shares.length; i++) {
		try {
		
			// If you want to mount by IP use it here
			app.mountVolume('smb://' + nasHostname + '/' + shares[i]);
		} catch(e) {
			app.displayDialog(e)
		}
		
	}
}


// Do the magic
if(isCorrectIpRange()) {
	if(isOnline()) {
		mount(shares);
	} else {
		wakeNAS()
		mount(shares);
	}	
}                              ' jscr  ��ޭ