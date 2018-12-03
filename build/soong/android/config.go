package android

// Global config used by aoscp soong additions
var AoscpConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
	        "hardware.aoscp.controllers",
	},
}
