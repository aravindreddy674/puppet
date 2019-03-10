Download the code:
	
	# Start the VMs (Change the VM names)
	$ vagrant up
	$ vagrant status

Master:
	$ vagrant ssh vm1

	# within the puppet master
	$ sudo -i

	# Verify the installation
	$ cat /etc/hosts
	$ systemctl status ntpd
	
	# Start the puppet server
	$ puppet resource service puppetserver ensure=running
				or
	$ systemctl start puppetserver

	# Check the puppet agent command successfully executing or not
	$ puppet agent -t

Agent:
	$ vagrant ssh puppet-agent
	$ sudo -i

	# Verify the installation
	$ cat /etc/hosts
	$ systemctl status ntpd

	# Check the puppet agent command successfully executing or not
	$ puppet agent -t

Master:
	# sign the certificate
	$ puppet cert list
	$ puppet cert sign puppet-agent

Agent:
	# check the puppet agent communication to the server
	$ puppet agent -t

===============================================

Demo: The different Options of Puppet command
	Examples
	$ puppet help
	$ puppet man apply
	$ puppet describe --list (Lists all the resource types)
	$ puppet describe user | less
	$ puppet resource file /tmp/somefile
	$ puppet resource -e file /tmp/somefile (edit the file in vi)
--------------------------------------------------

Understanding Certificates:
----------------------------
	# The certification Location
	$ cd /etc/puppetlabs/puppet/ssl
	$ find .
	
Working with Certificates:
--------------------------
	# Revoking the certificate:
	# on VM 1 (master)
	$ puppet cert revoke vm2....
	# Restart the Puppet server
	# Stop the puppet server
	$ puppet resource service puppetserver ensure=stopped
	# Start the puppet server
	$ puppet resource service puppetserver ensure=running
	
	# on VM 2 (puppet agent)
	$ puppet agent -t (It will get failed)

	# on VM 1(master)
	$ puppet cert list --all (VM 2 is in revoke status)
	# Clean the certificate of VM 2
	$ puppet cert clean puppet-vm2...

	# on VM 2 (puppet agent)
	# Clean the ssl directory
	$ ssl> rm -rf *
	$ find .
	$ puppet agent -t

	# on VM 1(master)
	$ puppet cert list
	$ puppet cert sign vm2....

	# on VM 2 (puppet agent)
	# check the agent status
	$ puppet agent -t

=============================================================

Demo 1:

	# Puppet command to verify the resource
	$ puppet resource file /tmp/first
	$ puppet resource file /tmp/first > file.pp
	# Demo Ex: file.pp

	# Demo Ex: file_1.pp
	$ puppet apply file_1.pp

	# Creating Multiple Files with Iteration and conditions
	# Demo Ex: file_2.pp
	$ puppet apply file_2.pp

=========================================================

Managing Files, Directories, and Links:

Demo: file_dir.pp
Demo: file_dir_link.pp

Demo: package
Demo: Service

Going deeper into the DSL?
---------------------------
Demo Metaparameters:
--------------------	
	Demo Schedule:

		$ puppet apply schedule.pp
		
	Demo Before and Require:

		$ puppet apply require.pp
		
	Demo ‘notify’ and ‘subscribe’:

	Scenario 1: Subscribe

		$ puppet apply notify.pp
		Output: It creates a file and executes the service
		# Re execute it, there is no change
		# edit the file /tmp/config and change the content.

	Scenario 2: notify		

		$ puppet apply notify.pp
		Output: It executes the service	

=============================================================
Executing System Commands:
---------------------------
	Demo:
	
  	$ puppet apply exec.pp

 =================================================================
