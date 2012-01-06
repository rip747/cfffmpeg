<cffunction name="resolution" hint="
 Set frame size. The format is 'wxh' (ffserver default = 160x128, ffmpeg default = same as source).
 The following abbreviations are recognized:

 'sqcif'
     128x96
 'qcif'
     176x144
 'cif'
     352x288
 '4cif'
     704x576
 'qqvga'
     160x120
 'qvga'
     320x240
 'vga'
     640x480
 'svga'
     800x600
 'xga'
     1024x768
 'uxga'
     1600x1200
 'qxga'
     2048x1536
 'sxga'
     1280x1024
 'qsxga'
     2560x2048
 'hsxga'
     5120x4096
 'wvga'
     852x480
 'wxga'
     1366x768
 'wsxga'
     1600x1024
 'wuxga'
     1920x1200
 'woxga'
     2560x1600
 'wqsxga'
     3200x2048
 'wquxga'
     3840x2400
 'whsxga'
     6400x4096
 'whuxga'
     7680x4800
 'cga'
     320x200
 'ega'
     640x350
 'hd480'
     852x480
 'hd720'
     1280x720
 'hd1080'
     1920x1080
">
	<cfargument name="resolution" type="string" required="true">
	<cfset $push("-s #arguments.resolution#")>
</cffunction>

<cffunction name="video_bitrate" hint="Set the video bitrate in bit/s (default = 200 kb/s or '200k')">
	<cfargument name="bitrate" type="string" required="true">
	<cfset $push("-vb #arguments.bitrate")>
</cffunction>

<cffunction name="video_frames" hint="Set the number of video frames to record">
	<cfargument name="number" type="numeric" required="true">
	<cfset $push("-vframes #arguments.number#")>
</cffunction>
 
<cffunction name="framerate" hint="Set frame rate (Hz value, fraction or abbreviation), (default = 25).">
	<cfargument name="fps" type="numeric" required="true">
	<cfset $push("-r #arguments.fps#")>
</cffunction>
 
<cffunction name="aspect" hint="Set aspect ratio (4:3, 16:9 or 1.3333, 1.7777).">
	<cfargument name="aspect" type="numeric" required="true">
	<cfset $push("-aspect #arguments.aspect#")>
</cffunction>

<cffunction name="crop_top" hint="Set top crop band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-croptop #arguments.size#")>
</cffunction>

<cffunction name="crop_bottom" hint="Set bottom crop band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-cropbottom #arguments.size#")>
</cffunction>

<cffunction name="crop_left" hint="Set left crop band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-cropleft #arguments.size#")>
</cffunction>

<cffunction name="crop_right" hint="Set right crop band size (in pixels).">
	<cfargument name="number" type="numeric" required="true">
	<cfset $push("-cropright #arguments.size#")>
</cffunction>

<cffunction name="pad_top" hint="Set top pad band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-padtop #arguments.size#")>
</cffunction>

<cffunction name="pad_bottom" hint="Set bottom pad band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-padbottom #arguments.size#")>
</cffunction>

<cffunction name="pad_left" hint="Set left pad band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-padleft #arguments.size#")>
</cffunction>

<cffunction name="pad_right" hint="Set right pad band size (in pixels).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-padright #arguments.size#")>
</cffunction>

<cffunction name="pad_color" hint="
Set color of padded bands. The value for padcolor is expressed as a six digit hexadecimal number where the first
two digits represent red, the middle two digits green and last two digits blue (default = 000000 (black)).
">
	<cfargument name="color" type="string" required="true">
	<cfset $push("-padcolor #arguments.color#")>
</cffunction>

<cffunction name="disable_video" hint="Disable video recording.">
	<cfset $push("-vn")>
</cffunction>

<cffunction name="video_bitrate_tolerance" hint="
Set video bitrate tolerance (in bits, default 4000k). Has a minimum value of: (target_bitrate/target_framerate).
In 1-pass mode, bitrate tolerance specifies how far ratecontrol is willing to deviate from the target average
bitrate value. This is not related to min/max bitrate. Lowering tolerance too much has an adverse effect on
quality.
">
	<cfargument name="tolerance" type="numeric" required="true">
	<cfset $push("-bt #arguments.tolerance#")>
</cffunction>

<cffunction name="video_maximum_bitrate" hint="Set max video bitrate (in bit/s). Requires -bufsize to be set.">
	<cfargument name="bitrate" type="numeric" required="true">
	<cfset $push("-maxrate #arguments.bitrate#")>
</cffunction>

<cffunction name="video_minimum_bitrate" hint="
Set min video bitrate (in bit/s). Most useful in setting up a CBR encode:
ffmpeg -i myfile.avi -b 4000k -minrate 4000k -maxrate 4000k -bufsize 1835k out.m2v
It is of little use elsewise.
">
	<cfargument name="bitrate" type="numeric" required="true">
	<cfset $push("-minrate #arguments.bitrate#")>
</cffunction>

<cffunction name="video_buffer_size" hint="Set video buffer verifier buffer size (in bits).">
	<cfargument name="size" type="numeric" required="true">
	<cfset $push("-bufsize #arguments.size#")>
</cffunction>

<cffunction name="video_codec" hint="Force video codec to codec. Use the copy special value to tell that the raw codec data must be copied as is.">
	<cfargument name="number" type="string" required="true">
	<cfset $push("-vcodec #arguments.codec#")>
</cffunction>

<cffunction name="same_video_quality" hint="Use same video quality as source (implies VBR).">
	<cfset $push("-sameq")>
</cffunction>

<cffunction name="video_pass" hint="
Select the pass number (1 or 2). It is used to do two-pass video encoding. The statistics of the video are
recorded in the first pass into a log file (see also the option -passlogfile), and in the second pass that log
file is used to generate the video at the exact requested bitrate. On pass 1, you may just deactivate audio and
set output to null, examples for Windows and Unix:

ffmpeg -i foo.mov -vcodec libxvid -pass 1 -an -f rawvideo -y NUL
ffmpeg -i foo.mov -vcodec libxvid -pass 1 -an -f rawvideo -y /dev/null
">
	<cfargument name="index" type="numeric" required="true">
	<cfset $push("-pass #arguments.index#")>
</cffunction>

<cffunction name="video_pass_logfile" hint="
Set two-pass log file name prefix to prefix, the default file name prefix is 'ffmpeg2pass'. The complete file
name will be `PREFIX-N.log', where N is a number specific to the output stream.
">
	<cfargument name="prefix" type="numeric" required="true">
	<cfset $push("-passlogfile #arguments.prefix#")>
</cffunction>

<cffunction name="new_video" hint="Add a new video stream to the current output stream.">
	<cfargument name="number" type="numeric" required="true">
	<cfset $push("-newvideo")>
</cffunction>