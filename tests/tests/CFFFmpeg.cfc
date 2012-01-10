<cfcomponent extends="cfffmpeg.tests.Test">

	<cffunction name="test_create_convert_object">
		<cfset obj = createobject("component", "cfffmpeg.src.CFFFMpeg").init()>
		<cfset convert = obj.convert("something.avi", "something.mpg")>
		<cfset assert("IsObject(convert)")>
		<cfset assert("StructKeyExists(convert, 'inspect')")>
	</cffunction>

</cfcomponent>