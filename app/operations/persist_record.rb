module PersistRecord
  def persist_record(record)
    Try do
      record.save
    end.to_result.bind do |result|
      if result
        Value(record)
      else
        Failure(record.errors)
      end
    end
  end
end