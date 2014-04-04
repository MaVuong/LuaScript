
function LKS_SOHA(strSed)
    ketquatrave= string.match(strSed, '<div id="content">.*<div class="qc_tratu_bt">')
    lks_ketquacut(ketquatrave,'"xong"');
end

function LKS_Vdict(strSed)
    ketquatrave= string.match(strSed, 'src="http://pagead2.googlesyndication.com/pagead/show_ads.js">.*<div class="clear"></div>');
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






