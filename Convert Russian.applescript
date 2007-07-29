(*
Script:
	Convert Russian
Version:
	0.2
CahngeLog:
	Added a few minor safety belt features (as dilogs, really)
Author:
	Andrei Popov (andrei@ceesaxp.org)

The issue:
	ID3 tags that are embedded in MP3 files generated on Windows or (shudder) DOS machines use extended ASCII to store Cyrillics.  When you import such files into iTunes, it assumes that they're all in MacRoman coding page** and happily garbles them up.

The search to solve it:
	One way to do that is to convert tags *before* importing them into iTunes.  This might work, but I have not tried it, don't know.
	Another way was to try and fix them once they're in using a `do shell command' call from AppleScript.  No luck there, although iconv -f cp866 -t utf8 *almost* does the right thing.  Almost, but not quite.

Solution:
	I had to manually recode conversion table, based on MacRoman ASCII page (http://www.iro.umontreal.ca/~felipe/IFT1010-Hiver2005/Complements/ascii.html) viewed as if it were Cyrillic (Mac) page in Camino, then assigning proper UNICODE values to each code point.

Credits:
	Thanks to StefanK at MacScripter BBS  for helping me sort out a few AppleScript issues.

----
** Some say this would not be the case if International pannel lists Russian as first language -- I have not tested that

*)

property charCodeMap : {Â
	"0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0009", "000A", "0020", "0020", "000D", "0020", "0020", Â
	"0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", "0020", Â
	"0020", "0021", "0022", "0023", "0024", "0025", "0026", "0027", "0028", "0029", "002A", "002B", "002C", "002D", "002E", "002F", Â
	"0030", "0031", "0032", "0033", "0034", "0035", "0036", "0037", "0038", "0039", "003A", "003B", "003C", "003D", "003F", "003F", Â
	"0040", "0041", "0042", "0043", "0044", "0045", "0046", "0047", "0048", "0049", "004A", "004B", "004C", "004D", "004E", "004F", Â
	"0050", "0051", "0052", "0053", "0054", "0055", "0056", "0057", "0058", "0059", "005A", "005B", "005C", "005D", "005E", "005F", Â
	"0060", "0061", "0062", "0063", "0064", "0065", "0066", "0067", "0068", "0069", "006A", "006B", "006C", "006D", "006E", "006F", Â
	"0070", "0071", "0072", "0073", "0074", "0075", "0076", "0077", "0078", "0079", "007A", "007B", "007C", "007D", "007E", "007F", Â
	"0414", "0415", "0417", "0419", "0421", "0426", "042C", "0431", "0430", "0432", "0434", "0433", "0435", "0437", "0439", "0438", Â
	"043A", "043B", "043D", "043C", "043E", "043F", "0441", "0443", "0442", "0444", "0446", "0445", "044A", "0449", "044B", "044C", Â
	"00A0", "00A1", "00A2", "00A3", "00A4", "00A5", "00A6", "042F", "00A8", "00A9", "0411", "00AB", "0401", "00AD", "0416", "0428", Â
	"00B0", "00B1", "00B2", "00B3", "00B4", "00B5", "00B6", "00B7", "00B8", "00B9", "00BA", "00BB", "00BC", "00BD", "0436", "0448", Â
	"00C0", "00C1", "00C2", "00C3", "00C4", "00C5", "00C6", "00C7", "00C8", "00C9", "00CA", "0410", "0413", "0425", "00CE", "00CF", Â
	"00D0", "00D1", "00D2", "00D3", "00D4", "00D5", "0447", "0427", "044F", "00D9", "00DA", "00DB", "0420", "0440", "042E", "044E", Â
	"044D", "00E1", "00E2", "00E3", "00E4", "0412", "041A", "0411", "041B", "0419", "041D", "041E", "041F", "041C", "0423", "0424", Â
	"00F0", "0422", "042A", "042B", "0429", "00F5", "00F6", "00F7", "00F8", "00F9", "00FA", "00FB", "0451", "00FD", "00FE", "00FF"}

tell application "iTunes"
	if selection is not {} then
		display dialog Â
			"WARNING: this action cannot be undone.
Do you still want to proceede?" buttons {"Yes, please", "Oh, NO!"} default button 2
		if the button returned of the result is "Yes, please" then
			set songList to a reference to selection
			set songsCount to count of items in songList
			repeat with aTrack in songList
				set name of aTrack to my fixCyrillics(get name of aTrack)
				set album of aTrack to my fixCyrillics(get album of aTrack)
				set artist of aTrack to my fixCyrillics(get artist of aTrack)
				set genre of aTrack to my fixCyrillics(get genre of aTrack)
				set comment of aTrack to my fixCyrillics(get comment of aTrack)
			end repeat
			display dialog "Converted details for " & songsCount & " tracks." buttons {"OK"} default button 1
		else
			-- action for 2nd button goes here
		end if
	else
		display dialog Â
			"To convert track details, please select them in iTunes playlist first" buttons {"OK"} default button 1
	end if
end tell

on fixCyrillics(str)
	set outStr to "" as Unicode text
	repeat with i in characters of str
		set charCode to ASCII number of i
		set Uni to item (charCode + 1) of charCodeMap
		set outStr to outStr & (run script "Çdata utxt" & Uni & "È" as Unicode text)
	end repeat
	return outStr
end fixCyrillics
