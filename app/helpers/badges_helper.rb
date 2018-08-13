module BadgesHelper
  def subclasses_with_title
    title_array = {}
    Badge.subclasses.each { |subclass| title_array[subclass::TITLE] = subclass.name }
    title_array
  end
end
