require 'fileutils'

Jekyll::Hooks.register :site, :post_write do |site|
  source_dir = File.join(site.source, '_includes', 'pdfs')
  destination_dir = File.join(site.dest, 'pdfs')

  unless File.directory?(source_dir)
    puts "Error: PDFs directory does not exist"
    next
  end

  FileUtils.mkdir_p(destination_dir)
  FileUtils.cp_r(Dir["#{source_dir}/*"], destination_dir)
  puts "Copied pdfs from #{source_dir} to #{destination_dir}"
end
