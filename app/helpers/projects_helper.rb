module ProjectsHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Learning Rails").join(" - ")
      end
    end
  end
end
