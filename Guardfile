guard :shell do
  watch /source\/(.*)\.md/ do |m|
    puts "Checking #{m[0]}"
    if system("awk -f md-rm-frontmatter.awk #{m[0]} | mdl -s relaxed")
      n "#{m[0]} is correct", "Markdown Lint", :success
    else
      n "#{m[0]} is incorrect", "Markdown Lint", :failed
    end
  end
end

