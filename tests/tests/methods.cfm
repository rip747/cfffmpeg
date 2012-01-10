<!--- 
since all methods just push the value passed in onto the stack
the easiest way to test all methods is to setup a struct where
the key of the struct is the name of the method to test

the struct will contain upto 3 elements

value = the value to pass to the method
arg = the argument that the method should append
quote = should we quote the string or not, some methods require this

 --->

<cfset methods = {}>

<!--- audio --->
<cfset methods["audio_frames"] = {value = "54", arg = "-aframes"}>
<cfset methods["audio_sampling"] = {value = "44100 Hz", arg = "-ar"}>
<cfset methods["audio_bitrate"] = {value = "64k", arg = "-ab"}>
<cfset methods["audio_channels"] = {value = "1", arg = "-ac"}>
<cfset methods["disable_audio"] = {value = "", arg = "-an"}>
<cfset methods["audio_codec"] = {value = "whatever", arg = "-acodec"}>
<cfset methods["new_audio"] = {value = "", arg = "-newaudio"}>
<cfset methods["audio_language"] = {value = "USA", arg = "-alang"}>

<!--- main --->
<cfset methods["duration"] = {value = "600", arg = "-t"}>
<cfset methods["file_size_limit"] = {value = "104857600", arg = "-fs"}>
<cfset methods["seek"] = {value = "600", arg = "-ss"}>
<cfset methods["offset"] = {value = "600", arg = "-itsoffset"}>
<cfset methods["title"] = {value = "Blah Blah", arg = "-title", quote="true"}>
<cfset methods["author"] = {value = "Anthony Petruzzi", arg = "-author", quote="true"}>
<cfset methods["copyright"] = {value = "copyright 2012", arg = "-copyright", quote="true"}>
<cfset methods["comment"] = {value = "this is a comment", arg = "-comment", quote="true"}>
<cfset methods["album"] = {value = "the great album", arg = "-album", quote="true"}>
<cfset methods["track"] = {value = "1", arg = "-track"}>
<cfset methods["theyear"] = {value = "2011", arg = "-year"}>
<cfset methods["target"] = {value = "vcd", arg = "-target"}>
<cfset methods["frames_to_record"] = {value = "10", arg = "-dframes"}>
<cfset methods["subtitle_codec"] = {value = "copy", arg = "-scodec"}>

<!--- video_options --->
<cfset methods["resolution"] = {value = "cga", arg = "-s"}>
<cfset methods["video_bitrate"] = {value = "200k", arg = "-vb"}>
<cfset methods["video_frames"] = {value = "30", arg = "-vframes"}>
<cfset methods["framerate"] = {value = "25", arg = "-r"}>
<cfset methods["aspect"] = {value = "4:3", arg = "-aspect"}>
<cfset methods["crop_top"] = {value = "100", arg = "-croptop"}>
<cfset methods["crop_bottom"] = {value = "150", arg = "-cropbottom"}>
<cfset methods["crop_left"] = {value = "200", arg = "-cropleft"}>
<cfset methods["crop_right"] = {value = "250", arg = "-cropright"}>
<cfset methods["pad_top"] = {value = "100", arg = "-padtop"}>
<cfset methods["pad_bottom"] = {value = "150", arg = "-padbottom"}>
<cfset methods["pad_left"] = {value = "200", arg = "-padleft"}>
<cfset methods["pad_right"] = {value = "250", arg = "-padright"}>
<cfset methods["pad_color"] = {value = "9652CD", arg = "-padcolor"}>
<cfset methods["disable_video"] = {value = "", arg = "-vn"}>
<cfset methods["video_bitrate_tolerance"] = {value = "400K", arg = "-bt"}>
<cfset methods["video_maximum_bitrate"] = {value = "300K", arg = "-maxrate"}>
<cfset methods["video_minimum_bitrate"] = {value = "4000K", arg = "-minrate"}>
<cfset methods["video_buffer_size"] = {value = "1524", arg = "-bufsize"}>
<cfset methods["video_codec"] = {value = "mpeg", arg = "-vcodec"}>
<cfset methods["same_video_quality"] = {value = "", arg = "-sameq"}>
<cfset methods["video_pass"] = {value = "3", arg = "-pass"}>
<cfset methods["video_pass_logfile"] = {value = "ffmpeg2pass", arg = "-passlogfile"}>
<cfset methods["new_video"] = {value = "", arg = "-newvideo"}>