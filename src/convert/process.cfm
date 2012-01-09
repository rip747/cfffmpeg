<cffunction name="end" access="public" returntype="struct">
	<cfset var loc = {}>
	<cfset loc.cmd = $flatten()>
	<cfset loc.results = structNew()>

	<cftry>
		<cfset loc.runtime = createObject("java", "java.lang.Runtime").getRuntime()>
		<cfset loc.process = loc.runtime.exec(loc.cmd)>
		<cfset loc.results.errorLogSuccess = processStream(loc.process.getErrorStream(), loc.errorLog)>
		<cfset loc.results.resultLogSuccess = processStream(loc.process.getInputStream(), loc.resultLog)>
		<cfset loc.results.exitCode = loc.process.waitFor()>
		<cfcatch type="Any">
			<cfset loc.results.status = cfcatch>
		</cfcatch>
	</cftry>

	<cfreturn loc.results>
</cffunction>

<!--- function used to drain the input/output streams. Optionally write the stream to a file --->
<cffunction name="processStream" access="public" output="false" returntype="boolean" hint="Returns true if stream was successfully processed">
    <cfargument name="in" type="any" required="true" hint="java.io.InputStream object">
    <cfargument name="logPath" type="string" required="false" default="" hint="Full path to LogFile">
    <cfset var out = "">
    <cfset var writer = "">
    <cfset var reader = "">
    <cfset var buffered = "">
    <cfset var line = "">
    <cfset var sendToFile = false>
	<cfset var errorFound = false>
    
    <cfscript>
        if ( len(trim(arguments.logPath)) ) {
            out = createObject("java", "java.io.FileOutputStream").init(arguments.logPath);
            writer = createObject("java", "java.io.PrintWriter").init(out);
            sendToFile = true;
        }

        reader = createObject("java", "java.io.InputStreamReader").init(arguments.in);
        buffered = createObject("java", "java.io.BufferedReader").init(reader);
        line = buffered.readLine();
        while ( IsDefined("line") ) {
            if (sendToFile) {
                writer.println(line);
            }
            line = buffered.readLine();
        }    
           if (sendToFile) {
           errorFound = writer.checkError();
           writer.flush();
           writer.close();
        }
    </cfscript>
    <!--- return true if no errors found. --->
    <cfreturn (NOT errorFound)>
</cffunction>