#!/bin/bash

SRCFILE="RSTE_verse_words.xml"
TARFILE="RSTE_verse_checked.xml"

cp $SRCFILE $TARFILE
# move punktuation character (ptc) out tags
sed -i -e 's;\(<w [^>]*>\)\([,.!;:?]\);\2 \1;g' $TARFILE
sed -i -e 's;\(<w [^>]*>\)\([–-]\);\2\1;g' $TARFILE

# delete space before ptc
sed -i -e 's;[ ]\+\([,!.?;:]\);\1;g' $TARFILE
# insert space after ptc and before text
sed -i -e 's;\([,!.?;:]\)\([А-Яа-я]\);\1 \2;g;' $TARFILE
# insert space after ptc
sed -i -e 's;,\(<[^n/]\);, \1;g;' $TARFILE

# insert space before text and after tags
sed -i -e 's;\(w>\)\([А-Яа-я]\);\1 \2;g;' $TARFILE
sed -i -e 's;\(hi>\)\([А-Яа-я]\);\1 \2;g;' $TARFILE

#sed -i -e 's;\([А-Яа-я,!.?;:]\)(;\1 (;g' $TARFILE
#sed -i -e 's;)\([А-Яа-я]\)(;) \1;g' $TARFILE

# insert space before '('
sed -i -e 's/\([,.!?А-Яа-я]\)(/\1 (/g;' $TARFILE
sed -i -e 's/<\/w>(/<\/w> (/g;' $TARFILE

# delete spaces after '('
sed -i -e 's/([ ]\+/(/g;' $TARFILE

# insert space between 'w' tags
#sed -i -e 's/<\/w><w /<\/w> <w /g;' $TARFILE
#sed -i -e 's/<\/w> \(<w[^>]*>-\)/<\/w>\1/g;' $TARFILE
sed -i -e 's/<\/w>\(<w[^>]*>[^-–]\)/<\/w> \1/g;' $TARFILE
sed -i -e 's;</hi><w ;</hi> <w ;g' $TARFILE

# ", -xxx" => ", - xxx"
sed -i -e 's;\(, [-–]\)\([^ <]\);\1 \2;g;' $TARFILE
#sed -i -e 's;\(, [-–]\)\(<[^n]\);\1 \2;g;' $TARFILE
sed -i -e 's;,\([-–] \);, \1;g;' $TARFILE
sed -i -e 's;[ ]*–; –;g;' $TARFILE
# s;–[А-Яа-я];– ;g;' $TARFILE

# delete <lb/> tag with all spaces
sed -i -e 's;[ ]*<lb/>[ ]*;;g' $TARFILE

# move first word from 'w' tag with 2 words before tag
sed -i -e 's;\(<w [^>]*>\)\([А-Яа-я]* \)\([А-Яа-я]*</w>\);\2\1\3;g;' $TARFILE
sed -i -e 's;\(<w [^>]*>\)\([^А-Яа-я]\)\([А-Яа-я]*</w>\);\2\1\3;g;' $TARFILE

# title tag move before verse tag
#sed -i -e 's;\(^.*\)\(<title .*</title>\)\(.*$\);\t\t\2\n\1\3;' $TARFILE

# move punkt. char before 'note' tag
sed -i -e 's;\(<note type="crossReference">.*</note>\)\(.\)\(</verse>\);\2\1\3;' $TARFILE

# replace "i" in <hi> tags to "italic"
sed -i -e 's;<hi type="i">;<hi type="italic">;g;' $TARFILE
