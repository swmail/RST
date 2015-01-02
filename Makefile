all: validate

DSTFILE="RSTE_verse_checked.xml"
XSD="http://www.bibletechnologies.net/osisCore.2.1.1.xsd"

validate:
	@xmllint --valid --noout --schema "${XSD}" ${DSTFILE}
	@#xmllint --valid --noout $(DSTFILE) ; true

mod:
	@mkdir rsto
	@#osis2mod rsto $(DSTFILE) -z -v KJV
	osis2mod rsto $(DSTFILE) -z -v Synodal

osis:
	@./check_punkt.sh
