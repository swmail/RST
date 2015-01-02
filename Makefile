all: validate

DSTFILE="RSTE_verse_checked.xml"

validate:
	@#xmllint --valid --noout RSTE_verse.xml ; true
	@xmllint --valid --noout $(DSTFILE) ; true
	@#xmllint --valid --noout RSTE_verse_checked_ref.xml ; true

mod:
	@mkdir rsto
	@#osis2mod rsto $(DSTFILE) -z -v KJV
	osis2mod rsto $(DSTFILE) -z -v Synodal

osis:
	@./check_punkt.sh
