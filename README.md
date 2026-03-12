# BoldBI Embedding Ruby on Rails

This sample demonstrates how to render a dashboard available on your Bold BI server using Ruby on Rails.

## Dashboard view

![Dashboard View](/images/dashboard.png)

## Requirements

The samples require the following requirements to run.

* [Node.js](https://nodejs.org/en/)
* [Ruby installer](https://rubyinstaller.org/)
* [Visual Studio Code](https://code.visualstudio.com/download)

### Supported browsers
  
* Google Chrome, Microsoft Edge, and Mozilla Firefox.

## Configuration

* Please ensure you have enabled embed authentication on the `embed settings` page. If it is not currently enabled, please refer to the following image or detailed [instructions](https://help.boldbi.com/site-administration/embed-settings/#get-embed-secret-code?utm_source=github&utm_medium=backlinks) to enable it.

    ![Embed Settings](/images/enable-embedsecretkey.png)

* To download the `embedConfig.json` file, please follow this [link](https://help.boldbi.com/site-administration/embed-settings/#get-embed-configuration-file?utm_source=github&utm_medium=backlinks) for reference. Additionally, you can refer to the following image for visual guidance.

     ![Embed Settings Download](/images/download-embedsecretkey.png)
     ![EmbedConfig Properties](/images/embedconfig-file.png)

* Copy the downloaded `embedConfig.json` file and paste it into the designated [location](https://github.com/boldbi/ruby-on-rails-sample/tree/master) within the application. Please ensure you have placed it in the application, as shown in the following image.

    ![EmbedConfig image](/images/embedconfig-location.png)

## Run a Sample Using Command Line Interface or Visual Studio Code

* Open the Ruby on Rails sample folder [location](https://github.com/boldbi/ruby-on-rails-sample/tree/master) in terminal.

* Please open the database.yml file located at /config/database.yml and	Replace the following properties to configure your PostgreSQL database connection:
    | **Parameter** | **Description** |
    |---------------|--------------------------------------------------------------------------------------------------|
    |Database| The name of the database you want to connect to. This database must already exist in pgAdmin|
    |username|The username that PostgreSQL uses to authenticate the connection to the database.|
    |Password|The password for the PostgreSQL username.|
    
* To install the rails, run the below command.

    ```bash
    gem install rails
    ```

* To check the rails version, run the below command.

    ```bash
     rails -v
    ```

* To install all dependent packages using the following command `bundle install`.

* Now run the Ruby on Rails application by using below command and open the browser, then go to the http://localhost:3000/, you are able to view the embedded dashboard.

    ```bash
    rails s
    ```

> **NOTE:** To resolve Errno::EACCES, ActionView::Template::Error, or NoMethodError, delete the `tmp` folder and then run the commands above again.

Please refer to the [help documentation](https://help.boldbi.com/embedded-bi/javascript-based/samples/v3.3.40-or-later/ruby-on-rails/#how-to-run-the-sample?utm_source=github&utm_medium=backlinks) to know how to run the sample.

## Online Demos

Look at the Bold BI Embedding sample to live demo [here](https://samples.boldbi.com/embed?utm_source=github&utm_medium=backlinks).

## Documentation

A complete Bold BI Embedding documentation can be found on [Bold BI Embedding Help](https://help.boldbi.com/embedded-bi/javascript-based/?utm_source=github&utm_medium=backlinks).