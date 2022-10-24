# I probably should have used curl but this was fun to learn
require 'selenium-webdriver'
require 'open-uri'

def challenge_one
    #Change download directory to current directory/downlaods
    prefs = {
        prompt_for_download: false, 
        default_directory: "#{File.expand_path(File.dirname(__FILE__))}/downloads"
    }

    puts prefs[:default_directory]
    
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_preference(:download, prefs)

    # Make a new instance and start clicking
    test_path = 'https://codetest.services.mdxdata.com/login'
    driver = Selenium::WebDriver.for :chrome, options: options

    # Implicit wait to make sure dom is loaded
    driver.manage.timeouts.implicit_wait = 30
    driver.get(test_path)
    login = driver.find_element(:tag_name, 'button')
    login.click

    download = driver.find_element(:id, 'download')
    download.click
    
    #Wait for downloads to complete
    sleep(30)
    puts "Downloaded to #{prefs[:default_directory]}"
    driver.quit
end

challenge_one()