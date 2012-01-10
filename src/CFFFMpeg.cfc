<cfcomponent output="false">

	<cfset variables.VERSION = "0.1">

	<cfset this.ffmpegPath = expandPath("bin/ffmpeg.exe")>
	<cfset this.errorLog = getTempDirectory() & "ffmpeg_error_log.txt">
	<cfset this.resultLog = getTempDirectory() & "ffmpeg_result_log.txt">
	
	<cffunction name="init">
		<cfif !StructIsempty(arguments)>
			<cfset StructAppend(this, arguments)>
		</cfif>
		<cfreturn this>
	</cffunction>	
	
	<cffunction name="convert" hint="convert a file from one format to another">
		<cfargument name="fromFile" type="string" required="true" hint="video you want to convert">
		<cfargument name="toFile" type="string" required="true" hint="output you want to convert">
		<cfreturn createObject("component", "convert.Convert").init(
			this.ffmpegPath
			,arguments.fromFile
			,arguments.toFile
			,this.errorLog
			,this.resultLog
		)>
	</cffunction>

</cfcomponent>