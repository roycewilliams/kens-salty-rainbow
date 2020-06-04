
![Rainbow candy coated with sugar](/img/kens-salty-rainbow.jpg)

## Ken's Salty Rainbow ##

This is an archive of descrypt hashes for common passwords.

### Why? ###
Rainbow tables are largely dead for most password-cracking use cases (even for unsalted hashes). But as the historical salted hash, descrypt is a unique hybrid: slow enough to take time to exhaust, but fast enough (and truncated enough) to make naive lookup useful for the non-specialists (who are desperate and Googling).

This should illustrate to developers and IoT manufacturers that choosing descrypt has been a bad idea for some time - and will only get worse.

To be clear, descrypt was a pretty brilliant improvement when it was introduced, and I'm a [huge](https://www.techsolvency.com/passwords/ztex/) [fan](https://minnie.tuhs.org/pipermail/tuhs/2019-October/019125.html). But its time has passed.

### Interesting examples ###
* `fnRL/G5lXVMug:admin`
  * Some Palo Alto gear uses 'admin' as the default password, configured by default with the same salt every time

### Notes ###
* All *valid* salts for the original descrypt algorithm are used here. Some implementations of descrypt may use invalid characters in the salt.
* Because descrypt truncates passwords at eight characters, "actual" passwords (as intended by the person who chose them) may vary.

### References ###
* https://setuprouter.com/common-passwords/
* https://github.com/jeanphorn/wordlist
* https://github.com/danielmiessler/SecLists/tree/master/Passwords/Default-Credentials
* https://www.f5.com/labs/articles/threat-intelligence/spaceballs-security--the-top-attacked-usernames-and-passwords
