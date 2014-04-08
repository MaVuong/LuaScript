---------------CHUC NANG TRA TU DIEN O DAY----------------
function LKS_DidFinishLoad(_sendAppName)
	---mot thread ngam se duoc chay o day de lay thong tin User
	ctx = objc.context:create();
	print ("FINISH LOAD DATA: ".._sendAppName);
	_documentDir=_sendAppName;
end


function LKS_SOHA(strSed)
    ketquatrave= string.match(strSed, '<div id="content">.*<div class="qc_tratu_bt">')
    lks_ketquacut(ketquatrave,'"xong"');
end

function LKS_Vdict(strSed)
	strp1='src="http://pagead2.googlesyndication.com/pagead/show_ads.js"> </script> </div> ';
    ketquatrave= string.match(strSed, 'src="http://pagead2.googlesyndication.com/pagead/show_ads.js">.*<div class="clear"></div>');
	if string.len(tostring(ketquatrave)) > string.len(strp1) then
		ketquatrave=string.sub(ketquatrave,string.len(strp1),string.len(ketquatrave));
	end
	
    print (tostring(ketquatrave));
    dodai=string.len(tostring(ketquatrave));
    if dodai<10 then
        ketquatrave='Not Found Data';
    end

    lks_ketquacut(ketquatrave,'"xong"');
end

function LKS_WikiDict(strSed)
	strSed=strSed:gsub("<script(.-)</script>","")
    str1='<span class="mw-headline"';
    str2=[[<div id="page-secondary-actions">]];
    print (_VERSION);
    v1=string.find(strSed,str1,1 ,true);
    v2=string.find(strSed,str2,1 ,true);
    --print("v1:",v1);
    --print("v2:",v2);
    ketquatrave = string.sub(strSed, v1, v2-1);
    dodai=string.len(tostring(ketquatrave));
      if dodai <10 then
        ketquatrave="Error";
      end
    lks_ketquacut(ketquatrave,'"xong"');
end
function LKS_WikiPedia(strSend)
	strSend=tostring(strSend);
	str1='<div id="content" class="content" lang="en" dir="ltr">';
	str2='<div id="page-secondary-actions">';
	v1=string.find(strSend,str1);
	v2=string.find(strSend,str2);
	print(v1);
	print(v2);
	ketquatrave = string.sub(strSend, v1, v2);
	
	ketquatrave=ketquatrave:gsub("<img(.-)>","")

	dodai=string.len(tostring(ketquatrave));
	 if dodai <10 then
    	  ketquatrave="Error";
  	end
	--print(tostring(ketquatrave))  ;
	lks_ketquacut(ketquatrave,'"xong"');
end
-----------------FUNCTION LAY LINK TU CAC NGUON--------------

function getURLTraTuShoHa(tratu_)
	t = {}
	for k, v in string.gmatch(tratu_, "(%w+)=(%w+)") do
	   t[k] = v
	end

	local _tukhoa=t["tukhoa"];
	local _adict=t["adict"];

	print(_tukhoa,_adict);
	
	local _ev="en_vn";
	if _adict =="NO" then
		_ev="vn_en";
	end
	local _strurl="http://m.tratu.soha.vn/?title=".._tukhoa.."&dict=".._ev;
	lks_ketquacut(_strurl);
end

function getURLWikiDict(tratu_)
	t = {}
	for k, v in string.gmatch(tratu_, "(%w+)=(%w+)") do
	   t[k] = v
	end

	local _tukhoa=t["tukhoa"];
	local _adict=t["adict"];

	print(_tukhoa,_adict);
	
	local _ev="en";
	if _adict =="NO" then
		_ev="vi";
	end
	local _strurl="http://".._ev..".m.wiktionary.org/wiki/".._tukhoa
	lks_ketquacut (_strurl);
end


function getVdict(tratu_)
	t = {}
	for k, v in string.gmatch(tratu_, "(%w+)=(%w+)") do
	   t[k] = v
	end

	local _tukhoa=t["tukhoa"];
	local _adict=t["adict"];

	print(_tukhoa,_adict);
	
	local _ev="1";
	if _adict =="NO" then
		_ev="2";
	end
	local _strurl="http://vdict.com/".._tukhoa..",".._ev..",0,0.html"
	lks_ketquacut (_strurl);
end


function getFeedTraTuOnline()
	local _strRT='[ {"tentrang":"Vdict","FN_getURL":"getVdict","FNGetHTML":"LKS_Vdict"}, {"tentrang":"tra từ soha","FN_getURL":"getURLTraTuShoHa","FNGetHTML":"LKS_SOHA"}, {"tentrang":"Wiki-Dict","FN_getURL":"getURLWikiDict","FNGetHTML":"LKS_WikiDict"} ]';
	lks_ketquacut (_strRT.."AAA");
end




























