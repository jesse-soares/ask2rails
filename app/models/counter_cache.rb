class CounterCache
  def self.update(model, association)
    model.find_each do |record|
      model.reset_counters(record.id, association)
    end
  end
end