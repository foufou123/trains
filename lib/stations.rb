class Stations

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
    stations << Stations.new({'name' => name, 'id' => id})
    end
    stations
    # stations.each do |station|
    # puts station.id.to_s + station.name.to_s
    # end
  end

  def save
    results = DB.exec("INSERT INTO stations(name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

   def ==(another_station)
  self.name == another_station.name
 end

end

