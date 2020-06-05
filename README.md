
![Rainbow candy coated with sugar](/img/kens-salty-rainbow.jpg)

## `ken`'s Salty Rainbow ##

`ken`'s Salty "Rainbow" is a search-engine-discoverable archive of [descrypt](https://en.wikipedia.org/wiki/Crypt_(C)#Traditional_DES-based_scheme) (traditional Unix DES crypt) hashes for common passwords - especially default passwords, temporary passwords, and generic operational/lab/development passwords.

### Why? ###
Rainbow tables are largely dead for most password-cracking use cases (even for *unsalted* hashes).

But as the historical (and historic) salted hash, descrypt is a unique hybrid: slow enough to take time to exhaust, but fast enough (and truncated enough) to make naive lookup useful for the non-specialists (who are desperate and Googling).

The descrypt hash format also still seems to be the default for a number of embedded platforms.

This all means that descrypt is perhaps the only standard *salted* hash for which a rainbow table (or other lookup) might still be useful - hence the name.

This repository illustrates - to developers, embedded platform architects, and IoT manufacturers - that choosing descrypt has been a bad idea for some time ... and will only get worse.

(And to be clear, I think that descrypt was a pretty brilliant improvement when it was introduced, and I'm a [huge](https://www.techsolvency.com/passwords/ztex/) [fan](https://minnie.tuhs.org/pipermail/tuhs/2019-October/019125.html). But its time has passed.)

### Interesting examples ###
* `fnRL/G5lXVMug:admin`
  * Some Palo Alto gear uses 'admin' as the default password, configured by default with the same salt every time

### Notes ###
* All *valid* salts for the original descrypt algorithm are used here. Some implementations of descrypt may use invalid characters in the salt.
* Because descrypt truncates passwords at eight characters, "actual" passwords (as intended by the person who chose them) may vary.
* Yes, I know that this isn't actually a rainbow table. That would be massive overkill for this use case. Instead, we harness the power of search-engine indexing of GitHub.

### References ###
* https://setuprouter.com/common-passwords/
* https://github.com/jeanphorn/wordlist
* https://github.com/danielmiessler/SecLists/tree/master/Passwords/Default-Credentials
* https://www.f5.com/labs/articles/threat-intelligence/spaceballs-security--the-top-attacked-usernames-and-passwords
