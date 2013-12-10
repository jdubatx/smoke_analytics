###############################
#Automated Script By Jenna Wakeley
#Last Updated 12/4/13
###############################

require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class AverageResponseTimeByHourOfDay < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://devdb3.esosuite.net/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_average_response_time_by_hour_of_day
  
  
	#Login Start
    @driver.get "https://devdb3.esosuite.net/EsoSuiteDaily/"
    @driver.find_element(:id, "UserName").clear
    @driver.find_element(:id, "UserName").send_keys "admin"
    @driver.find_element(:id, "Password").clear
    @driver.find_element(:id, "Password").send_keys ".admin77."   
    @driver.find_element(:id, "AgencyLoginId").clear
    @driver.find_element(:id, "AgencyLoginId").send_keys "wonderland"
	 @driver.find_element(:id, "btnLogin").click
	#Login Done


	#Report Nav Start
    assert_equal "ESO Pro - Index Page", @driver.title
    @driver.find_element(:css, "img[alt=\"analytics\"]").click
    assert_equal "ESO Analytics", @driver.title
    assert !60.times{ break if (@driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div/div[5]/div[2]").text == "ePCR Reports" rescue false); sleep 1 }
    @driver.find_element(:xpath, "//div[5]/div[2]").click
    assert !60.times{ break if (@driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div[2]/div[5]/div[2]").text == "Operational Reports" rescue false); sleep 1 }
    @driver.find_element(:xpath, "//div[2]/div[5]/div[2]").click
    assert !60.times{ break if (@driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div/div[8]/div[2]/table/tbody/tr/td/div").text == "Average Response Time By Hour of Day" rescue false); sleep 1 }
    @driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div/div[8]/div[2]/table/tbody/tr/td/div").click
	sleep (2)
	#Report Nav Done
	
	
    #Select Current Year Start
   @driver.find_element(:css, "div.label.ng-binding").click
   @driver.find_element(:xpath, "//div[3]/div/div/div[3]/div[5]").click
    #Select Current Year Done
	
	
    #Intial Drill-Throughs Start	
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr/td[9]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[8]/td[2]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
	#Intial Drill-Throughs Done	
	
	
	#Add Filters Start
    @driver.find_element(:css, "div.label.ng-binding").click
    sleep (1)
    @driver.find_element(:xpath, "//div[3]/div/div/div[3]/div[5]").click
    sleep (1)
    @driver.find_element(:css, "div.icon").click
    sleep (1)
    @driver.find_element(:css, "div.add-filter-row.ng-scope").click
    sleep (1)
    @driver.find_element(:css, "span.k-input").click
    sleep (1)	
	#Shift equals all in the golden afternoon
    @driver.find_element(:xpath, "//ul[@id='filters-combo-2-1_listbox']/li[33]").click
    @driver.find_element(:xpath, "//div[2]/span/span/span").click
    sleep (1)
    @driver.find_element(:xpath, "//ul[@id='operators-combo-2-1_listbox']/li[2]").click
    sleep (1)
    @driver.find_element(:xpath, "//div[4]/div/div/input").click
    @driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-1_listbox']/li").click
	sleep (1)
   	#OR responding from equals catipillars garden
	@driver.find_element(:css, "div.add-filter-row").click
    @driver.find_element(:xpath, "//table[2]/tbody/tr/td/div/div/div/span/span/span[2]/span").click
    @driver.find_element(:xpath, "//ul[@id='filters-combo-2-2_listbox']/li[23]").click
    @driver.find_element(:xpath, "//table[2]/tbody/tr/td/div/div/div[2]/span/span/span[2]/span").click
    @driver.find_element(:xpath, "//ul[@id='operators-combo-2-2_listbox']/li[2]").click
    @driver.find_element(:xpath, "//table[2]/tbody/tr/td/div/div/div[4]/div/div").click
    @driver.find_element(:xpath, "//ul[@id='multiselect-combo-2-2_listbox']/li[2]").click
    @driver.find_element(:css, "button.button-dark").click
    @driver.find_element(:xpath, "//div[4]/div/div[2]/div[3]/button[2]").click
	@driver.find_element(:css, "div.report-bar > div.filters").click
	#Add Filters Done
	
	
	#Filtered Drill-Throughs Start    
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr/td[8]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[3]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[14]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   #Filtered Drill-Throughs Done
	
	
   #Settings Change Start
    @driver.find_element(:css, "div.menu-button.menu > div > div.icon").click
	sleep (1)
    @driver.find_element(:xpath, "//div[@id='nav-bar']/div[2]/div[3]/div[3]/div[8]").click
    sleep (1)
    @driver.find_element(:xpath, "//input[2]").clear
     sleep (1)
    @driver.find_element(:xpath, "//input[2]").send_keys "1"
    @driver.find_element(:xpath, "//input[2]").send_keys "5"
    @driver.find_element(:xpath, "//div[4]/button[2]").click
	sleep (1)
	#Settings Change Done
	
	
	#Settings Change Drill-Throughs Start
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr/td[8]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[3]").click
   sleep (2)
   @driver.find_element(:css, "div.back").click
   sleep (2)
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[14]").click
   sleep (2)
	#Settings Change Drill-Throughs Done
	
	
	#PDF View Start
   @driver.find_element(:css, "span.caret").click
   sleep (1)
@driver.find_element(:css, "button").click
   sleep (2)
   @driver.find_element(:css, "button.close").click
   @driver.find_element(:css, "span.caret").click
   @driver.find_element(:css, "div.back").click
   @driver.find_element(:css, "div.back").click
   sleep (2)
	#PDF View Done
	
	
	# Report Drill-Through Save Start
    @driver.find_element(:css, "div.menu-button.menu > div > div.icon").click
	sleep (1)
    @driver.find_element(:xpath, "//div[3]/div[3]/div[3]").click
	sleep (1)
    @driver.find_element(:xpath, "//div[4]/div/div[2]/div[2]/input").send_keys "  -ruby_rtbhod"
    @driver.find_element(:xpath, "(//input[@type='text'])[4]").send_keys "  -ruby_rtbhod"
    @driver.find_element(:xpath, "//div[6]/div/div/div[5]/div[2]").click
	sleep (1)
    @driver.find_element(:css, "button.button-gray.float-left").click
	sleep (1)
    @driver.find_element(:xpath, "//div[6]/div/div[2]/div/input").send_keys "  -ruby_rtbhod"
	@driver.find_element(:xpath, "//div[6]/div/div[2]/div[3]/button[2]").click
	sleep (2)
    @driver.find_element(:xpath, "//div[8]/button[3]").click
	sleep (2)	
 @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[14]").click
   sleep (2)
   # Report Drill-Through Save Done
   
   
   #Saved Drill-Through PDF Start
   @driver.find_element(:css, "span.caret").click
   sleep (1)
@driver.find_element(:css, "button").click
   sleep (2)
   @driver.find_element(:css, "button.close").click
   @driver.find_element(:css, "span.caret").click
   @driver.find_element(:css, "div.back").click
   sleep (2)
	#Saved Drill-Through PDF Done
	
	# Delete Saved Report and Folder Start
   @driver.find_element(:css, "div.contents > div.title").click
   sleep (1)
   @driver.find_element(:css, "div.item.home").click
   sleep (1)
   @driver.find_element(:xpath, "//div[6]/div[2]").click
   sleep (1)
@driver.find_element(:css, "b.caret").click

   sleep (1)
@driver.find_element(:link, "Delete Folder").click

   sleep (1)
   @driver.find_element(:xpath, "//div[4]/div/div[2]/div[2]/button[2]").click
   sleep (1)
   @driver.find_element(:xpath, "//div[4]/div/div[2]/div[2]/button[2]").click
    # Delete Saved Report and Folder Done
	
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    @driver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
