
![Rainbow candy coated with sugar](/img/kens-salty-rainbow.jpg)

## `ken`'s Salty Rainbow ##

`ken`'s Salty "Rainbow" is a search-engine-discoverable archive of <!-- counter --> 3643 <!-- endcounter --> [descrypt](https://en.wikipedia.org/wiki/Crypt_(C)#Traditional_DES-based_scheme) (traditional Unix DES crypt) hashes for common passwords - especially default passwords, temporary passwords, and generic operational/lab/development passwords.

### Why? ###
Rainbow tables are largely dead for most password-cracking use cases (even for *unsalted* hashes).

But as the historical (and historic) salted hash, descrypt is a unique hybrid: slow enough to take time to exhaust, but fast enough (and truncated enough) to make naive lookup useful for non-specialists (who are desperate and Googling).

The descrypt hash format also still seems to be the default for a number of embedded platforms.

This all means that descrypt is perhaps the only standard *salted* hash for which a rainbow table (or other lookup) might still be useful - hence the name.

This repository should illustrate - to developers, embedded platform architects, and IoT manufacturers - that choosing descrypt has been a bad idea for some time ... and will only get worse.

(And to be clear, I think that descrypt was a pretty brilliant improvement when it was introduced, and I'm a [huge](https://www.techsolvency.com/passwords/ztex/) [fan](https://minnie.tuhs.org/pipermail/tuhs/2019-October/019125.html). But its time has passed.)

### Interesting examples ###
* `fnRL/G5lXVMug:admin`
  * Some Palo Alto gear uses 'admin' as the default password, configured by default with the same salt every time

### Notes ###
* All 4096 *valid* salts for the original descrypt algorithm are used here. Some implementations of descrypt may use invalid characters in the salt.
* Because descrypt truncates passwords at eight characters, "actual" passwords (as intended by the person who chose them) may vary.
* Yes, I know that this isn't actually a rainbow table. That would be massive overkill for this use case. Instead, we harness the power of search-engine indexing of GitHub. I just couldn't pass up the name.

### Related work
* 'password' as many unsalted hashes:
  https://gist.github.com/roycewilliams/5e8d676ac4fe54fb7b6cb233b0721f57

* 'password' hashed with the first 10,000 rounds of MD5:
  https://gist.github.com/roycewilliams/794e4d7a81e7840deae29fdc7c03fa10

* Common season+year+special passwords, major unsalted hashes:
  https://gist.github.com/roycewilliams/1603d23a4c5d3eda44fae348f6e0e954

### References ###
* https://setuprouter.com/common-passwords/
* https://github.com/jeanphorn/wordlist
* https://github.com/danielmiessler/SecLists/tree/master/Passwords/Default-Credentials
* [F5 attack article](https://www.f5.com/labs/articles/threat-intelligence/spaceballs-security--the-top-attacked-usernames-and-passwords)
* [F5 IoT article](https://www.f5.com/labs/articles/threat-intelligence/the-hunt-for-iot--multi-purpose-attack-thingbots-threaten-intern)
* [WrenSecurity opendj password-with-all-crypt-salts.txt](https://github.com/WrenSecurity/wrends/blob/master/opendj-server-legacy/tests/unit-tests-testng/resource/password-with-all-crypt-salts.txt)
* https://datarecovery.com/rd/default-passwords/
* https://en.wikipedia.org/wiki/List_of_the_most_common_passwords
* https://www.openwall.com/passwords/wordlists/password-2011.lst
* https://github.com/rapid7/metasploit-framework/blob/master/data/wordlists/default_pass_for_services_unhash.txt
* [Kali Hydra list](https://gitlab.com/kalilinux/packages/hydra/blob/kali/master/dpl4hydra_full.csv)
* [NCCGroup 2010 descrypt rainbow-table article](https://www.nccgroup.com/us/about-us/newsroom-and-events/blog/2010/december/rainbow-tables-for-unix-des-crypt3-hashes/)
* [Ars Technical article](https://arstechnica.com/information-technology/2019/10/forum-cracks-the-vintage-passwords-of-ken-thompson-and-other-unix-pioneers/)
* [john-users 2015 thread on rainbow tables](https://www.openwall.com/lists/john-dev/2015/06/25/8)
