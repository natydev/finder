# frozen_string_literal: true

# Define typologies of Box record
class BoxTypology < EnumerateIt::Base
  associate_values(
    standalone: 'st',
    cluster: 'cl'
  )

  # Specific subclass to define standalone icon
  class Standalone
    def icon
      Icon.css_for(:standalone)
    end
  end

  # Specific subclass to define cluster icon
  class Cluster
    def icon
      Icon.css_for(:cluster)
    end
  end
end
