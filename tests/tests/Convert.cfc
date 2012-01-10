<cfcomponent extends="cfffmpeg.tests.Test">

	<cfinclude template="methods.cfm">
	
	<cffunction name="_create">
		<cfset obj1 = createobject("component", "cfffmpeg.src.CFFFMpeg").init()>
		<cfset convert1 = obj1.convert("something.avi", "something.mpg")>
		<cfset obj2 = createobject("component", "cfffmpeg.src.CFFFMpeg").init()>
		<cfset convert2 = obj2.convert("something.avi", "something.mpg")>
	</cffunction>
	
	<cffunction name="_cleanup">
		<cfargument name="target" type="string" required="true">
		<cfif FileExists(arguments.target)>
			<cfset FileDelete(arguments.target)>
		</cfif>
	</cffunction>

	<cffunction name="test_methods">
		<cfloop collection="#methods#" item="method">
			<cfset _create()>
			<cfinvoke component="#convert1#" method="#method#" argumentcollection="#methods[method]#" returnvariable="result">
			<cfif structKeyExists(methods[method], "quote")>
				<cfset methods[method]['value'] = "'" & methods[method]['value'] & "'">
			</cfif>
			<cfset e = trim("#methods[method]['arg']# #methods[method]['value']#")>
			<cfinvoke component="#convert2#" method="cmd" value="#e#" argumentcollection="#methods[method]#" returnvariable="expect">
			<cfset assert('result.inspect() eq expect.inspect()')>
		</cfloop>
	</cffunction>

	<cffunction name="test_chaining">
		<cfset _create()>
		<cfset r = convert1.new_video().same_video_quality().video_minimum_bitrate("4000K").inspect()>
		<cfset e = convert2.cmd("-newvideo -sameq -minrate 4000K").inspect()>
		<cfset assert('r eq e')>
	</cffunction>
	
	<cffunction name="test_converts_sample_movie_pass">
		<cfset source = expandPath("assets/sample.mpg")>
		<cfset target = expandPath("converted/sample.wmv")>
		<cfset cfffmpeg = createobject("component", "cfffmpeg.src.CFFFMpeg").init()>
		<cfset cfffmpeg.ffmpegPath = expandPath("../bin/ffmpeg.exe")>
		<cfset results = cfffmpeg.convert(source, target).end()>
		<cfset _cleanup(target)>
		<cfset assert('results.success')>
		<cfset assert('len(results.logfile)')>
	</cffunction>
	
 	<cffunction name="test_converts_sample_movie_fails">
		<cfset source = expandPath("assets/sample.mpg")>
		<cfset target = expandPath("converted/sample.wmv")>
		<cfset cfffmpeg = createobject("component", "cfffmpeg.src.CFFFMpeg").init()>
		<cfset results = cfffmpeg.convert(source, target).end()>
		<cfset _cleanup(target)>
		<cfset assert('!results.success')>
		<cfset assert('len(results.logfile)')>
	</cffunction>

</cfcomponent>