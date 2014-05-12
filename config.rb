module MapConfig

  Map = {
          vermillion: {name: "Vermillion Room", north: nil, east: :ochre, south: :aquamarine, west: nil},
          ochre: {name: "Ochre Room", north: :vermillion, east: :chartreuse , south: :ochre, west: nil},
          chartreuse: {name: "Chartreuse Room", north: :ochre, east: nil, south: :emerald , west: nil},
          emerald: {name: "Emerald Room", north: nil, east: :lavender, south: :aquamarine, west: :cobalt},
          aquamarine: {name: "Aquamarine Room", north: nil, east: nil, south: :violet, west: :cobalt},
          lavender: {name: "Lavender Room", north: nil, east: :chartreuse , south: nil, west: :burnt_sienna},
          cobalt: {name: "Cobalt Room", north: :vermillion, east: nil, south: :burnt_sienna, west: :vermillion},
          violet: {name: "Violet Room", north: nil, east: :burnt_sienna, south: :burnt_sienna, west: :chartreuse},
          burnt_sienna: {name: "Burnt Sienna Room", north: :emerald, east: :lavender, south: nil, west: nil}
        }
end