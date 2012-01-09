<cffunction name="duration" hint="
Set the duration specified in seconds.
hh:mm:ss[.xxx] syntax is also supported
duration '600'
or
duration '00:10:00'
">
	<cfargument name="duration" type="string" required="true">
	<cfset $push("-t #arguments.duration#")>
	<cfreturn this>
</cffunction>

<cffunction name="file_size_limit" hint="
Set a file size limit in bytes
file_size_limit 104857600
">
	<cfargument name="limit" type="numeric" required="true">
	<cfset $push("-fs #arguments.limit#")>
	<cfreturn this>
</cffunction>

<cffunction name="seek" hint="
Seek to given time position in seconds. 
hh:mm:ss[.xxx] syntax is also supported
duration '600'
or
duration '00:10:00'
">
	<cfargument name="position" type="string" required="true">
	<cfset $push("-ss #arguments.position#")>
	<cfreturn this>
</cffunction>

<cffunction name="offset" hint="
Set the input time offset in seconds. 
[-]hh:mm:ss[.xxx] syntax is also supported. 
This option affects all the input files that follow it. 
The offset is added to the timestamps of the input files. 
Specifying a positive offset means that the corresponding 
streams are delayed by 'offset' seconds.
duration '600'
or
duration '00:10:00'
">
	<cfargument name="offset" type="numeric" required="true">
	<cfset $push("-itsoffset #arguments.offset#")>
	<cfreturn this>
</cffunction>

<cffunction name="title" hint="Set the title.">
	<cfargument name="title" type="string" required="true">
	<cfset $push("-title '#arguments.title#'")>
	<cfreturn this>
</cffunction>

<cffunction name="author" hint="Set the author.">
	<cfargument name="author" type="string" required="true">
	<cfset $push("-author '#arguments.author#'")>
	<cfreturn this>
</cffunction>

<cffunction name="copyright" hint="Set the copyright.">
	<cfargument name="copyright" type="string" required="true">
	<cfset $push("-copyright '#arguments.copyright#'")>
	<cfreturn this>
</cffunction>

<cffunction name="comment" hint="Set the comment.">
	<cfargument name="comment" type="string" required="true">
	<cfset $push("-comment '#arguments.comment#'")>
	<cfreturn this>
</cffunction>

<cffunction name="album" hint="Set the album.">
	<cfargument name="album" type="string" required="true">
	<cfset $push("-album '#arguments.album#'")>
	<cfreturn this>
</cffunction>

<cffunction name="track" hint="Set the track number">
	<cfargument name="track" type="numeric" required="true">
	<cfset $push("-track #arguments.track#")>
	<cfreturn this>
</cffunction>

<cffunction name="theyear" hint="Set the year">
	<cfargument name="year" type="numeric" required="true">
	<cfset $push("-year #arguments.year#")>
	<cfreturn this>
</cffunction>

<cffunction name="target" hint="
Specify target file type ('vcd', 'svcd', 'dvd', 'dv', 'dv50', 'pal-vcd', 'ntsc-svcd', ... ). 
All the format options (bitrate, codecs, buffer sizes) are then set automatically.
Nevertheless you can specify additional options as long as you know they do not conflict 
with the standard.
">
	<cfargument name="target" type="string" required="true">
	<cfset $push("-target #arguments.target#")>
	<cfreturn this>
</cffunction>

<cffunction name="frames_to_record" hint="Set the number of frames to record.">
	<cfargument name="frames" type="numeric" required="true">
	<cfset $push("-dframes #arguments.frames#")>
	<cfreturn this>
</cffunction>

<cffunction name="subtitle_codec" hint="Force subtitle codec ('copy' to copy stream)">
	<cfargument name="codec" type="string" required="true">
	<cfset $push("-scodec #arguments.codec#")>
	<cfreturn this>
</cffunction>