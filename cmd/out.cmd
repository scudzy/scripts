@Echo Off
SetLocal EnableExtensions
If Not Exist OUT.EXE (
Call :Rebuild
If ErrorLevel 1 (
Echo Rebuild failed.
Goto :Eof
)
)
out 0E "                                            SOME TEXT TO DISPLAY HERE IN COLOR\n"
out 0E "                                      SOME TEXT TO DISPLAY HERE IN COLOR\n"
out 0E "                                       SOME TEXT TO DISPLAY HERE IN COLOR\n"
Goto :Eof

:Rebuild
Rem Script made using BHX 5.6 { consolesoft.com/p/bhx }
SetLocal EnableExtensions EnableDelayedExpansion
Set "bin=OUT.CAB"
Set /A "size=1296"
Rem Source code of out v1.1 at: consolesoft.com/p/out/out.txt
For %%# In (
"OUT.EXE"
"!bin!" "!bin!.da" "!bin!.tmp"
) Do If Exist "%%#" (Del /A /F /Q "%%#" >Nul 2>&1
If ErrorLevel 1 Exit /B 1 )
Set "fsrc=%~f0"
Findstr /B /N ":+res:!bin!:" "!fsrc!" >"!bin!.tmp"
(Set /P "inioff="
Set /P "endoff=") <"!bin!.tmp"
For /F "delims=:" %%# In ("!inioff!") Do Set "inioff=%%#"
For /F "delims=:" %%# In ("!endoff!") Do Set "endoff=%%#"
Set ".=ado="adodb.stream""
Set ".=!.! :set a=createobject(ado) :a.type=1 :a.open"
Set ".=!.! :set u=createobject(ado) :u.type=2 :u.open"
Set ".=!.! :set fs=createobject("scripting.filesystemobject")"
Set ".=!.! :set s=fs.opentextfile("!fsrc!",1,0,0)"
Set ".=!.! :e="0123456789abcdefghijklmnopqrstuvwxyzABCDEF"
Set ".=!.!GHIJKLMNOPQRSTUVWXYZ.-:+=^^`/*?&<>()[]{}~,$#"
Set ".=!.!" :max=!size! :wri=0 :n=array(0,0,0,0,0)"
Set ".=!.! :for i=1 to !inioff! step 1 :s.readline :next"
Set ".=!.! :do while i<!endoff! :d=replace(s.readline," ","")"
Set ".=!.! :for j=1 to len(d) step 5 :num85=mid(d,j,5)"
Set ".=!.! :v=0 :for k=1 to len(num85) step 1"
Set ".=!.! :v=v*85+instr(1,e,mid(num85,k,1))-1 :next"
Set ".=!.! :n(1)=Fix(v/16777216) :v=v-n(1)*16777216"
Set ".=!.! :n(2)=Fix(v/65536) :v=v-n(2)*65536"
Set ".=!.! :n(3)=Fix(v/256) :n(4)=v-n(3)*256"
Set ".=!.! :for m=1 to 4 step 1 :if (wri < max) then"
Set ".=!.! :u.writetext chrb(n(m)) :wri=wri+1 :end if :next"
Set ".=!.! :next :i=i+1 :loop"
Set ".=!.! :u.position=2 :u.copyto a :u.close :set u=nothing"
Set ".=!.! :a.savetofile "!bin!",2 :a.close :set a=nothing"
Set ".=!.! :s.close :set s=nothing :set fs=nothing"
Echo !.!>"!bin!.da"
Set "ret=1"
Cscript.exe /B /E:vbs "!bin!.da" >Nul
For %%# In ("!bin!") Do If "%%~z#"=="!size!" Set "ret=0"
If "0"=="!ret!" Expand.exe -r "!bin!" -F:* . >Nul
If ErrorLevel 1 Set "ret=1"
Del /A /F "!bin!" "!bin!.da" "!bin!.tmp" >Nul
Exit /B !ret!

:+res:OUT.CAB:
o&BzG000005cS4l00000ec2UI000000,5A50rr9100000l&Wh`0rrim01Ybg
00000006w}nc]m~pGpvDmoz$U(qS&z.#{5Kty.l-0u.NDJNE)A001/107u>/
CvaJ$T)5*pV$I,vwUo-LThG]~9u~7$8S`Y^FvfK4?QVb^WB:`?IdKEBguUL8
5~}+HaB<PKl7**#m<LetE9,polikZs8x,XE2.Aq.01Yehbn*G>c<e,.~KD{B
.Ri]/?V?,H(&mxE1X:<Z4z{wS3Q??`fSIGb5#VCw<n.?rz:D-n,gGK,00000
bM`cl,1Gu04-J8YP]z:woAFd4ssb6zy+<Rke+Q)l4<2[e<)tick*?Grg1Mwf
6PFQ&O5.K$tn2itslH?-I&/s[c[y$isY=8GD)fA4evj8+RTd#BhI~^{l)Sg,
dnzpReo~]~Z`=MRJ6I~cJrIDFj=B&xf>w,^c{kWWEUbCf3-x&:4phFltjjAB
.V/sq1+-brA/*k>N9)Y?=4kXK4YOs$z.d*eV65j.=0(gTkG`N]~dPVTqLG>I
W]R37aVNzEcY~J7~u,5`6M(3TO<dUA(iD=,k#gkcuMmMo19HRr<uxu=JN)Eg
y)~+}mysztnrvY25./VT-=-FD//dsB`u]3N1oL<ZHI~TygDR,Wt&b^~.,9)/
v=2>~4x9<H?tEL)hW}s1BMwmCA7ehv2z}L+9p}f>cuR&fu3r=MW+q`$xp</h
dP(H,]ZhP{`b7<X/c^fd`^rqTu#MXp+kodB?>#M991JT(md/KU)m/$:/9n`a
sId`-ddBHZsy.m,2JyDjah*EXBS`J=n7JW`?DsZ4mrY,PWIO761S^tw6KSB4
i,3nti-Pz=fwX+hle1?c:}RYLGnT=+*u=1,J.OG8*>5=W1M5x=W~Dw-bRJv3
=lCpcp3#(lD/(^h/Jxnk:zn)Td:3-?)08s,*Wv)GpW,DYw7(2OT(^ZKCq{{O
dK>T0vpDbQ&l1I((m.`o7xp)&`UzgzvQ67r</zP{MFgc0c?21HZBk1j5XCBT
gwJ-68P<[?NB]Qm=G,(B]a5a)}Za3n8d8Z~m}]VSDjdw=YR({0~eKPlP}57p
}HseUDs<XHh&v2yoq+pX>Ilw-V`A0?9{7?3f?D?(dLC*xBdIw)?{g~o7Q6R:
et14Bd)hL}b,6o#.ZhXkp$Khj}K)R{g>d]tlu[zdQ#}Po*+9TSOoaHS9wOM9
(-VtfD-63:{ILq)*gdZbX<,bu8<QYP]Vu}Kxk/JuOncWV>08Ev~D5SGw:htt
bR[LC:p^W{&7}w>GL]~ti^gS[vRcVKo}l:TGjBaHCE[$wmn)>xNK&e3i9<[`
.~/`-T0aVv<Xg<,L7ju*eXQBZ?=p>NG*2c9]G0pixb:,zB*$R9,3qGOxm8?9
f3Bh/SsqRu{E&l&-GJo?OdCPqHA{MGgtr]NOe#x1]}8vx/Y$4ysGz<nF+3sI
n>-U}T5uTkirf=fe(LX66C-Cc4p>u7f?IHefXK{^7Gsm$y&VVeK11mo0m<4k
`JtqI~L83UJa2H-Fu~LdWr:rGLQvn.U[`1j*as3KvxGO]N,pj]M^G2yIBAYp
Wep+u3/Qz)eB`?dHjOG,kT[}W[P&.^Nj7}0^K*sFEq#]bc5*myRlW}RWu{8>
:+res:OUT.CAB:
