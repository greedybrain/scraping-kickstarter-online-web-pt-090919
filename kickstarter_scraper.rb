require "nokogiri"
require "pry"

  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # project.css('ul.project-meta span.location-name').text
  # project.css('ul.project-stats li.first.funded').text.gsub('%', '').to_i

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html) 
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    projects[project] = {}
  end
  projects
  
  # binding.pry
end

create_project_hash