#!/usr/bin/make -f

DTHEME     =	manjaro-budgie
PREFIX     = 	/usr
DPATH 	   =	$(DESTDIR)$(PREFIX)/share/backgrounds/$(DTHEME)
DXML       =    $(DESTDIR)$(PREFIX)/share/mate-background-properties
DEL 	   =  	rm -Rf
INSTD 	   =	install -Dm644 -t
	
install:
	./backgrounds-xml.sh
	mkdir -p $(DXML)
	cp -f $(DTHEME).xml $(DXML)
	$(INSTD) $(DPATH) *.jpg 
	
uninstall:
	$(DEL) $(DPATH)
	rm -f $(DXML)/$(DTHEME).xml
 
