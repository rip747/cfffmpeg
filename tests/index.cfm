<cfdump var="#server#"><cfabort>

<html>
<head>
	<title>RocketUnit unit tests</title>
</head>
<body>
	<cfset test = createObject("component", "Test")>
	<cfset test.runTestPackage("cfffmpeg.tests.tests")>
	<cfoutput>#test.HTMLFormatTestResults()#</cfoutput>
</body>
</html>