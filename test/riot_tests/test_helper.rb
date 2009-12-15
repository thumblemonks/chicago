%w[ rubygems riot haml sass chicago rack/test chicago/riot ].each do |lib|
  require lib
end

class Riot::Situation
  def extend_mock_app(&block)
    @app.instance_eval(&block)
  end
end
