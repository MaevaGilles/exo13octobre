#Exercice 1
require 'nokogiri'
require 'open-uri'
require 'rubygems'

#Scrapper
def scrapper 
    return page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
end

#Emails
def get_townhall_email (townhall_url)
    array_email=[]
    townhall_url.each do |url|
        page = Nokogiri::HTML(URI.open("#{url}"))
    get_townhall_email = page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]')

    array_email<<get_townhall_email.text
end

return array_email
end

def get_townhall_url (page)
   
    scrap_url = page.xpath('//a[@class="lientxt"]')
    url_href_array = []
    url_array = []
    scrap_url.each do |url|
        url_href_array<<url['href']
    end

    url_array = url_href_array.map {|href| "http://annuaire-des-mairies.com" + href[1..-1]}

end 

def get_townhall_name (page)
    array_name=[]
    get_townhall_name = page.xpath('//a[@class="lientxt"]')
    get_townhall_name.each do |url|
    array_name<<url.text
    end
return array_name
end

def perform
final_array=[]

url = get_townhall_url(scrapper)
email = get_townhall_email(url)
name = get_townhall_name(scrapper)

for i in 0...name.length
    hash = { name[i] => email[i] }
    final_array.append(hash)
end

final_array

end
print perform

