require 'selenium-webdriver'
require 'open-uri'

def challenge_two
    #Change download directory to current directory/downlaods
    prefs = {
        prompt_for_download: false, 
        default_directory: "#{File.expand_path(File.dirname(__FILE__))}/downloads"
    }
    
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_preference(:download, prefs)

    # Make a new instance and start clicking
    test_path = 'https://codetest2.services.mdxdata.com/'
    driver = Selenium::WebDriver.for :chrome
    driver.manage.timeouts.implicit_wait = 30
    driver.get(test_path)
    
    anchors = driver.find_elements(:tag_name, 'a')

    anchors.each do |a|
        a.click
        sleep(1)
    end
    
    #Wait for downloads to complete
    sleep(30)
    driver.quit
end

challenge_two()