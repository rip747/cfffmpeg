<html>
<head>
	<title>RocketUnit unit tests</title>
</head>
<body>
	<cfset test = createObject("component", "Test")>
	<cfset test.runTestPackage("cfffmpeg.tests.tests")>
	<cfset test.runTestPackage("cfffmpeg.tests.tests.convert")>
	<cfoutput>#test.HTMLFormatTestResults()#</cfoutput>
</body>
</html>