# MavenSetup
A basic setup for all maven projects containing building and tools for java.

## Howto setup
1. Add the following to your pom.xml:
    ````xml
    <project>
        <parent>
            <groupId>works.reload</groupId>
            <artifactId>parent</artifactId>
            <version>1.0.2</version>
        </parent>

        <repositories>
            <repository>
                <id>reload-repo</id>
                <url>https://nexus.reloadkube.managedservices.resilient-teched.com/repository/reload/</url>
            </repository>
        </repositories> 
    </project>
    ````

## Maven Wrapper Note
As this setup enforces a minimum maven version,
it is not guaranteed that the maven version you have installed on your system is compatible with the project.
For that, a maven wrapper is recommended to be used.

It is strongly recommended to use the wrapper in any automated build process, as it ensures that the correct maven version is used.

## Adding resources to your jar
First of all, `scr/main/resources` is the default location for resources in a maven project,
and is already added to the jar in the parent pom.
The `build.resources` can not be used, as the merging with a parent pom actually overrides the resources from the parent pom.
Therefore, you need to use the `maven-resources-plugin`, to add more resources to the jar.
This is done by adding the following to your pom.xml:
```xml
<project>
	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-resources-plugin</artifactId>
				<configuration>
					<resources>
						<resource>
							<directory>MyResourceDir</directory>
						</resource>
					</resources>
				</configuration>
			</plugin>
		</plugins>
	</build>
</project>    
```
