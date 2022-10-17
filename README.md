# DDNS-Freenom
- The recon.md file has full request schema for interacting with freenom. (since I don't know markdown very well, please view the file in raw mode)
- See ./Flow.md for the implementation flow.
- The implementation will be probably in bash.

---

### Important Note -
- Since the minimum TTL for freenom is 300 (5 minutes) the worst case scenario for your website would be (yourUpdateTime+ 5 minutes)
- i.e. say you run the script every 5 seconds, your worst case down time is 5.083 minutes
- If you own an actual TLD (which is compatible with whoIs) then please just use cloudlflare, it has a minimum TTL of 60 seconds for non-enterprise connections and 30 for otherwise!

---
### Setup
- Setup port-forwarding and local static IP Allocation on your router
- Point 80 and 443 to your severs local IP (192.168.1.X) (and 22 or 23 if you need ssh or telnet respectibely)
- Run the following script on your sever with cronTab as a seperate process
- Congratulations! Your domain should now be redirecting traffic to your home server!
