# DDNS-Freenom
- The recon.md file has full request schema for interacting with freenom. (since I don't know markdown very well, please view the file in raw mode)
- See ./Flow.md for the implementation flow.
- The implementation will be probably in bash.

---

### Setup
- Setup port-forwarding and local static IP Allocation on your router
- Point 80 and 443 to your severs local IP (192.168.1.X) (and 22 or 23 if you need ssh or telnet respectibely)
- Run the following script on your sever with cronTab as a seperate process
- Congratulations! Your domain should now be redirecting traffic to your home server!
