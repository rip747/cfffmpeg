<cfcomponent output="false">

	<cfset this.ffmpegPath = getDirectoryFromPath(getBaseTemplatePath()) & "../bin/ffmpeg.exe">
	<cfset this.platform = "win32">
	
	<cffunction name="init">
		<cfif !StructIsempty(arguments)>
			<cfset StructAppend(this, arguments)>
		</cfif>
		<cfreturn this>
	</cffunction>	
	
	<cffunction name="convert" hint="convert a file from one format to another">
		<cfargument name="fromFile" type="string" required="true" hint="video you want to convert">
		<cfargument name="toFile" type="string" required="true" hint="output you want to convert">
		<cfreturn createObject("component", "convert.Convert").init(this.ffmpegPath, this.platform, arguments.fromFile, arguments.toFile)>
	</cffunction>

</cfcomponent>