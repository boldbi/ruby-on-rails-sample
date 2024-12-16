# BoldBI Embedding Ruby on Rails

This Bold BI Ruby on Rails sample contains the Dashboard embedding sample. This sample demonstrates the rendering of dashboard available in your Bold BI server.

This section guides you in using the Bold BI dashboard in your Ruby on Rails sample application.

* [Requirements to run the demo](#requirements-to-run-the-demo)
* [Using the Ruby on Rails sample](#using-the-ruby-on-rails-sample)
* [Online Demos](#online-demos)
* [Documentation](#documentation)

## Requirements to run the demo

The samples require the following requirements to run.

* [Node.js](https://nodejs.org/en/)
* [Ruby instakker](https://rubyinstaller.org/)
* [Visual Studio Code](https://code.visualstudio.com/download)

## Using the Ruby on Rails sample

* Open the Ruby on Rails sample in Visual studio code.

* Open the index.html.erb file in the following location, /app/view/home/index.html.erb.

* Please change the following properties in the `index.html.erb` file as per your Bold BI Server.

| **Parameter**      | **Description**                                                                                                                                        |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **ServerUrl**      | Dashboard Server URL. Example for on-premise: `http://demo.boldbi.com/bi/site/site1`. Example for cloud: `http://demo.boldbi.com/bi`.            |
| **dashboardID**    | Provide the dashboard ID of the dashboard you want to embed.                                                                                         |
| **authorizationUrl** | URL pointing to the AuthorizeServer API file. We are running a Ruby sample on port 3000: `http://localhost:3000/api/v1/authorizes`.               |

* Open the `Authorizes_Controller.rb` file in the location, /app/controllers/api/v1/Authorizes_Controller.rb. And provide the below mentioned values.

| **Parameter**  | **Description**                                                                                                                                                                |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **EmbedSecret** | Get your EmbedSecret key from the Embed tab by enabling the `Enable embed authentication` on the [Administration page](https://help.boldbi.com/embedded-bi/site-administration/embed-settings/?utm_source=github&utm_medium=backlinks). |
| **UserEmail**   | UserEmail of the Admin in your Bold BI, which would be used to get the dashboard list.                                                                                        |

* Please open the database.yml file located at /config/database.yml and •	Replace the following properties to configure your PostgreSQL database connection:
    | **Parameter** | **Description** |
    |---------------|--------------------------------------------------------------------------------------------------|
    |Database| The name of the database you want to connect to. This database must already exist in pgAdmin|
    |username|The username that PostgreSQL uses to authenticate the connection to the database.|
    |Password|The password for the PostgreSQL username.|
    
* To install the rails, run the below command.

```bash
gem install rails
```

* To check the rails version, run the below command

```bash
 rails -v.
```

* Now run the Ruby on Rails application by using below command and open the browser, then go to the localhost://3000, you are able to view the embedded dashboard.

```bash
rails s
```

Please refer to the [help documentation](https://help.boldbi.com/embedded-bi/javascript-based/samples/v3.3.40-or-later/ruby-on-rails/#how-to-run-the-sample?utm_source=github&utm_medium=backlinks) to know how to run the sample.

## Online Demos

Look at the Bold BI Embedding sample to live demo [here](https://samples.boldbi.com/embed?utm_source=github&utm_medium=backlinks).

## Documentation

A complete Bold BI Embedding documentation can be found on [Bold BI Embedding Help](https://help.boldbi.com/embedded-bi/javascript-based/?utm_source=github&utm_medium=backlinks).
