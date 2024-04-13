#!/bin/bash
echo  -e "                  
                  .;clc:,..                   
              'cx0XKKKK0Oxdl:;'.              
           'oKXKKKKXXXKXKK0Odocc:,.           
         .xXNXKXKKKXKK0XKXKO0dolccc,          
        cNWNNNN0KKN00kXOXKKkKdOldccc:.        
      .xNNXXXN0NkWX0KONON0KxNx0oxkcclc.   ... 
    .cONNKK0XkNkONkkk0K0N0kxXo0dxkk:llc ....  
    ,kX0O0kKoX0cXkcO:KkKNOoO0ooxxoOl:c' ....  
   :xxOOKxXddXd:Xc:dcKl0KdcOcx:xdold:c. ...   
      lKOxOldO:okco:ox;kxcdc:o,dlx;o:c' ...   
     :KOxdk::c,,.'lc0o:lo:c::c,lco;:cc;. ..   
     kc'klkl;cdkl:;oOdc;c;;',,c:c:;;c:,;.     
    .  ,':oOodXNNNNNNXkKx:...l,',;,c:,:'.     
        ;c:;cl0WWWWWWWNXNXK00xl:c'c:;' :      
       ..:c::xXWXWWWWNx0NNXXKxo,: ;:.         
       .:ccc::0WN0NWWNXXNXXKko;'              
            . ;dXNKXK00XK0xl..:;'.            
              .dlxKX0Oxc;',x0XXX0Od.          
              .',,,,,..  dNWWWWNX0ko          
           .:kNOc ....:.oWWMMMWWNKOx.         
  ,cdxxkO0KNKK0d.cdxOXc,XWWWMMMWNXOxc         
oWMMMMMMWWNNNXd.lKNNNo;cWWWKWMWWNX0xo         
cKMMWMMMWWNNXk.,KNWK::;:NNNkNWWWNX0kd.

\e[32m"

read -p "Email -: " check_Email

headers=$(cat <<EOF
{
    "Vaar-Header-App-Build-Version": "1.0.0",
    "Content-Type": "application/json;charset=UTF-8",
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36",
    "Accept": "application/json, text/plain, */*",
    "Host": "identityprotection.avast.com",
    "Accept-Encoding": "gzip, deflate",
    "Vaar-Version": "0",
    "Vaar-Header-App-Product-Name": "hackcheck-web-avast"
}
EOF
)

data=$(cat <<EOF
{
    "emailAddresses": [
        "$hack_Email"
    ]
}
EOF
)

request_object=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -H "$headers" \
    -d "$data" \
    'https://identityprotection.avast.com/v1/web/query/site-breaches/unauthorized-data'
)

echo "$request_object"
