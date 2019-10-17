require "nokogiri"
require "pry"

  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # project.css('ul.project-meta span.location-name').text
  # project.css('ul.project-stats li.first.funded').text.gsub('%', '').to_i

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html) 
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
  end
  projects
  
  # binding.pry
end

create_project_hash