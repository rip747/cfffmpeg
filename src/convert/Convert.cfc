<cfcomponent output="false">

	<cfset variables._cmd = []>
	<cfset variables.platform = "win32">

	<cfinclude template="extensions.cfm">
	<cfinclude template="main_options.cfm">
	<cfinclude template="video_options.cfm">
	<cfinclude template="process.cfm">
	
	<cffunction name="init" hint="convert a file from one format to another">
		<cfargument name="ffmpegPath" type="string" required="true">
		<cfargument name="platform" type="string" required="true">
		<cfargument name="fromFile" type="string" required="true">
		<cfargument name="toFile" type="string" required="true">
		
		<!--- need to save the platform --->
		<cfset variables.platform = arguments.platform>
		
		<!--- see if the toFile is an extension, if so  --->
		<cfif !structKeyExists(arguments, "toFile")>
			
		</cfif>
		
		<cfset variables.toFile = arguments.toFile>
		
		<cfset $push("#arguments.ffmpegPath#")>
		<cfset $push("-i '#arguments.fromFile#'")>
	</cffunction>
	
	<cffunction name="inspect" hint="public method to inspect the arguments being passed to ffmpeg">
		<cfreturn $flatten()>
	</cffunction>

	<cffunction name="$flatten" hint="flattens the ffmpeg cmds to a string" access="private">
		<cfset var a = duplicate(variables._cmd)>
		<cfreturn arrayToList(a, " ")>
	</cffunction>
	
	<cffunction name="$push" hint="pushes a command to the stack" access="private">
		<cfargument name="cmd" type="string">
		<cfset arrayAppend(variables._cmd, arguments.cmd)>
	</cffunction>
	
	<cffunction name="$insertAt" hint="insert command at a position in the stack" access="private">
		<cfargument name="cmd" type="string">
		<cfargument name="pos" type="numeric">
		<cfset arrayInsertAt(variables._cmd, arguments.pos, arguments.cmd)>
	</cffunction>

</cfcomponent>