module Timer
  extend ActiveSupport::Concern

  def set_default_time
    self.created_at = Time.now
    self.updated_at = Time.now
  end

  def set_record_time
    self.record_time = Time.now
  end
end
