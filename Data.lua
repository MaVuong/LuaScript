
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

