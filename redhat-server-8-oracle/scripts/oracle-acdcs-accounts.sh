#!/bin/bash

#add groups

sudo groupadd advadmin
sudo groupadd psmag
sudo groupadd appsoft
sudo groupadd dbasoft
sudo groupadd xfiles
sudo groupadd staff
sudo groupadd usissec
sudo groupadd unixadmins
sudo groupadd occops
sudo groupadd patchers
sudo groupadd oinstall
sudo groupadd oper

# Fill our groups up with users.
usermod -a -G usissec svc_rapid7
usermod -a -G usissec bverlander
usermod -a -G usissec nismith
usermod -a -G usissec madesanya
usermod -a -G usissec gcrystal
usermod -a -G usissec ssaheed
usermod -a -G usissec kgrossmann
usermod -a -G unixadmins lchava
usermod -a -G unixadmins jong
usermod -a -G unixadmins nahmad
usermod -a -G unixadmins jflanaga
usermod -a -G unixadmins jhainswo
usermod -a -G unixadmins jhenriquez
usermod -a -G occops knguyen
usermod -a -G occops rlangan
usermod -a -G occops rmartine
usermod -a -G occops mspeight
usermod -a -G occops gkuball
usermod -a -G occops bharrell
usermod -a -G patchers mortiz
usermod -a -G patchers tprice
usermod -a -G patchers mrodgers
usermod -a -G patchers msaaid


# add users

sudo useradd -c "advadmin" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/advadmin advadmin
sudo useradd -c "Amit Rana" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/arana arana
sudo useradd -c "Andrew Winata" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/awinata awinata
sudo useradd -c "Arnold Gomes" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/agomes agomes
sudo useradd -c "Derek Kelone" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/dkelone dkelone
sudo useradd -c "Eric Burrage" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/eburrage eburrage
sudo useradd -c "Faiz Ali" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/fali fali
sudo useradd -c "Grant Dozier" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/gdozier gdozier
sudo useradd -c "Hanamesh Maranoor" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/hmaranoo hmaranoo
sudo useradd -c "Jason Harlos" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/jharlos jharlos
sudo useradd -c "Jayalakshmi Yagneswaran" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/jyagnesw jyagnesw
sudo useradd -c "Jayanth Godishala" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/jgodisha jgodisha
sudo useradd -c "Kalpana Murakonda" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/kmurakon kmurakon
sudo useradd -c "Manideep Sriram" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/msriram msriram
sudo useradd -c "Naveen Cheenepalli" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/ncheenep ncheenep
sudo useradd -c "Neeharika Sivaprasad " -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/nsivapra nsivapra
sudo useradd -c "Parmesh Padakanti" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/ppadakan ppadakan
sudo useradd -c "Pradeep Menon" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/pmenon pmenon
sudo useradd -c "Priyanka Chandruka" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/pchandru pchandru
sudo useradd -c "Santhosh Kumar" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/skumar skumar
sudo useradd -c "Shailan Shanmughan" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/sshanmug sshanmug
sudo useradd -c "Sangeeta Muppavarapu" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/smuppava smuppava
sudo useradd -c "Shankar Janamaddi" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/sjanamad sjanamad
sudo useradd -c "Simhachalam N Lekkala" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/slekkala slekkala
sudo useradd -c "Suman Shekar" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/ssuman ssuman
sudo useradd -c "Sanjay Thikekar" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/sthikeka sthikeka
sudo useradd -c "Surendra Chintalapudi" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/schintal2 schintal2
sudo useradd -c "Viswanatha Kandanuru" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/vkandan vkandan
sudo useradd -c "Sanjay Thikekar" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/sthikeka sthikeka
sudo useradd -c "Xiaoping Pullen" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/xpullen xpullen
sudo useradd -c "Nitin Bansal" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/nbansal nbansal
sudo useradd -c "Raymond Chiu" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/rchiu rchiu
sudo useradd -c "Meesham Maredia" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/mmaredia mmaredia
sudo useradd -c "Rajesh Gottumukkala" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/rgottumu rgottumu
sudo useradd -c "David Hoye" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/dhoye dhoye
sudo useradd -c "Thomas Henderson" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/thenders thenders
sudo useradd -c "Brandon Robinson" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/brobinso brobinso
sudo useradd -c "Tin Aye" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/taye taye
sudo useradd -c "Nancy Prince" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/nprince nprince
sudo useradd -c "Kristi Cutts" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/ktolin ktolin
sudo useradd -c "David Combs" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/dcombs dcombs
sudo useradd -c "Lisa Reith" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/lreith lreith
sudo useradd -c "Jonathan Ruppel" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/jruppel jruppel
sudo useradd -c "Nischal Regmi" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/nregmi nregmi
sudo useradd -c "Paul Davila" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/pdavila pdavila
sudo useradd -c "Priyanka Sabbu" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/psabbu psabbu
sudo useradd -c "Michael Nance" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/mnance mnance
sudo useradd -c "Michael Mooney" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/mmooney mmooney
sudo useradd -c "Christopher Leininger" -g advadmin -G staff,psmag,appsoft,dbasoft,xfiles -m -d /home/cleining cleining


# set AD password

sudo usermod -p "PASSWORDINAD" arana
sudo usermod -p "PASSWORDINAD" awinata
sudo usermod -p "PASSWORDINAD" agomes
sudo usermod -p "PASSWORDINAD" dkelone
sudo usermod -p "PASSWORDINAD" eburrage
sudo usermod -p "PASSWORDINAD" fali
sudo usermod -p "PASSWORDINAD" gdozier
sudo usermod -p "PASSWORDINAD" hmaranoo
sudo usermod -p "PASSWORDINAD" jharlos
sudo usermod -p "PASSWORDINAD" jyagnesw
sudo usermod -p "PASSWORDINAD" jgodisha
sudo usermod -p "PASSWORDINAD" kmurakon
sudo usermod -p "PASSWORDINAD" msriram
sudo usermod -p "PASSWORDINAD" ncheenep
sudo usermod -p "PASSWORDINAD" nsivapra
sudo usermod -p "PASSWORDINAD" ppadakan
sudo usermod -p "PASSWORDINAD" pmenon
sudo usermod -p "PASSWORDINAD" pchandru
sudo usermod -p "PASSWORDINAD" squraish
sudo usermod -p "PASSWORDINAD" skumar
sudo usermod -p "PASSWORDINAD" sshanmug
sudo usermod -p "PASSWORDINAD" smuppava
sudo usermod -p "PASSWORDINAD" sjanamad
sudo usermod -p "PASSWORDINAD" slekkala
sudo usermod -p "PASSWORDINAD" ssuman
sudo usermod -p "PASSWORDINAD" sthikeka
sudo usermod -p "PASSWORDINAD" schintal2
sudo usermod -p "PASSWORDINAD" vkandan
sudo usermod -p "PASSWORDINAD" sthikeka
sudo usermod -p "PASSWORDINAD" xpullen
sudo usermod -p "PASSWORDINAD" nbansal
sudo usermod -p "PASSWORDINAD" rchiu
sudo usermod -p "PASSWORDINAD" mmaredia
sudo usermod -p "PASSWORDINAD" rgottumu
sudo usermod -p "PASSWORDINAD" dhoye
sudo usermod -p "PASSWORDINAD" thenders
sudo usermod -p "PASSWORDINAD" brobinso
sudo usermod -p "PASSWORDINAD" taye
sudo usermod -p "PASSWORDINAD" nprince
sudo usermod -p "PASSWORDINAD" ktolin
sudo usermod -p "PASSWORDINAD" dcombs
sudo usermod -p "PASSWORDINAD" lreith
sudo usermod -p "PASSWORDINAD" jruppel
sudo usermod -p "PASSWORDINAD" nregmi
sudo usermod -p "PASSWORDINAD" pdavila
sudo usermod -p "PASSWORDINAD" psabbu
sudo usermod -p "PASSWORDINAD" mnance
sudo usermod -p "PASSWORDINAD" mmooney
sudo usermod -p "PASSWORDINAD" cleining
sudo usermod -p "PASSWORDINAD" advadmin

#Set user perms

sudo chage -E -1 -I -1 -m -1 -M -1 arana
sudo chage -E -1 -I -1 -m -1 -M -1 awinata
sudo chage -E -1 -I -1 -m -1 -M -1 agomes
sudo chage -E -1 -I -1 -m -1 -M -1 dkelone
sudo chage -E -1 -I -1 -m -1 -M -1 eburrage
sudo chage -E -1 -I -1 -m -1 -M -1 fali
sudo chage -E -1 -I -1 -m -1 -M -1 gdozier
sudo chage -E -1 -I -1 -m -1 -M -1 hmaranoo
sudo chage -E -1 -I -1 -m -1 -M -1 jharlos
sudo chage -E -1 -I -1 -m -1 -M -1 jyagnesw
sudo chage -E -1 -I -1 -m -1 -M -1 jgodisha
sudo chage -E -1 -I -1 -m -1 -M -1 kmurakon
sudo chage -E -1 -I -1 -m -1 -M -1 msriram
sudo chage -E -1 -I -1 -m -1 -M -1 ncheenep
sudo chage -E -1 -I -1 -m -1 -M -1 nsivapra
sudo chage -E -1 -I -1 -m -1 -M -1 ppadakan
sudo chage -E -1 -I -1 -m -1 -M -1 pmenon
sudo chage -E -1 -I -1 -m -1 -M -1 pchandru
sudo chage -E -1 -I -1 -m -1 -M -1 squraish
sudo chage -E -1 -I -1 -m -1 -M -1 skumar
sudo chage -E -1 -I -1 -m -1 -M -1 sshanmug
sudo chage -E -1 -I -1 -m -1 -M -1 smuppava
sudo chage -E -1 -I -1 -m -1 -M -1 sjanamad
sudo chage -E -1 -I -1 -m -1 -M -1 slekkala
sudo chage -E -1 -I -1 -m -1 -M -1 ssuman
sudo chage -E -1 -I -1 -m -1 -M -1 sthikeka
sudo chage -E -1 -I -1 -m -1 -M -1 schintal2
sudo chage -E -1 -I -1 -m -1 -M -1 vkandan
sudo chage -E -1 -I -1 -m -1 -M -1 sthikeka
sudo chage -E -1 -I -1 -m -1 -M -1 xpullen
sudo chage -E -1 -I -1 -m -1 -M -1 nbansal
sudo chage -E -1 -I -1 -m -1 -M -1 rchiu
sudo chage -E -1 -I -1 -m -1 -M -1 mmaredia
sudo chage -E -1 -I -1 -m -1 -M -1 rgottumu
sudo chage -E -1 -I -1 -m -1 -M -1 dhoye
sudo chage -E -1 -I -1 -m -1 -M -1 thenders
sudo chage -E -1 -I -1 -m -1 -M -1 brobinso
sudo chage -E -1 -I -1 -m -1 -M -1 taye
sudo chage -E -1 -I -1 -m -1 -M -1 nprince
sudo chage -E -1 -I -1 -m -1 -M -1 ktolin
sudo chage -E -1 -I -1 -m -1 -M -1 dcombs
sudo chage -E -1 -I -1 -m -1 -M -1 lreith
sudo chage -E -1 -I -1 -m -1 -M -1 jruppel
sudo chage -E -1 -I -1 -m -1 -M -1 nregmi
sudo chage -E -1 -I -1 -m -1 -M -1 pdavila
sudo chage -E -1 -I -1 -m -1 -M -1 psabbu
sudo chage -E -1 -I -1 -m -1 -M -1 mnance
sudo chage -E -1 -I -1 -m -1 -M -1 mmooney
sudo chage -E -1 -I -1 -m -1 -M -1 cleining
sudo chage -E -1 -I -1 -m -1 -M -1 advadmin