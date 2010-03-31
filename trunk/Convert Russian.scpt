FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
Script:
	Convert Russian
Version:
	0.3
CahngeLog:
	Added a few minor safety belt features (as dialogs, really)
	Committed changes from Sergii Denega:
	  - character mappings for Ukrainian letters
	  - make script platform-agnostic (now works on both PPC and Intel)
	  - "Album artist" and "Comment" are also converted now
	  - multiple tracks should now be converted correctly
	  - added a timeout for actions of 300000 seconds
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
	Thanks to Sergii Denega for providing a number of further fixes, most importantly to make script work on both PPC and Intel and fixing the issue with multiple tracks to be convereted.

----
** Some say this would not be the case if International pannel lists Russian as first language -- I have not tested that

     � 	 	� 
 S c r i p t : 
 	 C o n v e r t   R u s s i a n 
 V e r s i o n : 
 	 0 . 3 
 C a h n g e L o g : 
 	 A d d e d   a   f e w   m i n o r   s a f e t y   b e l t   f e a t u r e s   ( a s   d i a l o g s ,   r e a l l y ) 
 	 C o m m i t t e d   c h a n g e s   f r o m   S e r g i i   D e n e g a : 
 	     -   c h a r a c t e r   m a p p i n g s   f o r   U k r a i n i a n   l e t t e r s 
 	     -   m a k e   s c r i p t   p l a t f o r m - a g n o s t i c   ( n o w   w o r k s   o n   b o t h   P P C   a n d   I n t e l ) 
 	     -   " A l b u m   a r t i s t "   a n d   " C o m m e n t "   a r e   a l s o   c o n v e r t e d   n o w 
 	     -   m u l t i p l e   t r a c k s   s h o u l d   n o w   b e   c o n v e r t e d   c o r r e c t l y 
 	     -   a d d e d   a   t i m e o u t   f o r   a c t i o n s   o f   3 0 0 0 0 0   s e c o n d s 
 A u t h o r : 
 	 A n d r e i   P o p o v   ( a n d r e i @ c e e s a x p . o r g ) 
 
 T h e   i s s u e : 
 	 I D 3   t a g s   t h a t   a r e   e m b e d d e d   i n   M P 3   f i l e s   g e n e r a t e d   o n   W i n d o w s   o r   ( s h u d d e r )   D O S   m a c h i n e s   u s e   e x t e n d e d   A S C I I   t o   s t o r e   C y r i l l i c s .     W h e n   y o u   i m p o r t   s u c h   f i l e s   i n t o   i T u n e s ,   i t   a s s u m e s   t h a t   t h e y ' r e   a l l   i n   M a c R o m a n   c o d i n g   p a g e * *   a n d   h a p p i l y   g a r b l e s   t h e m   u p . 
 
 T h e   s e a r c h   t o   s o l v e   i t : 
 	 O n e   w a y   t o   d o   t h a t   i s   t o   c o n v e r t   t a g s   * b e f o r e *   i m p o r t i n g   t h e m   i n t o   i T u n e s .     T h i s   m i g h t   w o r k ,   b u t   I   h a v e   n o t   t r i e d   i t ,   d o n ' t   k n o w . 
 	 A n o t h e r   w a y   w a s   t o   t r y   a n d   f i x   t h e m   o n c e   t h e y ' r e   i n   u s i n g   a   ` d o   s h e l l   c o m m a n d '   c a l l   f r o m   A p p l e S c r i p t .     N o   l u c k   t h e r e ,   a l t h o u g h   i c o n v   - f   c p 8 6 6   - t   u t f 8   * a l m o s t *   d o e s   t h e   r i g h t   t h i n g .     A l m o s t ,   b u t   n o t   q u i t e . 
 
 S o l u t i o n : 
 	 I   h a d   t o   m a n u a l l y   r e c o d e   c o n v e r s i o n   t a b l e ,   b a s e d   o n   M a c R o m a n   A S C I I   p a g e   ( h t t p : / / w w w . i r o . u m o n t r e a l . c a / ~ f e l i p e / I F T 1 0 1 0 - H i v e r 2 0 0 5 / C o m p l e m e n t s / a s c i i . h t m l )   v i e w e d   a s   i f   i t   w e r e   C y r i l l i c   ( M a c )   p a g e   i n   C a m i n o ,   t h e n   a s s i g n i n g   p r o p e r   U N I C O D E   v a l u e s   t o   e a c h   c o d e   p o i n t . 
 
 C r e d i t s : 
 	 T h a n k s   t o   S t e f a n K   a t   M a c S c r i p t e r   B B S     f o r   h e l p i n g   m e   s o r t   o u t   a   f e w   A p p l e S c r i p t   i s s u e s . 
 	 T h a n k s   t o   S e r g i i   D e n e g a   f o r   p r o v i d i n g   a   n u m b e r   o f   f u r t h e r   f i x e s ,   m o s t   i m p o r t a n t l y   t o   m a k e   s c r i p t   w o r k   o n   b o t h   P P C   a n d   I n t e l   a n d   f i x i n g   t h e   i s s u e   w i t h   m u l t i p l e   t r a c k s   t o   b e   c o n v e r e t e d . 
 
 - - - - 
 * *   S o m e   s a y   t h i s   w o u l d   n o t   b e   t h e   c a s e   i f   I n t e r n a t i o n a l   p a n n e l   l i s t s   R u s s i a n   a s   f i r s t   l a n g u a g e   - -   I   h a v e   n o t   t e s t e d   t h a t 
 
   
  
 l     ��������  ��  ��        j    ��� �� 0 charcodemap charCodeMap  J    �       l 	    ����  m        �    0 0 2 0��  ��        m       �    0 0 2 0      m       �    0 0 2 0      m       �      0 0 2 0   ! " ! m     # # � $ $  0 0 2 0 "  % & % m     ' ' � ( (  0 0 2 0 &  ) * ) m     + + � , ,  0 0 2 0 *  - . - m     / / � 0 0  0 0 2 0 .  1 2 1 m    	 3 3 � 4 4  0 0 2 0 2  5 6 5 m   	 
 7 7 � 8 8  0 0 0 9 6  9 : 9 m   
  ; ; � < <  0 0 0 A :  = > = m     ? ? � @ @  0 0 2 0 >  A B A m     C C � D D  0 0 2 0 B  E F E m     G G � H H  0 0 0 D F  I J I m     K K � L L  0 0 2 0 J  M N M m     O O � P P  0 0 2 0 N  Q R Q l 	   S���� S m     T T � U U  0 0 2 0��  ��   R  V W V m     X X � Y Y  0 0 2 0 W  Z [ Z m     \ \ � ] ]  0 0 2 0 [  ^ _ ^ m     ` ` � a a  0 0 2 0 _  b c b m     d d � e e  0 0 2 0 c  f g f m    " h h � i i  0 0 2 0 g  j k j m   " % l l � m m  0 0 2 0 k  n o n m   % ( p p � q q  0 0 2 0 o  r s r m   ( + t t � u u  0 0 2 0 s  v w v m   + . x x � y y  0 0 2 0 w  z { z m   . 1 | | � } }  0 0 2 0 {  ~  ~ m   1 4 � � � � �  0 0 2 0   � � � m   4 7 � � � � �  0 0 2 0 �  � � � m   7 : � � � � �  0 0 2 0 �  � � � m   : = � � � � �  0 0 2 0 �  � � � m   = @ � � � � �  0 0 2 0 �  � � � l 	 @ C ����� � m   @ C � � � � �  0 0 2 0��  ��   �  � � � m   C F � � � � �  0 0 2 1 �  � � � m   F I � � � � �  0 0 2 2 �  � � � m   I L � � � � �  0 0 2 3 �  � � � m   L O � � � � �  0 0 2 4 �  � � � m   O R � � � � �  0 0 2 5 �  � � � m   R U � � � � �  0 0 2 6 �  � � � m   U X � � � � �  0 0 2 7 �  � � � m   X [ � � � � �  0 0 2 8 �  � � � m   [ ^ � � � � �  0 0 2 9 �  � � � m   ^ a � � � � �  0 0 2 A �  � � � m   a d � � � � �  0 0 2 B �  � � � m   d g � � � � �  0 0 2 C �  � � � m   g j � � � � �  0 0 2 D �  � � � m   j m � � � � �  0 0 2 E �  � � � m   m p � � � � �  0 0 2 F �  � � � l 	 p s ����� � m   p s � � � � �  0 0 3 0��  ��   �  � � � m   s v � � � � �  0 0 3 1 �  � � � m   v y � � � � �  0 0 3 2 �  � � � m   y | � � � � �  0 0 3 3 �  � � � m   |  � � � � �  0 0 3 4 �  � � � m    � � � � � �  0 0 3 5 �  � � � m   � � � � � � �  0 0 3 6 �  � � � m   � � � � � � �  0 0 3 7 �  � � � m   � � � � � � �  0 0 3 8 �  � � � m   � � � � � � �  0 0 3 9 �  � � � m   � � � � � � �  0 0 3 A �    m   � � �  0 0 3 B  m   � � �  0 0 3 C 	 m   � �

 �  0 0 3 D	  m   � � �  0 0 3 F  m   � � �  0 0 3 F  l 	 � ����� m   � � �  0 0 4 0��  ��    m   � � �  0 0 4 1  m   � � �    0 0 4 2 !"! m   � �## �$$  0 0 4 3" %&% m   � �'' �((  0 0 4 4& )*) m   � �++ �,,  0 0 4 5* -.- m   � �// �00  0 0 4 6. 121 m   � �33 �44  0 0 4 72 565 m   � �77 �88  0 0 4 86 9:9 m   � �;; �<<  0 0 4 9: =>= m   � �?? �@@  0 0 4 A> ABA m   � �CC �DD  0 0 4 BB EFE m   � �GG �HH  0 0 4 CF IJI m   � �KK �LL  0 0 4 DJ MNM m   � �OO �PP  0 0 4 EN QRQ m   � �SS �TT  0 0 4 FR UVU l 	 � �W����W m   � �XX �YY  0 0 5 0��  ��  V Z[Z m   � �\\ �]]  0 0 5 1[ ^_^ m   � �`` �aa  0 0 5 2_ bcb m   � �dd �ee  0 0 5 3c fgf m   � �hh �ii  0 0 5 4g jkj m   � �ll �mm  0 0 5 5k non m   � �pp �qq  0 0 5 6o rsr m   � �tt �uu  0 0 5 7s vwv m   � �xx �yy  0 0 5 8w z{z m   � �|| �}}  0 0 5 9{ ~~ m   � ��� ���  0 0 5 A ��� m   � ��� ���  0 0 5 B� ��� m   � ��� ���  0 0 5 C� ��� m   � ��� ���  0 0 5 D� ��� m   � ��� ���  0 0 5 E� ��� m   � �� ���  0 0 5 F� ��� l 	 ������ m   �� ���  0 0 6 0��  ��  � ��� m  �� ���  0 0 6 1� ��� m  	�� ���  0 0 6 2� ��� m  	�� ���  0 0 6 3� ��� m  �� ���  0 0 6 4� ��� m  �� ���  0 0 6 5� ��� m  �� ���  0 0 6 6� ��� m  �� ���  0 0 6 7� ��� m  �� ���  0 0 6 8� ��� m  �� ���  0 0 6 9� ��� m  !�� ���  0 0 6 A� ��� m  !$�� ���  0 0 6 B� ��� m  $'�� ���  0 0 6 C� ��� m  '*�� ���  0 0 6 D� ��� m  *-�� ���  0 0 6 E� ��� m  -0�� ���  0 0 6 F� ��� l 	03������ m  03�� ���  0 0 7 0��  ��  � ��� m  36�� ���  0 0 7 1� ��� m  69�� ���  0 0 7 2� ��� m  9<�� ���  0 0 7 3� ��� m  <?�� ���  0 0 7 4� ��� m  ?B�� ���  0 0 7 5� ��� m  BE�� ���  0 0 7 6� ��� m  EH�� ���  0 0 7 7� ��� m  HK�� ���  0 0 7 8� ��� m  KN�� ���  0 0 7 9�    m  NQ �  0 0 7 A  m  QT �  0 0 7 B 	 m  TW

 �  0 0 7 C	  m  WZ �  0 0 7 D  m  Z] �  0 0 7 E  m  ]` �  0 0 7 F  l 	`c���� m  `c �  0 4 1 4��  ��    m  cf �    0 4 1 5 !"! m  fi## �$$  0 4 1 7" %&% m  il'' �((  0 4 1 9& )*) m  lo++ �,,  0 4 2 1* -.- m  or// �00  0 4 2 6. 121 m  ru33 �44  0 4 2 C2 565 m  ux77 �88  0 4 3 16 9:9 m  x{;; �<<  0 4 3 0: =>= m  {~?? �@@  0 4 3 2> ABA m  ~�CC �DD  0 4 3 4B EFE m  ��GG �HH  0 4 3 3F IJI m  ��KK �LL  0 4 3 5J MNM m  ��OO �PP  0 4 3 7N QRQ m  ��SS �TT  0 4 3 9R UVU m  ��WW �XX  0 4 3 8V YZY l 	��[����[ m  ��\\ �]]  0 4 3 A��  ��  Z ^_^ m  ��`` �aa  0 4 3 B_ bcb m  ��dd �ee  0 4 3 Dc fgf m  ��hh �ii  0 4 3 Cg jkj m  ��ll �mm  0 4 3 Ek non m  ��pp �qq  0 4 3 Fo rsr m  ��tt �uu  0 4 4 1s vwv m  ��xx �yy  0 4 4 3w z{z m  ��|| �}}  0 4 4 2{ ~~ m  ���� ���  0 4 4 4 ��� m  ���� ���  0 4 4 6� ��� m  ���� ���  0 4 4 5� ��� m  ���� ���  0 4 4 A� ��� m  ���� ���  0 4 4 9� ��� m  ���� ���  0 4 4 B� ��� m  ���� ���  0 4 4 C� ��� l 	�������� m  ���� ���  0 4 2 D��  ��  � ��� m  ���� ���  0 0 A 1� ��� m  ���� ���  0 0 A 2� ��� m  ���� ���  0 0 A 3� ��� m  ���� ���  0 0 A 4� ��� m  ���� ���  0 0 A 5� ��� m  ���� ���  0 0 A 6� ��� m  ���� ���  0 4 2 F� ��� m  ���� ���  0 0 A 8� ��� m  ���� ���  0 0 A 9� ��� m  ���� ���  0 4 1 1� ��� m  ���� ���  0 4 9 1� ��� m  ���� ���  0 4 0 1� ��� m  ���� ���  0 0 A D� ��� m  ���� ���  0 4 1 6� ��� m  ���� ���  0 4 2 8� ��� l 	�������� m  ���� ���  0 0 B 0��  ��  � ��� m  ���� ���  0 0 B 1� ��� m  ���� ���  0 0 B 2� ��� m  ���� ���  0 0 B 3� ��� m  ���� ���  0 4 9 0� ��� m  ��� ���  0 0 B 5� ��� m  �� ���  0 0 B 6� ��� m  �� ���  0 0 B 7� ��� m  �� ���  0 0 B 8�    m   �  0 0 B 9  m   �  0 0 B A 	 m  

 �  0 4 0 4	  m   �  0 4 5 4  m   �  0 0 B D  m   �  0 4 3 6  m    �  0 4 4 8  l 	 #���� m   # �    0 4 5 7��  ��   !"! m  #&## �$$  0 0 C 1" %&% m  &)'' �((  0 0 C 2& )*) m  ),++ �,,  0 0 C 3* -.- m  ,/// �00  0 0 C 4. 121 m  /233 �44  0 0 C 52 565 m  2577 �88  0 0 C 66 9:9 m  58;; �<<  0 0 C 7: =>= m  8;?? �@@  0 0 C 8> ABA m  ;>CC �DD  0 0 C 9B EFE m  >AGG �HH  0 0 C AF IJI m  ADKK �LL  0 4 1 0J MNM m  DGOO �PP  0 4 1 3N QRQ m  GJSS �TT  0 4 2 5R UVU m  JMWW �XX  0 0 C EV YZY m  MP[[ �\\  0 0 C FZ ]^] l 	PS_����_ m  PS`` �aa  0 0 D 0��  ��  ^ bcb m  SVdd �ee  0 0 D 1c fgf m  VYhh �ii  0 4 5 6g jkj m  Y\ll �mm  0 4 0 6k non m  \_pp �qq  0 0 D 4o rsr m  _btt �uu  0 0 D 5s vwv m  bexx �yy  0 4 4 7w z{z m  eh|| �}}  0 4 2 7{ ~~ m  hk�� ���  0 4 4 F ��� m  kn�� ���  0 0 D 9� ��� m  nq�� ���  0 0 D A� ��� m  qt�� ���  0 0 D B� ��� m  tw�� ���  0 4 2 0� ��� m  wz�� ���  0 4 4 0� ��� m  z}�� ���  0 4 2 E� ��� m  }��� ���  0 4 4 E� ��� l 	�������� m  ���� ���  0 4 4 D��  ��  � ��� m  ���� ���  0 0 E 1� ��� m  ���� ���  0 0 E 2� ��� m  ���� ���  0 0 E 3� ��� m  ���� ���  0 0 E 4� ��� m  ���� ���  0 4 1 2� ��� m  ���� ���  0 4 1 A� ��� m  ���� ���  0 4 1 1� ��� m  ���� ���  0 4 1 B� ��� m  ���� ���  0 4 1 9� ��� m  ���� ���  0 4 1 D� ��� m  ���� ���  0 4 1 E� ��� m  ���� ���  0 4 1 F� ��� m  ���� ���  0 4 1 C� ��� m  ���� ���  0 4 2 3� ��� m  ���� ���  0 4 2 4� ��� l 	�������� m  ���� ���  0 0 F 0��  ��  � ��� m  ���� ���  0 4 2 2� ��� m  ���� ���  0 4 2 A� ��� m  ���� ���  0 4 2 B� ��� m  ���� ���  0 4 2 9� ��� m  ���� ���  0 0 F 5� ��� m  ���� ���  0 0 F 6� ��� m  ���� ���  0 0 F 7�    m  �� �  0 4 0 7  m  �� �  0 0 F 9 	 m  ��

 �  0 0 F A	  m  �� �  0 0 F B  m  �� �  0 4 5 1  m  �� �  0 0 F D  m  �� �  0 0 F E �� m  �� �  0 0 F F��      l     ��������  ��  ��    !"! l   %#����# O    %$%$ Z   $&'��(& >   
)*) 1    ��
�� 
sele* J    	����  ' k   ++ ,-, I   ��./
�� .sysodlogaskr        TEXT. l 	  0����0 m    11 �22 � W A R N I N G :   t h i s   a c t i o n   c a n n o t   b e   u n d o n e . 
 D o   y o u   s t i l l   w a n t   t o   p r o c e e d e ?��  ��  / ��34
�� 
btns3 J    55 676 m    88 �99  Y e s ,   p l e a s e7 :��: m    ;; �<<  O h ,   N O !��  4 ��=��
�� 
dflt= m    ���� ��  - >��> Z   ?@��A? =   BCB l   D����D n    EFE 1    ��
�� 
bhitF l   G����G 1    ��
�� 
rslt��  ��  ��  ��  C m    HH �II  Y e s ,   p l e a s e@ k   "JJ KLK r   " 'MNM 1   " %��
�� 
seleN o      ���� 0 songlist songListL OPO r   ( 1QRQ I  ( /��S��
�� .corecnte****       ****S n  ( +TUT 2  ) +��
�� 
cobjU o   ( )���� 0 songlist songList��  R o      ���� 0 
songscount 
songsCountP VWV l  2 2��������  ��  ��  W XYX r   2 ;Z[Z 1   2 7��
�� 
pFix[ o      ���� 	0 oldfi  Y \]\ r   < C^_^ m   < =��
�� boovtrue_ 1   = B��
�� 
pFix] `a` l  D D��������  ��  ��  a bcb t   D �ded X   H �f��gf O   Z �hih Q   ^ �jk��j k   a �ll mnm r   a ropo n  a lqrq I   b l��s���� 0 fixcyrillics fixCyrillicss t��t e   b huu 1   b h��
�� 
pnam��  ��  r  f   a bp 1   l q��
�� 
pnamn vwv r   s �xyx n  s ~z{z I   t ~��|���� 0 fixcyrillics fixCyrillics| }��} e   t z~~ 1   t z��
�� 
pArt��  ��  {  f   s ty 1   ~ ���
�� 
pArtw � r   � ���� n  � ���� I   � �������� 0 fixcyrillics fixCyrillics� ���� e   � ��� 1   � ���
�� 
pAlb��  ��  �  f   � �� 1   � ���
�� 
pAlb� ��� r   � ���� n  � ���� I   � �������� 0 fixcyrillics fixCyrillics� ���� e   � ��� 1   � ���
�� 
pAlA��  ��  �  f   � �� 1   � ���
�� 
pAlA� ��� r   � ���� n  � ���� I   � �������� 0 fixcyrillics fixCyrillics� ���� e   � ��� 1   � ���
�� 
pGen��  ��  �  f   � �� 1   � ���
�� 
pGen� ��� r   � ���� n  � ���� I   � �������� 0 fixcyrillics fixCyrillics� ���� e   � ��� 1   � ���
�� 
pCmp��  ��  �  f   � �� 1   � ���
�� 
pCmp� ���� r   � ���� n  � ���� I   � �������� 0 fixcyrillics fixCyrillics� ���� e   � ��� 1   � ���
�� 
pCmt��  ��  �  f   � �� 1   � ���
�� 
pCmt��  k R      ������
�� .ascrerr ****      � ****��  ��  ��  i o   Z [���� 0 atrack aTrack�� 0 atrack aTrackg o   K L���� 0 songlist songListe m   D G����u0c ��� l  � ���������  ��  ��  � ��� r   � ���� o   � ����� 	0 oldfi  � 1   � ��
� 
pFix� ��� l  � ��~�}�|�~  �}  �|  � ��{� I  ��z��
�z .sysodlogaskr        TEXT� b   ���� b   � ���� m   � ��� ��� , C o n v e r t e d   d e t a i l s   f o r  � o   � ��y�y 0 
songscount 
songsCount� m   ��� ���    t r a c k s .� �x��
�x 
btns� J  �� ��w� m  �� ���  O K�w  � �v��u
�v 
dflt� m  	
�t�t �u  �{  ��  A l �s���s  � &   action for 2nd button goes here   � ��� @   a c t i o n   f o r   2 n d   b u t t o n   g o e s   h e r e��  ��  ( I $�r��
�r .sysodlogaskr        TEXT� l 	��q�p� m  �� ��� � T o   c o n v e r t   t r a c k   d e t a i l s ,   p l e a s e   s e l e c t   t h e m   i n   i T u n e s   p l a y l i s t   f i r s t�q  �p  � �o��
�o 
btns� J  �� ��n� m  �� ���  O K�n  � �m��l
�m 
dflt� m   �k�k �l  % m     ���                                                                                  hook  alis    J  Zaphod's HD                űt�H+   ]#�
iTunes.app                                                      ^g�K��        ����  	                Applications    űJ�      �Kr`     ]#�  #Zaphod's HD:Applications:iTunes.app    
 i T u n e s . a p p    Z a p h o d ' s   H D  Applications/iTunes.app   / ��  ��  ��  " ��� l     �j�i�h�j  �i  �h  � ��� i  ����� I      �g��f�g 0 fixcyrillics fixCyrillics� ��e� o      �d�d 0 str  �e  �f  � k     ��� ��� r     ��� I    �c��b
�c .sysoexecTEXT���     TEXT� m     �� ���  u n a m e   - p�b  � o      �a�a 0 macplatform macPlatform� ��`� Z    ����_�� >   ��� o    	�^�^ 0 macplatform macPlatform� m   	 
�� ���  i 3 8 6� k    R�� ��� r    ��� c    ��� m    �� ���  � m    �]
�] 
utxt� o      �\�\ 0 outstr outStr� ��� X    O��[�� k   & J�� ��� r   & -��� I  & +�Z��Y
�Z .sysoctonshor       TEXT� o   & '�X�X 0 i  �Y  � o      �W�W 0 charcode charCode�    r   . : n   . 8 4   3 8�V
�V 
cobj l  4 7�U�T [   4 7	 o   4 5�S�S 0 charcode charCode	 m   5 6�R�R �U  �T   o   . 3�Q�Q 0 charcodemap charCodeMap o      �P�P 
0 uni Uni 
�O
 r   ; J b   ; H o   ; <�N�N 0 outstr outStr l  < G�M�L I  < G�K�J
�K .sysodsct****        scpt c   < C b   < A b   < ? m   < = �  � d a t a   u t x t o   = >�I�I 
0 uni Uni m   ? @ �  � m   A B�H
�H 
utxt�J  �M  �L   o      �G�G 0 outstr outStr�O  �[ 0 i  � n     2   �F
�F 
cha  o    �E�E 0 str  � �D L   P R o   P Q�C�C 0 outstr outStr�D  �_  � k   U �  !  r   U Z"#" c   U X$%$ m   U V&& �''  % m   V W�B
�B 
utxt# o      �A�A 0 outstr outStr! ()( X   [ �*�@+* k   m �,, -.- r   m t/0/ I  m r�?1�>
�? .sysoctonshor       TEXT1 o   m n�=�= 0 i  �>  0 o      �<�< 0 charcode charCode. 232 r   u �454 n   u 676 4   z �;8
�; 
cobj8 l  { ~9�:�99 [   { ~:;: o   { |�8�8 0 charcode charCode; m   | }�7�7 �:  �9  7 o   u z�6�6 0 charcodemap charCodeMap5 o      �5�5 
0 uni Uni3 <=< r   � �>?> b   � �@A@ n   � �BCB 7  � ��4DE
�4 
ctxtD m   � ��3�3 E m   � ��2�2 C o   � ��1�1 
0 uni UniA n   � �FGF 7  � ��0HI
�0 
ctxtH m   � ��/�/ I m   � ��.�. G o   � ��-�- 
0 uni Uni? o      �,�, 
0 uni Uni= J�+J r   � �KLK b   � �MNM o   � ��*�* 0 outstr outStrN l  � �O�)�(O I  � ��'P�&
�' .sysodsct****        scptP c   � �QRQ b   � �STS b   � �UVU m   � �WW �XX  � d a t a   u t x tV o   � ��%�% 
0 uni UniT m   � �YY �ZZ  �R m   � ��$
�$ 
utxt�&  �)  �(  L o      �#�# 0 outstr outStr�+  �@ 0 i  + n   ^ a[\[ 2  _ a�"
�" 
cha \ o   ^ _�!�! 0 str  ) ]� ] L   � �^^ o   � ��� 0 outstr outStr�   �`  � _�_ l     ����  �  �  �       �`abc�  ` ���� 0 charcodemap charCodeMap� 0 fixcyrillics fixCyrillics
� .aevtoappnull  �   � ****a �d� d       # ' + / 3 7 ; ? C G K O T X \ ` d h l p t x | � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
#'+/37;?CGKOSX\`dhlptx|��������������������������������
#'+/37;?CGKOSW\`dhlptx|��������������������������������
#'+/37;?CGKOSW[`dhlptx|��������������������������������
b ����ef�� 0 fixcyrillics fixCyrillics� �g� g  �� 0 str  �  e ������
� 0 str  � 0 macplatform macPlatform� 0 outstr outStr� 0 i  � 0 charcode charCode�
 
0 uni Unif ��	���������&�� WY
�	 .sysoexecTEXT���     TEXT
� 
utxt
� 
cha 
� 
kocl
� 
cobj
� .corecnte****       ****
� .sysoctonshor       TEXT
� .sysodsct****        scpt
� 
ctxt�  � ��j E�O�� I��&E�O :��-[��l kh �j 	E�Ob   �k/E�O��%�%�&j %E�[OY��O�Y d��&E�O X��-[��l kh �j 	E�Ob   �k/E�O�[�\[Zm\Z�2�[�\[Zk\Zl2%E�O�a �%a %�&j %E�[OY��O�c ��h����ij��
�� .aevtoappnull  �   � ****h k    %kk !����  ��  ��  i ���� 0 atrack aTrackj #���1��8;����������H�����������������������������������������
�� 
sele
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
bhit�� 0 songlist songList
�� 
cobj
�� .corecnte****       ****�� 0 
songscount 
songsCount
�� 
pFix�� 	0 oldfi  ��u0
�� 
kocl
�� 
pnam�� 0 fixcyrillics fixCyrillics
�� 
pArt
�� 
pAlb
�� 
pAlA
�� 
pGen
�� 
pCmp
�� 
pCmt��  ��  ��&�"*�,jv
����lv�l� O��,�  �*�,E�O��-j E�O*a ,E` Oe*a ,FOa n ��[a �l kh  � � �)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FO)*a ,Ek+ *a ,FW X  hU[OY�loO_ *a ,FOa �%a %�a  kv�k� Y hY a !�a "kv�k� U ascr  ��ޭ