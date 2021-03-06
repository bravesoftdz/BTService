{
 this file is part of Ares
 Aresgalaxy ( http://aresgalaxy.sourceforge.net )

  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; either
  version 2 of the License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 }

{
Description:
various functions related to combo boxes
}

unit helper_combos;

interface

uses
stdctrls,classes,{tntstdctrls,}registry,const_ares{,tntsysutils};

const
HISTORY_GENERAL=0;
HISTORY_TITLE=1;
HISTORY_AUTHOR=2;
HISTORY_ALBUM=3;
HISTORY_DATE=4;

procedure combo_add_bitrates(combo:tcombobox);
procedure combo_add_size(combo:tcombobox);

procedure combo_add_resolutions(combo:tcombobox);
//procedure combo_add_categories(combo:TtntComboBox; mime:byte);
//function add_tntcombo_history(combo:ttntcombobox):boolean;
//procedure combo_add_history(combo:ttntcombobox;first:byte;second:byte);
procedure combo_add_languages(combo:tcombobox);
procedure delete_excedent_history(reg:tregistry;lista:tstringlist);
//function combo_to_mimetype(combo:ttntcombobox):byte;
function combo_index_to_bitrate(index:integer):integer; //in synch a seconda dell'indice della combo search
function combo_index_to_duration(index:integer):integer; //in synch a seconda dell'indice della combo search
function combo_index_to_size(index:integer):integer; //in synch a seconda dell'indice della combo search
function combo_index_to_resolution(index:integer):integer; //in synch a seconda dell'indice della combo search


implementation

function combo_index_to_resolution(index:integer):integer; //in synch a seconda dell'indice della combo search
begin
 case index of
 0:result:=0;
 1:result:=16;
 2:result:=32;
 3:result:=48;
 4:result:=80;
 5:result:=160;
 6:result:=320;
 7:result:=640;
 8:result:=720;
 9:result:=800;
 10:result:=1024;
 11:result:=1280;
 else result:=2048;
 end;
end;

function combo_index_to_size(index:integer):integer; //in synch a seconda dell'indice della combo search
begin
case index of
 0:result:=0;
 1: result:= GIGABYTE;
 2: result:= 500 * MEGABYTE;
 3: result:= 200 * MEGABYTE;
 4: result:= 100 * MEGABYTE;
 5: result:= 50 * MEGABYTE;
 6: result:= 20 * MEGABYTE;
 7: result:= 10 * MEGABYTE;
 8: result:= 5 * MEGABYTE;
 9: result:= 2 * MEGABYTE;
 10:result:= 1 * MEGABYTE;
 11:result:= 500 * KBYTE;
 12:result:= 200 * KBYTE;
 13:result:= 100 * KBYTE;
 14:result:= 50 * KBYTE;
 15:result:= 20 * KBYTE else
    result:= 10 * KBYTE;
end;
end;

procedure combo_add_size(combo:tcombobox);
begin
with combo.items do begin
 beginupdate;
 clear;
 add('');
  add('1 GB');
 add('500 MB');
 add('200 MB');
 add('100 MB');
 add('50 MB');
 add('20 MB');
 add('10 MB');
 add('5 MB');
 add('2 MB');
 add('1 MB');
 add('500 KB');
 add('200 KB');
 add('100 KB');
 add('50 KB');
 add('20 KB');
 add('10 KB');

endupdate;
end;
end;

function combo_index_to_duration(index:integer):integer; //in synch a seconda dell'indice della combo search
begin
case index of
0:result:=0;
1:result:=10;
2:result:=30;
3:result:=60;
4:result:=120;
5:result:=300;
6:result:=600;
7:result:=1800;
8:result:=3600 else result:=7200;
end;
end;

function combo_index_to_bitrate(index:integer):integer; //in synch a seconda dell'indice della combo search
begin
case index of
0:result:=0;
{1:result:=2000;
2:result:=1200;
3:result:=800;
4:result:=640;
5:result:=480;  }
1:result:=320;
2:result:=256;
3:result:=224;
4:result:=192;
5:result:=160;
6:result:=128;
7:result:=112;
8:result:=96;
9:result:=80;
10:result:=64;
11:result:=56;
12:result:=48;
13:result:=40;
14:result:=32;
else result:=24;
end;
end;

{function combo_to_mimetype(combo:ttntcombobox):byte;
begin
result:=0;
 case combo.itemindex of
  0:result:=0;
  1:result:=1;
  2:result:=5;
  3:result:=7;
  4:result:=6;
  5:result:=3;
  6:result:=8; //other 2956+
 end;
end; }

procedure delete_excedent_history(reg:tregistry;lista:tstringlist);
begin
 while lista.count>99 do begin
     reg.deletevalue(lista.strings[0]);
     lista.delete(0);
 end;
end;



procedure combo_add_languages(combo:tcombobox);
begin
with combo.items do begin
 beginupdate;
 clear;
 add('');
 add('abkhazian');
 add('afan');
 add('afaraa');
 add('afrikaans');
 add('albanian');
 add('amharic');
 add('arabic');
 add('armenian');
 add('assamese');
 add('aymara');
 add('azerbaijani');
 add('bashkir');
 add('basque');
 add('bengali');
 add('bhutani');
 add('bihari');
 add('bislama');
 add('breton');
 add('bulgarian');
 add('burmese');
 add('byelorussian');
 add('cambodian');
 add('catalan');
 add('chinese');
 add('corsican');
 add('croatian');
 add('czech');
 add('danish');
 add('dutch');
 add('english');
 add('esperanto');
 add('estonian');
 add('faeroese');
 add('fiji');
 add('finnish');
 add('french');
 add('frisian');
 add('galician');
 add('georgian');
 add('german');
 add('greek');
 add('greenlandic');
 add('guarani');
 add('gujarati');
 add('hausa');
 add('hebr');
 add('hindi');
 add('hungarian');
 add('icelandic');
 add('indonesi');
 add('interlingue');
 add('inuktit');
 add('inupiak');
 add('irish');
 add('italian');
 add('japanese');
 add('javanese');
 add('kannada');
 add('kashmiri');
 add('kazakh');
 add('kinyarwanda');
 add('kirghiz');
 add('kirundi');
 add('korean');
 add('kurdish');
 add('laothian');
 add('latin');
 add('latvian lettish');
 add('lingala');
 add('lithuanian');
 add('macedonian');
 add('malagasy');
 add('malay');
 add('malayalam');
 add('maltese');
 add('maori');
 add('marathi');
 add('moldavian');
 add('mongolian');
 add('nauru');
 add('nepali');
 add('norwegian');
 add('occitan');
 add('oriya');
 add('pashto pushto');
 add('persian');
 add('polish');
 add('portuguese');
 add('punjabi');
 add('quechua');
 add('rhaeto-romance');
 add('romanian');
 add('russian');
 add('samoan');
 add('sangro');
 add('sanskrit');
 add('scots gaelic');
 add('serbian');
 add('serbo-croatian');
 add('sesotho');
 add('setswana');
 add('shona');
 add('sindhi');
 add('singhalese');
 add('siswati');
 add('slovak');
 add('slovenian');
 add('somali');
 add('spanish');
 add('sudanese');
 add('swahili');
 add('swedish');
 add('tagalog');
 add('tajik');
 add('tamil');
 add('tatar');
 add('tegulu');
 add('thai');
 add('tibetan');
 add('tigrinya');
 add('tonga');
 add('tsonga');
 add('turkish');
 add('turkmen');
 add('twi');
 add('uigur');
 add('ukrainian');
 add('urdu');
 add('uzbek');
 add('vietnamese');
 add('volapuk');
 add('welch');
 add('wolof');
 add('xhosa');
 add('yiddish');
 add('yoruba');
 add('zhuang');
 add('zulu');
endupdate;
end;
end;

{procedure combo_add_history(combo:ttntcombobox;first:byte;second:byte);
var reg:tregistry;
lista:tstringlist;
str:string;
firststr,secondstr:string;
begin

case first of
 0:firststr:='gen';
 1:firststr:='audio';
 3:firststr:='software';
 5:firststr:='video';
 6:firststr:='document';
 7:firststr:='image';
 8:firststr:='other';
end;

case second of
 HISTORY_GENERAL:secondstr:='gen';
 HISTORY_TITLE:secondstr:='tit';
 HISTORY_AUTHOR:secondstr:='aut';
 HISTORY_ALBUM:secondstr:='alb';
 HISTORY_DATE:secondstr:='dat';
end;

reg:=tregistry.create;
try

with combo.items do begin
 beginupdate;
 clear;
reg.openkey(areskey+'Search.History\'+firststr+chr(46)+secondstr,true);

lista:=tstringlist.create;
reg.getvaluenames(lista);
reg.closekey;
reg.destroy;

 while (lista.count>0) do begin
  str:=hexstr_to_bytestr(lista.strings[0]);
  lista.delete(0);
   add(utf8strtowidestr(str));
 end;
  lista.free;

 if count>0 then begin
  Insert(0,GetLangStringW(PURGE_SEARCH_STR));
  insert(1,'');
 end else begin
  add(GetLangStringW(PURGE_SEARCH_STR));
  add('');
 end;

 endupdate;
end;
except
end;

end;}

{function add_tntcombo_history(combo:ttntcombobox):boolean;
  var i:integer;
begin
result:=false;
  for i:=0 to combo.items.count-1 do
    if Tnt_WideLowerCase(combo.text)=Tnt_WideLowerCase(combo.items.strings[i]) then begin
    exit;
    end;

combo.items.add(combo.text);
result:=true;
end; }

{procedure combo_add_categories(combo:TtntComboBox; mime:byte);
const
cat_audio:array[0..147] of widestring= ('acapella','acid','acid jazz','acid punk','acoustic','all','alternative',
                                        'alternrock','ambient','anime','avantgarde','ballad','bass','beat',
                                        'bebob','big band','black metal','bluegrass','blues','booty bass','britpop',
                                        'cabaret','celtic','chamber music','chanson','chorus','christian gangs','christian rap',
                                        'classic rock','classical','club','club-house','comedy','contemporary','country',
                                        'cristian rock','crossover','cult','dance','dance hall','darkwave','death metal',
                                        'disco','dream','drum & bass','drum solo','duet','easy listening','electronic',
                                        'ethnic','eurodance','euro-house','euro-techno','fast fusion','folk','folk/Rock',
                                        'folklore','freestyle','funk','fusion','game','gangsta','goa',
                                        'gospel','gothic','gothic rock','grunge','hard rock','hardcore','heavy metal',
                                        'hip-hop','house','humour','indie','industrial','instrumental','instrumental pop',
                                        'instrumental rock','jazz','jazz/funk','jpop','jungle','latin','lo-fi',
                                        'meditative','merengue','metal','musical','national folk','native american','negerpunk',
                                        'new age','new wave','noise','oldies','opera','other','polka',
                                        'polsk punk','pop','pop/funk','pop/folk','porn groove','power ballad','pranks',
                                        'primus','progressive rock','psychedelic','psychedelic rock','punk','punk rock','r&b',
                                        'rap','rave','reggae','retro','revival','rhythmic soul','rock',
                                        'rock & roll','salsa','satire','showtunes','ska','slow jam','slow rock',
                                        'sonata','soul','sound clip','soundtrack','southern rock','space','speech',
                                        'swing','symphonic rock','symphony','synthpop','tango','techno','techno-industrial',
                                        'terror','thrash metal','top 40','trailer','trance','tribal','trip-hop',
                                        'vocal');

cat_image:array[0..16] of widestring= ('animal & pets','architecture','art','cartoons','celebrity & idols',
                                       'colture & communities','erotica','familty','friends','funny home video',
                                       'history','homes','nature & landscapes','science & technology','sports & outdoors',
                                       'travel & vacations','vehicles & transportation');

cat_video:array[0..25] of widestring= ('action & adventure','anime','cartoon','classic','comedy',
                                       'commercial','documentary','drama','erotica','food',
                                       'horror & suspense','humor','kids & family','motors','music & musicals',
                                       'nature','news','science','science fiction & fantasy','series',
                                       'sports','talkshow','thriller','trailer','travel',
                                       'war');

cat_doc:array[0..63] of widestring=  ('adventure','architecture','art','autobiography','biography','biology',
                                      'business','chemistry','children','commerce','computing','cookery',
                                      'doctory','drawing','electronics','engineering','entertainment','erotica',
                                      'essay','fairytale','family','farming','fiction','food','gaming','gardening',
                                      'geography','grammar','guide','health','history','home','horrow','humour',
                                      'internet','language','law','letter','literature','mathematics',
                                      'medicine','memoir','music','mystery','nature','news','occultism',
                                      'parody','parenting','philosophy','physics','poetry','prophesy',
                                      'psychology','reference','religion','romance','science',
                                      'sport','summary','thriller','tourism','travel','tutorial');
                                      


cat_soft:array[0..30] of widestring= ('active x','animation','antivirus','browsers','business finance',
                                      'business taxes','cd burners','chat','drivers','file sharing',
                                      'games action','games arcade','games casino','games strategy','html editors',
                                      'image editing','internet','internet tools','java','mp3 & audio',
                                      'mp3 search','palm os','players','pocket pc','screensavers',
                                      'servers','site management','software editors','themes','video',
                                      'wallpaper');
var
i:integer;
begin
with combo.items do begin
 beginupdate;
 clear;
   add('');

   case mime of
     1:begin   //audio
        for i:=0 to 147 do add(cat_audio[i]);
      end;
     7:begin   //image
        for i:=0 to 16 do add(cat_image[i]);
      end;
      5:begin    //video
        for i:=0 to 25 do add(cat_video[i]);
      end;
      6:begin      //dec
        for i:=0 to 63 do add(cat_doc[i]);
      end;
      3:begin     //soft
        for i:=0 to 30 do add(cat_soft[i]);
      end;
     end;
 endupdate;
end;
end;
}
procedure combo_add_resolutions(combo:tcombobox);
begin
with combo.items do begin
 beginupdate;
 clear;
 add('');
 add('16x16');
 add('32x32');
 add('48x48');
 add('80x60');
 add('160x120');
 add('320x240');
 add('640x480');
 add('720x480');
 add('800x600');
 add('1024x768');
 add('1280x1024');
 add('2048x1536');
 endupdate;
end;
end;

procedure combo_add_bitrates(combo:tcombobox);
begin
with combo.items do begin
 beginupdate;
 clear;
 add('');
{ add('2000');
 add('1200');
 add('800');
 add('640');
 add('480'); }
 add('320');
 add('256');
 add('224');
 add('192');
 add('160');
 add('128');
 add('112');
 add('96');
 add('80');
 add('64');
 add('56');
 add('48');
 add('40');
 add('32');
 add('24');
 endupdate;
end;
end;

end.
