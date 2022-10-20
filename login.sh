#!/bin/bash
session=$(curl -sD - 'https://my.freenom.com/dologin.php' -H 'authority: my.freenom.com' --data-raw 'token=8&username=userName&password=pswd');
echo $session;
