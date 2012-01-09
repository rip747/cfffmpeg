<cffunction name="toIPhone">
	<cfset cmd("input -acodec aac -ab 128kb -vcodec mpeg4 -b 1200kb -mbd 2 -flags +4mv+trell -aic 2 -cmp 2 -subcmp 2 -s 320x180")>
	<cfreturn end()>
</cffunction>

<cffunction name="toPSP">
	<cfset cmd("-b 300 -s 320x240 -vcodec xvid -ab 32 -ar 24000 -acodec aac")>
	<cfreturn end()>
</cffunction>