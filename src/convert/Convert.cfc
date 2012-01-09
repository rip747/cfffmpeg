<cfcomponent output="false">

	<cfset variables._cmd = []>
	<cfset variables._settings = {}>

	<cfinclude template="audio_options.cfm">
	<cfinclude template="extensions.cfm">
	<cfinclude template="main_options.cfm">
	<cfinclude template="process.cfm">
	<cfinclude template="video_options.cfm">
	
	<cffunction name="init" hint="convert a file from one format to another">
		<cfargument name="ffmpegPath" type="string" required="true">
		<cfargument name="fromFile" type="string" required="true">
		<cfargument name="toFile" type="string" required="true">
		<cfargument name="errorLog" type="string" required="true">
		<cfargument name="resultLog" type="string" required="true">
		
		<!--- see if the toFile is an extension, if so  --->
		<cfif !structKeyExists(arguments, "toFile")>
			<cfset arguments.toFile = build_output_file_name(arguments.fromFile, arguments.toFile)>
		</cfif>
		
		<!--- push FFMpeg executable path --->
		<cfset $push("#arguments.ffmpegPath#")>
		<!--- ALWAYS OVERWRITE EXISTING FILES! otherwise the process hangs waiting for user input --->
		<cfset $push("-y")>
		<!--- push source file --->
		<cfset $push('-i "#arguments.fromFile#"')>
		
		<!--- save settings later use --->
		<cfset structAppend(variables._settings, arguments, true)>
		
		<cfreturn this>
	</cffunction>
	
	<cffunction name="inspect" hint="public method to inspect the arguments being passed to ffmpeg">
		<cfreturn $flatten()>
	</cffunction>
	
	<cffunction name="cmd" hint="send a command directly instead of using the dsl. note: just commands. we will take care of the ffmpeg path, source and target video">
		<cfargument name="cmd">
		<cfset $push(arguments.cmd)>
	</cffunction>

	<cffunction name="$flatten" hint="flattens the ffmpeg cmds to a string" access="private">
		<cfset $push('"#variables._settings.toFile#"')>
		<cfreturn arrayToList(variables._cmd, " ")>
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