class ConsolesController < ApplicationController
  def index
    consoles = [
      { name: 'NES', manufacturer: 'Nintendo' },
      { name: 'SNES', manufacturer: 'Nintendo' },
      { name: 'Wii', manufacturer: 'Nintendo' },
      { name: 'Genesis', manufacturer: 'Sega' },
      { name: 'Switch', manufacturer: 'Nintendo' },
      { name: 'PS1', manufacturer: 'Microsoft' },
      { name: 'PS2', manufacturer: 'Microsoft' }
    ]

    nintendo_consoles = []
    consoles.each do |c|
      if params['manufacturer']== c[:manufacturer]
        nintendo_consoles.push(c[:name])
      end
    end

    render json: { nintendo_consoles: nintendo_consoles, consoles: consoles }
  end
end
