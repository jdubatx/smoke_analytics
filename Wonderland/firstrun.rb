require "json"
require "selenium-webdriver"
gem "test-unit"
require "test/unit"

class Firstrun < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://devdb3.esosuite.net/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 60
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_firstrun
    @driver.get(@base_url + "/EsoSuiteDaily/")
    assert_equal "ESO Solutions :: NextGen", @driver.title
    @driver.find_element(:id, "UserName").clear
    @driver.find_element(:id, "UserName").send_keys "admin"
    @driver.find_element(:id, "Password").clear
    @driver.find_element(:id, "Password").send_keys ".admin77."
    @driver.find_element(:id, "AgencyLoginId").clear
    @driver.find_element(:id, "AgencyLoginId").send_keys "wonderland"
    @driver.find_element(:id, "btnLogin").click
    assert_equal "ESO Pro - Index Page", @driver.title
	sleep (3)
    @driver.find_element(:css, "img[alt=\"analytics\"]").click
    assert_equal "ESO Analytics", @driver.title
	sleep (3)
    assert_equal "ePCR Reports", @driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div/div[5]/div[2]").text
	sleep (3)
    @driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div/div[5]/div[2]").click
	sleep(3)
    assert_equal "Operational Reports", @driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div[2]/div[5]/div[2]").text
	sleep (3)
    @driver.find_element(:xpath, "//div[@id='app-root']/div/div[5]/div/div/div[2]/div[5]/div[2]").click
	sleep (3)
    assert_equal "Average Chute Time", @driver.find_element(:css, "td > div.name.ng-binding").text
	sleep (3)
    @driver.find_element(:css, "td > div.name.ng-binding").click
	sleep (3)
    assert element_present?(:xpath, "//div[@id='content']/div[2]/table/tbody/tr[5]/td[7]")
   @driver.find_element(:xpath, "//div[@id='content']/div[2]/table/tbody/tr/td[4]").click
	sleep (3)
	@driver.find_element(:css, "span.caret").click
    sleep (1)
    @driver.find_element(:css, "button").click
	sleep(3)
    verify { assert_equal "Patient Care Record", @driver.find_element(:css, "div.modal-header > h3.ng-binding").text }



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
