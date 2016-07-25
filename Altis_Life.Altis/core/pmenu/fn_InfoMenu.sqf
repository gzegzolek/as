private ["_start"];
_start = [_this,0,0,[0]] call BIS_fnc_param;

//InfoMenus
if(_start isEqualTo 0) exitWith {
disableSerialization;
createDialog "infoMenu";
switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};

_InfoMenus = ((findDisplay 41500) displayCtrl 2300);
lbClear _InfoMenus;

_InfoMenus lbAdd "Zasady";lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0.694,0.141,1]];
_InfoMenus lbAdd "Info"; lbSetValue [2300, (lbSize _InfoMenus)-1, 1];
_InfoMenus lbAdd "Admini"; lbSetValue [2300, (lbSize _InfoMenus)-1, 2];
_InfoMenus lbAdd "Klawisze"; lbSetValue [2300, (lbSize _InfoMenus)-1, 3];
_InfoMenus lbAdd "Regulamin podstawy"; lbSetValue [2300, (lbSize _InfoMenus)-1, 4];
_InfoMenus lbAdd "Informacje o modzie ,surowce itp"; lbSetValue [2300, (lbSize _InfoMenus)-1, 5];
_InfoMenus lbAdd "Zmiany"; lbSetValue [2300, (lbSize _InfoMenus)-1, 6];lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0,0.082,1]];

_InfoMenus lbSetCurSel 1;
};

//Infos
if(_start isEqualTo 1) exitWith {
private ["_index","_infoText"];
_index = ((findDisplay 41500) displayCtrl 2300) lbValue (lbCurSel 2300);
((findDisplay 41500) displayCtrl 2301) ctrlSetText lbText [2300, lbCurSel 2300];

if(_index isEqualTo 0) exitWith {};


_infoText = call {
//Server
if(_index isEqualTo 1) exitWith {
"AltisLand Best Server<br/>
<t color='#0099ff'>Nazwa:</t> [PL] Altisland BEST<br/>
<t color='#0099ff'>IP:</t> 149.202.65.190<br/>
<t color='#0099ff'>Port:</t>2352<br/><br/>
<t color='#0099ff'>Linki</t><br/>
<a href=''>Teamspeak 3: 51.254.132.75</a><br/>
<a href='http://www.altisland.pl'>Forum: altisland.pl</a><br/><br/>
Restart<br/>
<t color='#0099ff'>0:00, 04:00, 8:00, 12:00, 16:00, 20:00</t>
";
};

//Regeln
if(_index isEqualTo 2) exitWith {"Admini Acid, Arek, Veyron Castle<br/><a color='#0099ff' href='www.altisland.pl'>Rozączając się z serwera nieprzepisowo możesz stracić wszystko</a>"};

//Steuerung
if(_index isEqualTo 3) exitWith {
"<t color='#0099ff'>Y</t> Player Menu<br/>
<t color='#0099ff'>U</t> Otwieranie zamykanie pojazdów <br/>
<t color='#0099ff'>T</t> Bagażnik <br/>
<t color='#0099ff'>TAB</t> Rozmowa <br/>
<t color='#0099ff'>Windows</t> Menu interakcji <br/>
<t color='#0099ff'>Shift+G</t> Powalenie gracza <br/>
<t color='#0099ff'>Shift+P</t> Zatyczki do uszów <br/>
<t color='#0099ff'>Shift+B</t> Poddanie się <br/>
<t color='#0099ff'>Shift+R</t> Kajdanki>" ;

};

//Lizensen
if(_index isEqualTo 4) exitWith {
"<t color='#00ff00'>§1 
Wchodząc na serwer, gracz jest zobligowany do przestrzegania ReGuLaMiN'u Ogólnego 
§2 
Nieznajomość regulaminu, nie zwalnia z jego przestrzegania 
§3 
Za nieprzestrzeganie regulaminu grozi kara w postaci : 
	Kicka, 
	Bana Czasowego, 
	Bana Permanentnego, 
	Bądź w przypadku forum, usunięcia postu. 
§4 
Osoba, która dopuszcza się grożenia innym, bądź dokonuje fałszywych oskarżeń, będzie surowo ukarana. 

Art.2 - RDM/VDM/Trollowanie/Czat 

§1 
Osoba, która dopuszcza się losowych zabójstw na serwerze lub zabójstwa bez uzasadnienia, dokonuje RDM (Random DeathMatch). RDM jest ściśle zabroniony. 

§2 
Osoba, która celowo zabija innych graczy przy użyciu pojazdu, dopuszcza się VDM (Vehice DeathMatch), który jest zabroniony. Nie łamie regulaminu serwera ten, kto w wyniku wypadku lub losowego zdarzenia zabił drugiego gracza przy użyciu pojazdu. 

§3 
Gracz może jednorazowo użyć pojazdu w celu samoobrony, jednak na zasadach opisanych na poniższym przykładzie. 

Przykład: Gracz A jedzie ulicą {o dopuszczalnej prędkości), nagle dostrzega gracza B, który wychodzi na ulicę i celuję w jego kierunku. Gracz A postanawia nie zatrzymać pojazdu, w wyniku czego gracz B otwiera ogień. W tym momencie gracz A ma prawo przejechać gracza B. W przypadku gdy gracz A nie zabije gracza B, NIE ma prawa, nawrócić pojazdu i ponowić próby! 

§4 
Kto w sposób oczywisty przy pomocy zachowania lub słownictwa dopuszcza się trollingu może zostać ukarany banem czasowym bąd też i stałym. 

Przykłady trollingu : Krążenie samochodem w okół policjanta. Bieganie za policjantem bez powodu. 

Trolling zbiorowy, czyli utrudnianie pracy policji, będzie banem. 

§5 
Zabrania się używania komunikacji ustnej przy pomocy kanału strony (side channel). 

§6 
Zabrania się wykorzystywania wszelkich narzędzi umożliwiających podglądanie innego gracza jego pozycji na mapie (ghosting) w tym tzw. live stream. Prześladowanie przez dłuższy czas jest zabronione. 

§7 
Jedynym wyjątkiem zezwolenia KoS, czyli Killing on Sight są bliskie okolice nielegalnych stref (nielegalne pola, processingi, handlarze itp.)Strefy zaznaczone na czerwono na mapie. 


Art.3 - Rebelianci 

§1 
Za rebielianta uznaję się osobę, która działa w szeregach dobrze wyposażonej i dobrze zorganizowanej grupy zbrojnej. Celem rebelii jest destabilizacja sytuacji na serwerze. Jednak należy zwrócić uwagę, aby swą działalności nie doprowadzały do trwałej destabilizacji struktury i pracy policji. 

§2 
Rebelianci mają możliwość dokonania ataku na obiekt publiczny (np. miasto) pod warunkiem, że uprzedzili o swoich zamiarach policję i cywili. Wyjątek stanowi przeprowadzenie zasadzki przeciwko policji. 

§3 
Rebelia nie ma prawa polować na policję. Wyjątek stanowi organizacja zasadzki na pojazd policji. Warunkiem jednak jest natychmiastowe wycofanie się po dokonanym ataku/porwaniu policjanta. 

§4 
Rebelia ma prawo stosować helikoptery jako broń do dokonywania napadów rabunkowych. W przypadku tego typu ataku nie ma obowiązku informować o tym policji. Przy czym helikopter nie może zostać wykorzystany do taranowania innych pojazdów latajacych. 


Art.4 - Policja 

§1 
Policja ma prawo zatrzymać każdy pojazd do kontroli pod warunkiem, że ma ku temu powód 

§2 
Policja ma prawo organizować punkty kontrolne. Owy punkt musi być iznakowany przynajmniej jednym radiowozem. 

§3 
Policja ma prawo organizować blokady drogowe, celem zatrzymania pojazdu. Policja odpowiada za wszelkie szkody wśród osób postronnych spowodowane zastosowaniem kolczatki. 

§4 
Za spowodowanie śmierci niewinnego cywila policja winna jest mu wypłacić rekompensatę w wysokości 10 000 $. Za wszelkie inne szkody wyrządzone cywilą policja jest zobligowana do usunięcia ich oraz wypłacenia rekompensaty w wysokości 5 000 $. 

§5 
Policja ma prawo użyć paralizatora bez ostrzeżenia. 

§6 
Policja ma obowiązek wydać ustne ostrzeżenie oraz strzał ostrzegawczy przed użyciem broni ostrej. Wyjątek stanowi sytuacja gdy policjant stosuje broni w obronie własnej oraz gdy policja wdała się w konflikt z rebelią. 

§7 
W przypadku, gdy dany gracz popełnia przestępstwo większej wagi ( zabójstwo policjantów, zbrojny opór itp. ), stawia większy opór dla policji lub dochodzi do starcia Policji ze zorganizowaną grupą przestępczą (grupa od 3 osób wzwyż) - policja ma prawo do użycia wszelkich dostępnych środków by zatrzymać taką osobę/grupę. 


Art.5 - Pojazdy 

§1 
Zabrania się taranowania innych helikopterów. 

§2 
Zezwala się na taranowanie innych pojazdów, pod warunkiem posiadania odpowiedniego powodu. 

§3 
Zabrania się kradzieży pojazdu na zasadzie “Czekam aż gracz wyjdzie i wchodzę na miejsce kierowcy nim zamknie samochód”. Takie czyny będą karane banem 

§4 
Zabrania się wchodzienia na pozycję pasażera w celu wymuszemia podwiezienia lub kradzieży.


Art.6 - Wykroczenia niedopuszczalne 

§1 
Popełnianie samobójstwa w celu zniknięcia z listy poszukiwanych jest karane banem czasowym. 

§2 
GHOSTING, czyli przekazywanie informacji jako trup jest zabronione. 

§3 
Wykorzystywanie błędów w oprogramowaniu lub bugów. O wykrytych błędach należy informować administratorów. 

§4 
Ucieczka z więzienia w inny sposób niż wpłacenie kaucji lub pomoc innego gracza z użyciem helikoptera. 

§5 
Samobójstwo w momencie porażenia prądem lub zakucia w kajdanki. 

§6 
Współpraca z osobą która łamie regulamin serwera (np. przyjęcie dużej ilości gotówki, która jest owocem łamania regulaminu serwera). 

§7 
Używanie zhakowanych przedmiotów. 

§8 
Wykorzystywanie glitchy w grze. 

§9 
Zabronione jest wykorzystywanie błędów w skrypcie gry. Taki błąd należy zgłosić do admina. 

§10 
Zabronione jest wykorzystywanie cheatów 

§11 
BATTLELOG - czyli wylogowanie się podczas jakiejkolwiek akcji jest zabronione. 

Art.7 - Stany Wyjątkowe 

§1 
W przypadku destabilizacji sytuacji w Altis, policja ma prawo użyć środków wymiernych do swej obecnej siły i skali zagrożenia. 

§2 
Policja może ogłosić stan wyjątkowy (za pośrednictwem cywila lub poprzez smsa do cywili). W takim przypadku wszelkie przestępstwa przeciwko porządkowi, życiu i zdrowi będą karane podwójnie. Przy czym dla przykładu przemyt narkotyków, gdy nie jest powiązany z próbą ucieczki jest traktowany normalnie. Informacja o stanie wyjątkowym powinna być powtarzana co ok. 15 min. Policja ma prawo typować cywila, który za pośrednictwem SIDE CHAT’u będzie informował o tym zajściu pozostałych graczy. Samowolne ogłaszanie stanu wyjątkowego przez cywila grozi banem. Stan wyjątkowy może ogłosić policjant, który ma stopień kapitana. 

§3 
Uzbrojone lotnictwo policji może zostać użyte tylko za zgodą najwyższego przedstawiciela policji, który jest na służbie. 

§4 
W przypadku gdy pojazd latający odmawia lądowania, nie reaguje na sygnał dźwiękowy, ucieka lub nie wykonuje poleceń, policja ma prawo zestrzelić owy pojazd przy pomocy wszelkich dostępnych środków (wykluczając celowe zderzenie helikopter-helikopter). Przed otwarciem ognia, policja musi powiadomić podejrzany helikopter smsem o natychmiastowym nakazie lądowania. Jeżeli ścigany helikopter nie zastosuje się do wydawanych mu poleceń, policja powinna oddać strzały ostrzegawcze. Jeśli zostaną one zignorowane wówczas policyjny helikopter może otworzyć ogień w celu wymuszenia lądowania. 

§5 
Policja ma prawo użyć ciężkiego sprzętu lądowego podczas : 

a) Stanu wyjątkowego, 
b) napadu na bank, 
c) gdy przeciwnik dysponuje przewagą, 
d) podczas ataku terrorystycznego. 
e) próby zatrzymania pojazdu opancerzonego (ostrzeżenie sms) i neutralizacji wszelkiego zagrożenia z tym związanego. 


§6 
Podczas trwania stanu wyjątkowego, policja ma prawo aresztować każdego Cywila w danym regionie. 


Art.8 - Posiadłości 

§1 
Każdy cywil ma prawo do posiadania własnego domu oraz garażu. 

§2 
Nie można wykorzystywać domu do ucieczki przed wymiarem sprawiedliwości. 

§3 
Policja ma prawo wyłamać zamek w posiadłości, jeśli jej właściciel jest ścigany w związku z podejrzeniem dokonania przestępstwa i/lub nie reaguje na polecenie policji. 

§4 
Policja ma prawo wyłamać zamek w posiadłości i przeszukać budynek, jeśli istnieje uzasadnione podejrzenie dokonania przestępstwa. 

§5 
Policja nie ma prawa wyłamywać zamków i przeszukiwać losowych posiadłości.</t><br/>
" ;
};

if(_index isEqualTo 5) exitWith {
"Szukasz pracy policjanta medyka zapraszamy na ts.<br/><br/>
<t align='center' color='#0099ff'>W kryjówkach gangu można kupić bron bez licencji oraz przerabiać bez licencji nielegalki</t><br/><br/>
<t align='center' color='#0099ff'>W każdej kryjówce inne ale to już gracze muszą dojsć co i jak :)</t><br/><br/>
<t align='center' color='#0099ff'>Heba robi sie z lisci marichuany+dopalacze</t><br/><br/>
<t align='center' color='#0099ff'>c4 z prochu+magnez+guma kauczukowa</t><br/><br/>
<t align='center' color='#0099ff'>skrzynie robi się z diamentu+przerobione drzewo(2szt)+monety(2szt)</t><br/><br/>
<t align='center' color='#0099ff'>whisky z pszenicy,piwo z chmielu ,ciuchy z bawełny</t><br/><br/>
<t align='center' color='#0099ff'>reszte łatwo się domyśleć</t><br/><br/>
";
};

if(_index isEqualTo 6) exitWith {
"<t size='1.2px' align='center' color='#0099ff'>Ważne!!!</t><br/>
<t align='center' color='#0099ff'>Zginiesz poszukiwany tracisz licencje: gun, drive</t><br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>Idąc do więzienia tracisz licencje:</t><br/>
gun, driver, nielegalki, REBELKĘ!!!<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>Sugestie</t><br/>
Masz jakieś pomysły zapraszamy na TS i forum.";
};

};

//Add Infos
((findDisplay 41500) displayCtrl 2304) ctrlSetStructuredText parseText ("<t size='0.8'>" + _infoText);
};
[] spawn life_fnc_InfoMenu;
