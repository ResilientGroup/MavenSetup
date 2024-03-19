# MavenSetup
A basic setup for all maven projects containing building and tools for java.

## Howto setup
1. Add the following to your pom.xml:
    ````xml
    <project>
        <parent>
            <groupId>works.reload</groupId>
            <artifactId>parent</artifactId>
            <version>1.0.0</version>
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
