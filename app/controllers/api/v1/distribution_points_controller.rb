class Api::V1::DistributionPointsController < ApplicationController
  include FilterByParams

  before_action do
    request.format = :json
  end

  filterable_params [
    { type: :geocoords },
    { type: :text, param: :county, field: 'county' },
    { type: :text, param: :name, field: 'facility_name' },
    { type: :boolean, param: :active, field: 'active' }
  ]

  def index
    @distribution_points, @filters = apply_filters(DistributionPoint.all)
  end

  def outdated
    @distribution_points, @filters = apply_filters(DistributionPoint.outdated.order('updated_at DESC'))
  end
end
