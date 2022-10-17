###  Useful Endpoints
BASE_URL = "https://my.freenom.com"
clientArea ="/clientarea.php"
login_url ="/dologin.php"
dns_manage_url ="/clientArea?managedns=$freenom_domain_name&domainid=$freenom_domain_id"
logout_url ="/logout.php"

---

# Login [Works: Y]
curl 'https://my.freenom.com/dologin.php' -H 'authority: my.freenom.com' --data-raw 'token=<token here>8&username=<email here>&password=<your pswd here>' [POST]

 ### Response Headers -
  - sets cookies
  - uses them as AUTH for sustained AUTH in the clientArea
  - tells the redirect location with the "location" header
  
 ### Response - 
  302 to clientArea endpt.
  
 ### Not yet figured out
  - What is the token here?
  
  ### The 302 of the above script (not required to us though) 
  curl 'https://my.freenom.com/clientarea.php' -H 'cookie: <cookies from the login endpt here><write semicolon seperated keyvalue pairs> [200, GET]

---
  
# Domain Panel (unnecessary to us)
curl 'https://my.freenom.com/clientarea.php?action=domains' -H 'authority: my.freenom.com' -H 'cookie: <cookies here> [200, GET]

---
  
# A Domain Specific (unnecessary to us)
curl 'https://my.freenom.com/clientarea.php?action=domaindetails&id=<uniqueDomainId>' -H 'authority: my.freenom.com' -H 'cookie: <cookies here> [200, GET]
  - I don't know from where is it fetching the <uniqueDomainId>, you'd have to add it manually for now
  
---
  
# Open DNS Panel for that domain (not fully neccesary for us to load) [FREENOM DNS]
curl 'https://my.freenom.com/clientarea.php?managedns=<your freenom gTLD without http/https >&domainid=<uniqueDomainId>' -H 'authority: my.freenom.com' -H 'cookie: <cookies here> [200, GET]
  
  ### NOTE - 
    - Please ensure that your domain is using the default freenom name servers before trying to use Freenom DNS
    - You can change the default name servers by performing a POST request before trying to use Freeenom DNS
    - curl 'https://my.freenom.com/clientarea.php?action=domaindetails' -H 'authority: my.freenom.com' -H 'accept:                      text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'cookie: <cookies here> --data-raw 'token=<some token here>&id=<yourDomainId here>&sub=savens&nschoice=default&ns1=&ns2=&ns3=&ns4=&ns5=' [200, POST]
  
---
  
# Actual Changing of DNS Records [302, POST] (ADD)
curl 'https://my.freenom.com/clientarea.php?managedns=<domainName>&domainid=<your domain id here>' -H 'authority: my.freenom.com' -H 'content-type: application/x-www-form-urlencoded' -H 'cookie: <cookies here> --data-raw 'token=<someTokenHere>&dnsaction=add&addrecord%5B0%5D%5Bname%5D=&addrecord%5B0%5D%5Btype%5D=A&addrecord%5B0%5D%5Bttl%5D=3600&addrecord%5B0%5D%5Bvalue%5D=<theNewIpHere>&addrecord%5B0%5D%5Bpriority%5D=&addrecord%5B0%5D%5Bport%5D=&addrecord%5B0%5D%5Bweight%5D=&addrecord%5B0%5D%5Bforward_type%5D=1'
  
  - URL decoded form data
        - token: <tokenHere>
        - dnsaction: add
        - addrecord[0][name]: 
        - addrecord[0][type]: A
        - addrecord[0][ttl]: 3600
        - addrecord[0][value]: <theNewIpHere>
        - addrecord[0][priority]: 
        - addrecord[0][port]: 
        - addrecord[0][weight]: 
        - addrecord[0][forward_type]: 1
  
---
  
# Actual Changing of DNS Records [302, POST] (MODIFY)
curl 'https://my.freenom.com/clientarea.php?managedns=<domainName>&domainid=<your domain id here>' -H 'authority: my.freenom.com' -H 'content-type: application/x-www-form-urlencoded' -H 'cookie: <cookies here> --data-raw 'token=<someTokenHere>&dnsaction=modify&records%5B0%5D%5Bline%5D=&records%5B0%5D%5Btype%5D=A&records%5B0%5D%5Bname%5D=&records%5B0%5D%5Bttl%5D=3600&records%5B0%5D%5Bvalue%5D=<theNewIpHere>'
   
  - URL decoded form data
        - token: <tokenHere>
        - dnsaction: modify
        - records[0][line]: 
        - records[0][type]: A
        - records[0][name]: 
        - records[0][ttl]: 3600
        - records[0][value]: <newIpHere>
