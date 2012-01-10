<!--- 
	copied with love from CFSearching:)
	http://cfsearching.blogspot.com/2007/12/using-ffmpeg-to-convert-video-files-to.html
 --->
<cffunction name="end" access="public" returntype="struct">
	<cfset var loc = {}>
	
	<cfset loc.cmd = $flatten()>
	<cfset loc.results = structNew()>
	
	<!--- transcript of the log. ffmpeg only writes to the error log --->
	<cfset loc.results.logfile = "">
	<!--- the command that was executed --->
	<cfset loc.results.command = loc.cmd>
	<!--- did the process complete 1=no 0=yes --->
	<cfset loc.results.success = 1>

	<cftry>
		<cfset loc.runtime = createObject("java", "java.lang.Runtime").getRuntime()>
		<cfset loc.process = loc.runtime.exec(loc.cmd)>
		<cfset loc.results.logfile = $processStream(loc.process.getErrorStream(), variables._settings.errorLog)>
		<cfset loc.blah = $processStream(loc.process.getInputStream(), variables._settings.resultLog)>
		<cfset loc.results.success = loc.process.waitFor()>
		
		<cfcatch type="any">
			<!--- this makes sure that if an error occurrs the process is killed --->
			<cfif StructKeyExists(loc, "process")>
				<cfset loc.process.destroy()>
			</cfif>
			<cfset loc.results.logfile = cfcatch.message>
		</cfcatch>
	</cftry>

	<!--- reverse the exit code since it's confusing --->
	<cfset loc.results.success = !loc.results.success>
	<cfreturn loc.results>
</cffunction>

<!--- function used to drain the input/output streams. Optionally write the stream to a file --->
<cffunction name="$processStream" access="private" output="false" returntype="any" hint="Return">
    <cfargument name="in" type="any" required="true" hint="java.io.InputStream object">
    <cfargument name="logPath" type="string" required="false" default="" hint="Full path to LogFile">
	<cfset var loc = {}>
    <cfset loc.sendToFile = false>
	<cfset loc.errorFound = false>
	<cfset loc.logFile = []>

	<cfif len(trim(arguments.logPath))>
		<cfset loc.out = createObject("java", "java.io.FileOutputStream").init(arguments.logPath)>
		<cfset loc.writer = createObject("java", "java.io.PrintWriter").init(loc.out)>
		<cfset loc.sendToFile = true>
	</cfif>
	
	<cfset loc.reader = createObject("java", "java.io.InputStreamReader").init(arguments.in)>
	<cfset loc.buffered = createObject("java", "java.io.BufferedReader").init(loc.reader)>
	<cfset loc.line = loc.buffered.readLine()>
	<cfloop condition="#StructKeyExists(loc, 'line')#">
		<cfset arrayAppend(loc.logFile, loc.line)>
		<cfif loc.sendToFile>
			<cfset loc.writer.println(loc.line)>
		</cfif>
		<cfset loc.line = loc.buffered.readLine()>
	</cfloop>
 	<cfif loc.sendToFile>
		<cfset loc.writer.flush()>
		<cfset loc.writer.close()>
	</cfif>
    <cfreturn arrayToList(loc.logFile, chr(10))>
</cffunction>