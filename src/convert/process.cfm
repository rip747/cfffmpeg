<cffunction name="end" access="public">
	

<!--- convert the file --->
<cfset results = structNew()>
<cfscript>
    try {
        runtime = createObject("java", "java.lang.Runtime").getRuntime();
        command = '#ffmpegPath# -i "#inputFilePath#" -g 300 -y -s 300x200 -f flv -ar 44100 "#ouputFilePath#"'; 
        process = runtime.exec(#command#);
        results.errorLogSuccess = processStream(process.getErrorStream(), errorLog);
        results.resultLogSuccess = processStream(process.getInputStream(), resultLog);
        results.exitCode = process.waitFor();
    }
    catch(exception e) {
        results.status = e;    
    }
</cfscript>

<!--- display the results --->
<cfdump var="#results#">


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