<cffunction name="duration" hint="
Set the duration specified in seconds.
hh:mm:ss[.xxx] syntax is also supported
duration '600'
or
duration '00:10:00'
">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-t #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="file_size_limit" hint="
Set a file size limit in bytes
file_size_limit 104857600
">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-fs #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="seek" hint="
Seek to given time position in seconds. 
hh:mm:ss[.xxx] syntax is also supported
duration '600'
or
duration '00:10:00'
">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-ss #arguments.value#")>
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
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-itsoffset #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="title" hint="Set the title.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-title '#arguments.value#'")>
	<cfreturn this>
</cffunction>

<cffunction name="author" hint="Set the author.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-author '#arguments.value#'")>
	<cfreturn this>
</cffunction>

<cffunction name="copyright" hint="Set the copyright.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-copyright '#arguments.value#'")>
	<cfreturn this>
</cffunction>

<cffunction name="comment" hint="Set the comment.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-comment '#arguments.value#'")>
	<cfreturn this>
</cffunction>

<cffunction name="album" hint="Set the album.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-album '#arguments.value#'")>
	<cfreturn this>
</cffunction>

<cffunction name="track" hint="Set the track number">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-track #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="theyear" hint="Set the year">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-year #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="target" hint="
Specify target file type ('vcd', 'svcd', 'dvd', 'dv', 'dv50', 'pal-vcd', 'ntsc-svcd', ... ). 
All the format options (bitrate, codecs, buffer sizes) are then set automatically.
Nevertheless you can specify additional options as long as you know they do not conflict 
with the standard.
">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-target #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="frames_to_record" hint="Set the number of frames to record.">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-dframes #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="subtitle_codec" hint="Force subtitle codec ('copy' to copy stream)">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-scodec #arguments.value#")>
	<cfreturn this>
</cffunction>