# Karate FrameWork

## Test Automation Made `Simple.`

<div> 
  <a href="https://github.com/karatelabs/karate/wiki/Support">
    <img src="https://img.shields.io/badge/support-wiki-red.svg"/>
  </a>
  <a href="https://twitter.com/getkarate">
    <img src="https://img.shields.io/badge/@getkarate--lightgrey?logo=twitter&amp;style=social">
  </a>
  <a href="https://github.com/karatelabs/karate/stargazers">
    <img src="https://img.shields.io/github/stars/karatelabs/karate?style=social"/>
  </a>
</div>
<div>
  <a href="https://central.sonatype.com/namespace/com.intuit.karate">
    <img src="https://img.shields.io/maven-central/v/com.intuit.karate/karate-core.svg"/>
  </a>
  <a href="https://github.com/karatelabs/karate/actions?query=workflow%3Amaven-build">
    <img src="https://github.com/karatelabs/karate/workflows/maven-build/badge.svg"/>
  </a>
  <a href="https://github.com/karatelabs/karate/releases">
    <img src="https://img.shields.io/github/release/karatelabs/karate.svg"/>
  </a>
</div>

<a><img src="karate-core/src/test/resources/karate-map.jpg" height="650" /></a>

Karate is the only open-source tool to combine API test-automation, [mocks](karate-netty), [performance-testing](karate-gatling) and even [UI automation](karate-core) into a **single**, *unified* framework. The syntax is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

There's also a cross-platform [stand-alone executable](karate-netty#standalone-jar) for teams not comfortable with Java. You don't have to compile code. Just write tests in a **simple**, *readable* syntax - carefully designed for HTTP, JSON, GraphQL and XML. And you can mix API and [UI test-automation](karate-core) within the same test script.

A [Java API](#java-api) also exists for those who prefer to programmatically integrate Karate's rich automation and data-assertion capabilities.

## Hello World
### For API Testing
<a href="https://gist.github.com/ptrthomas/d5a2d9e15d0b07e4f1b46f692a599f93"><img src="karate-demo/src/test/resources/karate-hello-world.jpg" height="400" /></a>

> If you are familiar with Cucumber / Gherkin, the [*big difference*](#cucumber-vs-karate) here is that you **don't** need to write extra "glue" code or Java "step definitions" !

It is worth pointing out that JSON is a 'first class citizen' of the syntax such that you can express payload and expected data without having to use double-quotes and without having to enclose JSON field names in quotes.  There is no need to 'escape' characters like you would have had to in Java or other programming languages.

And you don't need to create additional Java classes for any of the payloads that you need to work with.

# Steps to SetUp karate in IDE
    1. Download the latest version of VS Code
    2. Download the latest version of Java - sdk and jre
    3. Open Karate project code in the VS Code IDE
    4. Install the following dependencies and plugins from  VS code Extensions
        * Karate Runner
        * Extention Java Pack
        * Cucumber (Given When Then)
        * material icon theme


Note: Select Language Mode as Karate
## Steps to Run the karate scripts

    Please provide the Application API End point details in app_url.feature file 

# Run Specs    
    Open the Program_SpecAPI folder and Run the required program level feature files 
    i.e  vsk_program_specs.feature , program_specs.feature

# Run Ingestion of Program level Input Files
    Open the Ingest_ImportCsv/Programs folder and run the Ingest_VSK_files.feature , students-attendance-ingestion.feature , teacher-attendance-ingestion.feature files and input data files are stored to Buckets  

# Upload the dimension files to bucket
    Open the Ingest_ImportCsv/Dimensions folder and run the validate_dimension_api.feature file it will upload the dimension files to bucket
# Schedule the Nifi Processor using - Schedule API 
    1. Open the Ingest_ImportCsv/Programs 
    2. Provide the cron time expression for adapter_run , processor_run and run_latest_run processor groups 
    3. Run the schedule_processor.feature file 

## Execution Reports 
Reports are stored inside the **target folder**

