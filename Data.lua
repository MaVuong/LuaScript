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
	ketquatrave=string.sub(ketquatrave,string.len(strp1),string.len(ketquatrave));
    print (tostring(ketquatrave));
    dodai=string.len(tostring(ketquatrave));
    if dodai<10 then
        ketquatrave='Error HTML';
    end

    lks_ketquacut(ketquatrave,'"xong"');
end

function LKS_WikiDict(strSed)
    str1='Cách phát âm';
    str2='<div class="NavContent">';
    print (_VERSION);
    v1=string.find(strSed,str1);
    v2=string.find(strSed,str2);
    print(v1);
    print(v2);
    ketquatrave = string.sub(strSed, v1+102, v2-1);
    print(tostring(ketquatrave))  ;
    

    dodai=string.len(tostring(ketquatrave));
      if dodai <10 then
        ketquatrave="Error";
      end
    lks_ketquacut(ketquatrave,'"xong"');
end


function LKS_WikiPedia(strSend)
	str1='<div id="content" class="content" lang="en" dir="ltr">';
	str2='<div id="page-secondary-actions">';
	v1=string.find(strSend,str1);
	v2=string.find(strSend,str2);
	print(v1);
	print(v2);
	ketquatrave = string.sub(strSend, v1, v2);
	print(tostring(ketquatrave))  ;


	dodai=string.len(tostring(ketquatrave));
	 if dodai <10 then
    	  ketquatrave="Error";
  	end
	lks_ketquacut(ketquatrave,'"xong"');
end








---------------TEST FUNCTION----------------
function LKS_LoadDataFromURLviaPOST_TEST(thamso)
	_content_type ="application/x-www-form-urlencoded";---[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"] content_type la tham so mac dinh
	_bodyData="grant_type=client_credentials&client_id=LEKHACSONABC&client_secret=SAJn%2Bytel%2FJG6JFUgATs79qZVJ8oC3KgN8KIdya4UfA%3D&scope=http://api.microsofttranslator.com";--- data nay se duoc post di
	_urlRequest="https://datamarket.accesscontrol.windows.net/v2/OAuth2-13";
	_nextFunC="khonglamgica";--- ten function tiep theo ma user muon nhan de truyen tham so
	print(thamso);
	lks_fnPostHTTP(_urlRequest,_nextFunC,_bodyData,_content_type)
end


function LKS_LoadDataFromURLviaGT_TEST(thamsoURL)
	_urlRequest="http://dantri.com.vn";
	_nextFunc="HienThiThongTin"
	print ("vao day"..thamsoURL);
	lks_fnGetHTTP(_urlRequest,_nextFunc);
end

function HienThiThongTin(_strhienthi)
	print("ket qua tra ve la: ".._strhienthi);
	
end

function TEST_SHOWALERT(title)
	
	--local f,err = io.open(_documentDir.."/testo.txt","w")
	--if not f then return print(err) end
	--f:write("text string written to file testo.txt")
	--f:close()
	
	
	
	--local alertview = ctx:wrap(objc.class.UIAlertView)("alloc")("init");
	--alertview("setTitle:", "FUCK YOU");
	--alertview("setMessage:", "Do You Like?");
	--alertview("addButtonWithTitle:","YES! i Like :)");
	--alertview("show");
	
	--local str_=ctx:wrap(objc.class.NSString)("stringWithFormat:","He he he eh");
	--str_("writeToFile:atomically:encoding:error:",_documentDir.."/lua_abc.txt",true,4,nil);
end



function TEST_OPENWEBVIEW(title)
	
	local application = ctx:wrap(objc.class.UIApplication)("sharedApplication")("delegate");
	local windows=application("window");
	local lbb=windows("viewWithTag:", 100);
	lbb("setText:","chao cai noi");
end


























