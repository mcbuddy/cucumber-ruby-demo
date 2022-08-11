# Cucumber Ruby Demo

Ini adalah source code dari video tutorial dtechover - belajar QA Youtube channel.
Anda bisa lihat videonya di [sini](link)

####Tutorial ini menggunakan Cucumber dan Ruby 3.1.2

Cucumber Testing Framework [link](https://cucumber.io/)

Ruby Progamming Language [link](https://www.ruby-lang.org/en/)

RVM [link](https://rvm.io/)

Rbenv [link](https://github.com/rbenv/rbenv)

Test Demo App [link]("http://automationpractice.com/index.php")

Chromedriver [link](https://chromedriver.chromium.org/downloads)

# Cheatsheet dari Capybara dan Rspec
## Navigasi 
    visit(url)

## Click link atau buttons/tombol
    click_on('Link Text')
    click_link
    click_button
    

## Berinteraksi dengan forms
    fill_in('First Name', :with => 'Budi')
    fill_in('Password', :with => 'KataSandi')
    
    choose('A Radio Button')
    check('A Checkbox')
    uncheck('A Checkbox')

    attach_file('Image', '/path/to/image.jpg')
    select('Option', :from => 'Select Box')

## Lingkup atau Scoping
    within("css_path/xpath") do
      fill_in 'Name', :with => 'Budi'
    end

    within_fieldset('Employee') do
      fill_in 'Name', :with => 'Budi'
    end

    within_table('Employee') do
      fill_in 'Name', :with => 'Budi'
    end

## Querying atau memastikan element
    ### Predikat
    #### Positif                      |  #### Negatif
    page.has_xpath?('//table/tr')     |  page.has_no_xpath?('//table/tr')
    page.has_css?('table tr.class')   |  page.has_no_css?('table tr.class')
    page.has_content?('dtechover')    |  page.has_no_content?('dtechover')
    page.has_text?('belajar QA')      |  page.has_no_text?('belajar QA')
    
    ### Assertion atau validasi
    #### Positif                                 |   #### Negatif
    expect(page).to have_xpath('//table/tr')     |   expect(page).to have_no_xpath('//table/tr')
    expect(page).to have_css('div.class')        |   expect(page).to have_no_css('div.class')
    expect(page).to have_button('#upload')       |   expect(page).to have_no_button('#upload')
    note: untuk assertion ini bisa kita          |   note: Untuk negatif assertion dianjurkanuntuk 
          gunakan CSS path atau XPath            |         memakai `.to have_no` dan jangan memakai `.not_to have_` 
                                                           dikarenakan methods yang ini tidak menggunakan 
                                                           implicite wait dari driver
  
    ### Finding atau pencarian element 
    find(selector)
    locate(selector).find(selector).click
    all(selector) => mendapatkan array of elements
    page.body => mendapatkan body tag dari page
    page.title => mendapatkan title text dari page
    page.html => mendapatkan HTML source dari page
    page.current_url => mendapatkan body tag dari page

## JavaScript-ing atau memggunakan JavaScript code
    evaluate_script('js code disini')
    execute_script("js code disini")

## Debugging
    save_and_open_page # capybara akan menyimpan screenshot image dan membukanya
    binding.pry # dengan menggunakan gem 'pry', maka test eksekusi akan berhenti dan bisa digunakan untuk berinteraksi dengan object
