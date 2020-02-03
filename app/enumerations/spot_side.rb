# frozen_string_literal: true

# Define side position in a Spot
class SpotSide < EnumerateIt::Base
  associate_values(
    north: 'n',
    north_east: 'ne',
    east: 'e',
    south_east: 'se',
    south: 's',
    south_west: 'sw',
    west: 'w',
    north_west: 'nw',
    central: 'c'
  )
end
