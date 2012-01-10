<cffunction name="audio_frames" hint="Set the number of audio frames to record.">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-aframes #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="audio_sampling" hint="Set the audio sampling frequency (default = 44100 Hz).">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-ar #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="audio_bitrate" hint="Set the audio bitrate in bit/s (default = 64k).">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-ab #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="audio_channels" hint="Set the number of audio channels (default = 1).">
	<cfargument name="value" type="numeric" required="true">
	<cfset $push("-ac #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="disable_audio" hint="Disable audio recording.">
	<cfset $push("-an")>
	<cfreturn this>
</cffunction>

<cffunction name="audio_codec" hint="Force audio codec to codec. Use the copy special value to specify that the raw codec data must be copied as is.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-acodec #arguments.value#")>
	<cfreturn this>
</cffunction>

<cffunction name="new_audio" hint="
Add a new audio track to the output file. If you want to specify parameters, do so before -newaudio (-acodec,
-ab, etc..). Mapping will be done automatically, if the number of output streams is equal to the number of input
streams, else it will pick the first one that matches. You can override the mapping using -map as usual. Example:
ffmpeg -i file.mpg -vcodec copy -acodec ac3 -ab 384k test.mpg -acodec mp2 -ab 192k -newaudio
">
	<cfset $push("-newaudio")>
	<cfreturn this>
</cffunction>

<cffunction name="audio_language" hint="Set the ISO 639 language code (3 letters) of the current audio stream.">
	<cfargument name="value" type="string" required="true">
	<cfset $push("-alang #arguments.value#")>
	<cfreturn this>
</cffunction>