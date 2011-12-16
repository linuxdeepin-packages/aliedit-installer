#!/usr/bin/make -f

update-pot:
	xgettext -L Shell aliedit-installer -o po/message.pot
	
install-mo: update-pot
	for i in `ls po/*.po`; do \
		bsn=`basename $$i`; \
		msgfmt $$i -o po/aliedit-installer.mo; \
		install -d ${DEST}/${PREFIX}/share/locale/$$bsn/LC_MESSAGES/; \
		install po/aliedit-installer.mo ${DEST}/${PREFIX}/share/locale/$$bsn/LC_MESSAGES/; \
		rm po/aliedit-installer.mo; \
	done
	
install: install-mo
	install -d ${DEST}/${PREFIX}/bin/
	install aliedit-installer ${DEST}/${PREFIX}/bin/
	install -d ${DEST}/${PREFIX}/share/applications/
	install aliedit-installer.desktop ${DEST}/${PREFIX}/share/applications/

dest-clean:
	rm po/*.mo


