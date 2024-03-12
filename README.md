# MavenSetup
A basic setup for all maven projects containing a build and tools for java.

## Howto setup
1. Execute the following command in the root directory of your project:
	```bash
	git submodule add --name MavenSetup git@github.com:ResilientGroup/MavenSetup.git .mvn
	# or if you have a fork under your namespace
	git submodule add --name MavenSetup ../MavenSetup.git .mvn
	``` 
2. Add the `branch = .` line to your .gitmodules file for the MavenSetup submodule. It should look like this:
	```properties
	[submodule="MavenSetup"]
		path = .mvn
		url = ../MavenSetup.git
		branch = .
	```
3. Add the following to your pom.xml:
	````xml
	<project>
		<parent>
			<groupId>works.reload</groupId>
			<artifactId>base</artifactId>
			<version>1.0.0</version>
			<relativePath>.mvn/Base/pom.xml</relativePath>
		</parent>
 
		<modules>
			<module>.mvn/Base</module>
			<!-- Add your modules here -->
		</modules>
	</project>
	````

## Maven Wrapper Note
As this setup enforces a minimum maven version,
it is not guaranteed that the maven version you have installed on your system is compatible with the project.
For that, a maven wrapper is included in the setup.
This means you can use the `.mvn/mvnw` command instead of `mvn` to execute maven commands.

It is strongly recommended to use the wrapper in any automated build process, as it ensures that the correct maven version is used.
