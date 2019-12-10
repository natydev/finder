class BoxTypology < EnumerateIt::Base
  associate_values({
    standalone: 'st',
    cluster: 'cl'
  })

  class Standalone
    def icon
      'fa fa-bullseye'
    end
  end

  class Cluster
    def icon
      'fa fa-box-open'
    end
  end
end
