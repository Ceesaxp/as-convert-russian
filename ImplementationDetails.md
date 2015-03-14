# The cause of the issue #

ID3 tags added on a non-Mac machine are likely to be either CP-1251 (Windows) or CP-866 (DOS) coded.  When iTunes imports such tags into the library, it has no knowledge what code page was used and by default assumes it is all MacRoman.

Russian symbols in both CP-866 and CP-1251 cases are placed in the upper ASCII range — beyond 0x80.  They end up being seen as extended Latin chars instead.

# How it was done #

Unfortunately, plain conversion using, say, iconv(1) does not work.  A custom coding table had to be built in order to properly remap these garbled chars back to their proper Unicode equivalents.

The code mapping table is stored as AppleScript property and corrects only Russian chars, preserving all other codes.

## Other, simpler(?) ways ##

I have not tried that, but apparently if "Russian" is set as primary language in International preferences, the issue would not manifest itself.  I have my doubts about it, as in this case CP1251/CP866 would get interpreted as MacCyrillic — which is still wrong.  However, this script would no longer be helpful :(