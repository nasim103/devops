# Groups to be added:
#
# Standard Groups

groupadd -g 44002 localssh
groupadd -g 44004 cgitier1
groupadd -g 44008 cgilvl1
groupadd -g 40475 sshdeny
groupadd -g 40625 sudoroot
groupadd -g 40672 securityeng

#
# Security Engineering:
#
# Stephen Endres = 068013
# Raymond Ruiz = 236205
# Ricardo Lopez = 141926
# Austin Yemm = 210850
# Aaron Hofer = 144287
# Nina Gunst (Smith) = 237984

useradd -c "Stephen Endres - Security Engineering" -u 68013 -G wheel,cgitier1,securityeng -m -d /home/sendres sendres
useradd -c "Raymond Ruiz - Security Engineering" -u 236205 -G wheel,cgitier1,securityeng -m -d /home/rruiz rruiz
useradd -c "Ricaredo Lopez - Security Engineering" -u 141926 -G wheel,cgitier1,securityeng -m -d /home/rlopez rlopez
useradd -c "Austin Yemm - Security Engineering" -u 210850 -G wheel,cgitier1,securityeng -m -d /home/ayemm ayemm
useradd -c "Aaron Hofer - Security Engineering" -u 144287 -G wheel,cgitier1,securityeng -m -d /home/ahofer ahofer
useradd -c "Tristan Tate - Security Engineer-RFC 1676721" -G wheel,cgitier1,securityeng -m -d /home/ttate ttate
useradd -c "Kurt Grossman - Sec Eng" -u 239259 -G wheel,cgitier1,securityeng -m -d /home/kgrossmann kgrossmann
useradd -c "Nina M Gunst - GTO Enterprise Security" -u 237984 -G wheel -m -d /home/nismith nismith

usermod -p "PASSWORDINAD" sendres
usermod -p "PASSWORDINAD" rruiz
usermod -p "PASSWORDINAD" rlopez
usermod -p "PASSWORDINAD" ayemm
usermod -p "PASSWORDINAD" ahofer
usermod -p "PASSWORDINAD" ttate
usermod -p "PASSWORDINAD" kgrossmann
usermod -p "PASSWORDINAD" nismith

chage -E -1 -I -1 -m -1 -M -1 sendres
chage -E -1 -I -1 -m -1 -M -1 rruiz
chage -E -1 -I -1 -m -1 -M -1 rlopez
chage -E -1 -I -1 -m -1 -M -1 ayemm
chage -E -1 -I -1 -m -1 -M -1 ahofer
chage -E -1 -I -1 -m -1 -M -1 ttate
chage -E -1 -I -1 -m -1 -M -1 kgrossmann
chage -E -1 -I -1 -m -1 -M -1 nismith

#
# Backup team:
#
# 076404  Peter Conley
# 132698  Marc Cassuto
# 400212  Greg Bashaw
# 404617  Abdulloh Toshbekov
# 084009  Jackie Hawley

useradd -c "Peter Conley - Backup team" -u 76404 -G wheel,sudoroot,localssh -m -d /home/pconley pconley
useradd -c "Marc Cassuto - Backup team" -u 132698 -G wheel,sudoroot,localssh -m -d /home/mcassuto mcassuto
useradd -c "Greg Bashaw - Backup team" -u 400212 -G wheel,sudoroot,localssh -m -d /home/gbashaw gbashaw
useradd -c "Abdulloh Toshbekov - Backup team" -u 404617 -G wheel,sudoroot,localssh -m -d /home/atoshbek atoshbek
useradd -c "Jackie Hawley - Backup team" -u 84009 -G wheel,sudoroot,localssh -m -d /home/jhawley jhawley
useradd -c "Daniel Topel - GTO Patching Admin" -u 130465 -G wheel,sudoroot,localssh -m -d /home/dtopel dtopel
useradd -c "Manuel Ortiz - GTO Patching Admin" -u 130994 -G wheel,sudoroot,localssh -m -d /home/mortiz mortiz
useradd -c "Shannon Benton - GTO Patching Admin" -u 129893 -G wheel,sudoroot,localssh -m -d /home/sbenton sbenton

usermod -p "PASSWORDINAD" pconley
usermod -p "PASSWORDINAD" mcassuto
usermod -p "PASSWORDINAD" gbashaw
usermod -p "PASSWORDINAD" atoshbek
usermod -p "PASSWORDINAD" jhawley
usermod -p "PASSWORDINAD" dtopel
usermod -p "PASSWORDINAD" mortiz
usermod -p "PASSWORDINAD" sbenton

chage -E -1 -I -1 -m -1 -M -1 pconley
chage -E -1 -I -1 -m -1 -M -1 atoshbek
chage -E -1 -I -1 -m -1 -M -1 gbashaw
chage -E -1 -I -1 -m -1 -M -1 mcassuto
chage -E -1 -I -1 -m -1 -M -1 jhawley
chage -E -1 -I -1 -m -1 -M -1 dtopel
chage -E -1 -I -1 -m -1 -M -1 mortiz
chage -E -1 -I -1 -m -1 -M -1 sbenton

# Patchigng Team

# mortiz
# Emp# 130994
# Manuel Ortiz
# manuel.ortiz@cgi.com

useradd -c "Manuel Ortiz - CGI GTO" -u 130994 -G wheel,sudoroot,localssh,cgitier1 -m -d /home/mortiz mortiz

usermod -p "PASSWORDINAD" mortiz

chage -E -1 -I -1 -m -1 -M -1 mortiz

# GTO UNIX 
#
# John Hainsworth - 108494
# Lakshmi Chava - 125575
# Jorge Henríquez - 402228
# Joselito Ong - 212192
# John Flanagan - 500639
# Chris Robbins - 501622
# Rick Kucera - 232414
# MD Nasim Ahmad	mdnasim.ahmad@cgi.com	436146	ma436146	Offshore

#CSS accounts, other domains may be different. 
useradd -c "John Hainsworth - GTO UNIX" -u 108494 -G wheel,cgitier1 -m -d /home/jhainswo jhainswo
useradd -c "Lakshmi Chava - GTO UNIX" -u 125575 -G wheel,cgitier1 -m -d /home/lchava lchava
useradd -c "Nasmim Amad - GTO UNIX" -u 436146 -G wheel,cgitier1 -m -d /home/nahmad nahmad
useradd -c "Jorge Henríquez - GTO UNIX" -u 402228 -G wheel,cgitier1 -m -d /home/jhenriquez jhenriquez
useradd -c "Joselito Ong - GTO UNIX" -u 212192 -G wheel,cgitier1 -m -d /home/jong jong
useradd	-c "John Flanagan - GTO UNIX" -u 500639 -G wheel,cgitier1 -m -d /home/jflanaga jflanaga
useradd -c "Chris Robbins - GTO UNIX" -u 501622 -G wheel,cgitier1 -m -d /home/jrobbins jrobbins
useradd -c "Rick Kucera - GTO UNIX" -u 232414 -G wheel,cgitier1 -m -d /home/rkucera rkucera

usermod -p "PASSWORDINAD" lchava
usermod -p "PASSWORDINAD" jhainswo
usermod -p "PASSWORDINAD" nahmad
usermod -p "PASSWORDINAD" jhenriquez
usermod -p "PASSWORDINAD" jong
usermod -p "PASSWORDINAD" jflanaga
usermod -p "PASSWORDINAD" jrobbins
usermod -p "PASSWORDINAD" rkucera

chage -E -1 -I -1 -m -1 -M -1 jhainswo
chage -E -1 -I -1 -m -1 -M -1 lchava
chage -E -1 -I -1 -m -1 -M -1 nahmad
chage -E -1 -I -1 -m -1 -M -1 jong
chage -E -1 -I -1 -m -1 -M -1 jhenriquez
chage -E -1 -I -1 -m -1 -M -1 jflanaga
chage -E -1 -I -1 -m -1 -M -1 jrobbins
chage -E -1 -I -1 -m -1 -M -1 rkucera


# OPS members
#
# Hyung Joon Choi	hjchoi		242052
# Gary Kuball		gkuball		124058
# Migel Speight		mspeight	131330
# Leonel Perez		lperez		412495
# Mike Eger		meger		083987
# Khoa Nguyen		knguyen		219271
# Rafael Martinez	rmartine	240316
# Roger Langan		rlangan		128114
# Josh loos		jloos		231776
# Bryan Harrell		bharrell	083969

useradd -c "Hyung Joon Choi - OPS" -u 242052 -G wheel,cgitier1 -m -d /home/hjchoi hjchoi
useradd -c "Gary Kuball - OPS" -u 124058 -G wheel,cgitier1 -m -d /home/gkuball gkuball
useradd -c "Migel Speight - OPS" -u 131330 -G wheel,cgitier1 -m -d /home/mspeight mspeight
useradd -c "Leonel Perez - OPS" -u 412495 -G wheel,cgitier1 -m -d /home/lperez lperez
useradd -c "Mike Eger - OPS" -u 83987 -G wheel,cgitier1 -m -d /home/meger meger
useradd -c "Khoa Nguyen - OPS" -u 219271 -G wheel,cgitier1 -m -d /home/knguyen knguyen
useradd -c "Rafael Martinez - OPS" -u 240316 -G wheel,cgitier1 -m -d /home/rmartine rmartine
useradd -c "Roger Langan - OPS" -u 128114 -G wheel,cgitier1 -m -d /home/rlangan rlangan
useradd -c "Josh Loos - OPS" -u 231776 -G wheel,cgitier1 -m -d /home/jloos jloos
useradd -c "Bryan Harrell - OPS" -u 83969 -G wheel,cgitier1 -m -d /home/bharrell bharrell

usermod -p "PASSWORDINAD" hjchoi
usermod -p "PASSWORDINAD" gkuball
usermod -p "PASSWORDINAD" mspeight
usermod -p "PASSWORDINAD" lperez
usermod -p "PASSWORDINAD" meger
usermod -p "PASSWORDINAD" knguyen
usermod -p "PASSWORDINAD" rmartine
usermod -p "PASSWORDINAD" rlangan
usermod -p "PASSWORDINAD" jloos
usermod -p "PASSWORDINAD" bharrell

chage -E -1 -I -1 -m -1 -M -1 hjchoi
chage -E -1 -I -1 -m -1 -M -1 gkuball
chage -E -1 -I -1 -m -1 -M -1 mspeight
chage -E -1 -I -1 -m -1 -M -1 lperez
chage -E -1 -I -1 -m -1 -M -1 meger
chage -E -1 -I -1 -m -1 -M -1 knguyen
chage -E -1 -I -1 -m -1 -M -1 rmartine
chage -E -1 -I -1 -m -1 -M -1 rlangan
chage -E -1 -I -1 -m -1 -M -1 jloos
chage -E -1 -I -1 -m -1 -M -1 bharrell

# Setup Oracle User
groupadd -g 500 dba
groupadd -g 501 oinstall
useradd -u 500 -g oinstall -G dba,cgitier1 -c "Oracle User" -p "PASSWORDINAD" -m oracle
#
# Add DBA users
useradd -c "Patti Moore - GTO DBA" -u 78539 -G dba,wheel,cgitier1,localssh -m -d /home/pmoore pmoore
useradd -c "Mark Smith - GTO DBA" -u 88801 -G dba,wheel,cgitier1,localssh -m -d /home/msmith msmith
useradd -c "Bibin George - GTO DBA" -u 128110 -G dba,wheel,cgitier1,localssh -m -d /home/bgeorge bgeorge

usermod -p "PASSWORDINAD" pmoore
usermod -p "PASSWORDINAD" msmith
usermod -p "PASSWORDINAD" bgeorge

chage -E -1 -I -1 -m -1 -M -1 pmoore
chage -E -1 -I -1 -m -1 -M -1 msmith
chage -E -1 -I -1 -m -1 -M -1 bgeorge

# Service Accounts:
/usr/sbin/useradd -c "Rundeck Service Account" -G wheel -m -K PASS_MAX_DAYS=-1 -p "PASSWORDINAD" svc_rundeck
/usr/sbin/useradd -c "Forescout Service Account" -G wheel -m -K PASS_MAX_DAYS=-1 -p "PASSWORDINAD" svc_forescout
/usr/sbin/useradd -c "Rapid7 Service Account" -G wheel -m -K PASS_MAX_DAYS=-1 -p "PASSWORDINAD" svc_rapid7

chage -E -1 -I -1 -m -1 -M -1 svc_rundeck
chage -E -1 -I -1 -m -1 -M -1 svc_forescout
chage -E -1 -I -1 -m -1 -M -1 svc_rapid7