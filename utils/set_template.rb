# encoding: UTF-8

require 'erb'

class TccPage
  include ERB::Util
  attr_accessor :repo_zip, :monography, :source_code, :poster, :slides, :subjective_part, :template, :output


  def initialize args
    @repo_zip         = args[:repo_zip]
    @monography       = get_raw_and_blob(args[:monography])
    @source_code      = args[:source_code]
    @poster           = get_raw_and_blob(args[:poster])
    @slides           = get_raw_and_blob(args[:slides])
    @subjective_part  = get_raw_and_blob(args[:subjective_part ])
    @template         = get_template
    @output         = get_output
  end

  def get_raw_and_blob link
    {
      raw: link % {type: 'raw'},
      blob: link % {type: 'blob'}
    }
  end

  def render
    ERB.new(template).result(binding)
  end

  def save
    File.open(output, "w+") do |f|
      f.write(render)
    end
  end

  def monography
    get_links(
      @monography[:raw], 
      @monography[:blob]
    )
  end

  def source_code
    get_link(
      "Repositório", 
      @source_code
    )
  end

  def poster
    get_links(
      @poster[:raw], 
      @poster[:blob]
    )
  end

  def slides
    get_links(
      @slides[:raw], 
      @slides[:blob]
    )
  end

  def subjective_part
    get_links(
      @subjective_part[:raw], 
      @subjective_part[:blob]
    )
  end


private

  def get_links raw, blob
    "#{get_link("Download", raw)} | #{get_link("Online", blob)}"
  end

  def get_link name, link
    "<a class=\"internal_links\" href=\"#{link}\">#{name}</a>"
  end

  def get_template
    filename = 'template.erb'
    fullpath_filename = "#{current_path}/#{filename}"
    file = File.open(fullpath_filename, 'r')
    template = file.read
    file.close
    template
  end

  def get_output
    filename = 'index.html'
    page_folder = 'page'
    return "#{parent_path}/#{page_folder}/#{filename}"
  end

  def current_path
    File.expand_path(File.dirname(__FILE__))
  end

  def parent_path
    File.expand_path(File.dirname(File.dirname(__FILE__)))
  end
end

REPO_ZIP = "https://github.com/fllsouto/mac0499/archive/master.zip"
MONOGRAPHY = "https://github.com/fllsouto/mac0499/%{type}/master/monography/monography.pdf"
SOURCE_CODE = "https://github.com/fllsouto/dining_philosophers_actor_model"
POSTER = "https://github.com/fllsouto/mac0499/%{type}/master/poster_and_slides/poster.pdf"
SLIDES = "https://github.com/fllsouto/mac0499/%{type}/master/poster_and_slides/slides.pdf"
SUBJECTIVE_PART = "https://github.com/fllsouto/mac0499/%{type}/master/monography/subjective_part.pdf"



links = {
  repo_zip: REPO_ZIP,
  monography: MONOGRAPHY,
  source_code: SOURCE_CODE,
  poster: POSTER,
  slides: SLIDES,
  subjective_part: SUBJECTIVE_PART
}

TccPage.new(links).save