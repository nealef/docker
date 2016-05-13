# puppet server
Docker image for puppet server

## Origin of Work
Derived from the work of [Nick McSpadden](https://github.com/nmcspadden). Materials in his [Github Repository](https://github.com/macadmins/docker-puppetmaster)

## Notes

Autosigning is turned *on* in puppet.conf.

In addition, ```confdir``` is ```/opt/puppet/``` and ```vardir``` is ```/opt/varpuppet/```, and both the ```confdir``` and ```vardir``` are marked as data volumes in the Dockerfile.  This makes it easy to use data-only containers.

Container runs puppet v4 so v3 clients will not be able to connect.

To use this container:
---

1. Make a data-only container first, so you can destroy the puppetmaster container without losing certs or other configuration data:
`docker run -d --name puppet-data --entrypoint /bin/echo brunswickheads/puppet-4.2.1-s390x`
2. Create the puppetmaster server container:
`docker run -d --name puppetmaster -h puppet -p 8140:8140 --volumes-from puppet-data brunswickheads/puppet-4.2.1-s390x`
3. **Important** - copy the configuration data to the data volume mount point: 
`docker exec puppetmaster cp -Rf /etc/puppet /opt/`
3. To see list of certs: 
`docker exec puppetmaster puppet cert list -all`
4. To test on a client:
	1. Install Puppet, Hiera, Facter, and Puppet LaunchDaemon onto client
	2. Add the IP of your Docker host to /etc/hosts (or configure DNS so that your Docker host is reachable at "puppet").  For example:  
		"10.0.0.1	puppet"
	3. Test puppet on client running as root:  
		`# puppet agent --test`  
		You should see the cert request being generated and autosigned:
```
Info: Creating a new SSL key for clefos7x.devlab.sinenomine.net
Info: Caching certificate for ca
Info: csr_attributes file loading from /etc/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for clefos7x.devlab.sinenomine.net
Info: Certificate Request fingerprint (SHA256): 72:04:4D:47:B7:64:78:BF:A9:05:8A:86:E0:17:C8:A8:FC:16:B6:C7:19:E6:AC:48:A8:CE:93:2E:B8:A2:D3:D6
Info: Caching certificate for clefos7x.devlab.sinenomine.net
Info: Caching certificate_revocation_list for ca
Info: Caching certificate for ca
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for clefos7x.devlab.sinenomine.net
Info: Applying configuration version '1463171160'
Info: Creating state file /var/lib/puppet/state/state.yaml
Notice: Applied catalog in 0.24 seconds
```
5. Verify cert signing on puppetmaster docker container:  
	`docker exec puppetmaster puppet cert list -all`
6. On the client, run:  
	`# puppet agent --test` again to verify that cert exists and was confirmed.
7. To create manifests, place them in /opt/puppet/manifests/.
