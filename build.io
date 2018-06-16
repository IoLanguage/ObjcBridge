AddonBuilder clone do(
    setDontGenerateInit(true)

	dependsOnBinding("Box")
    dependsOnBinding("Blowfish")
    dependsOnBinding("MD5")
    dependsOnBinding("Socket")
    dependsOnBinding("SystemCall")
    dependsOnBinding("Yajl")

	if(platform != "darwin",
		GNUstepSystemRoot := System getEnvironmentVariable("GNUSTEP_SYSTEM_ROOT") ifNilEval("/usr/GNUstep/System")
		GNUstepLocalRoot := System getEnvironmentVariable("GNUSTEP_LOCAL_ROOT") ifNilEval("/usr/GNUstep/Local")
		appendHeaderSearchPath(GNUstepSystemRoot .. "/Library/Headers")
		appendHeaderSearchPath(GNUstepLocalRoot .. "/Library/Headers")
		appendLibSearchPath(GNUstepSystemRoot .. "/Library/Libraries")
		appendLibSearchPath(GNUstepLocalRoot .. "/Library/Libraries")
		dependsOnInclude("-fconstant-string-class=NSConstantString")
		optionallyDependsOnLib("Addresses")
		dependsOnHeader("AppKit/AppKit.h")
		addDefine("GNUSTEP")
		dependsOnLib("gnustep-gui")
	)

	if(platform == "darwin",
		optionallyDependsOnFramework("AddressBook")
		dependsOnFramework("AppKit")
	)


	debs    atPut("gnustep-gui", "libgnustep-gui-dev")
	ebuilds atPut("gnustep-gui", "gnustep-gui")
	rpms    atPut("gnustep-gui", "libgnustep-gui-devel")
)
