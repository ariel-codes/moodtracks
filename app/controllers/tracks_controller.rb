class TracksController < AuthenticatedController
  def search
    tracks = TracksFeature.new(current_user).search(params[:query]).tracks

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("track-search-results", TrackResultsComponent.new(tracks))
      end
      # TODO: Add no-JS fallback
      # format.html { render Tracks::SearchView.new(tracks) }
    end
  end

  def create
    Rails.logger.info "Saving track #{track_params.pretty_inspect}"
    TracksFeature.new(current_user).save!(**track_params)
    redirect_to home_path, notice: "Track saved!", status: :see_other
  end

  private

  def track_params
    params.require(:track).permit(:spotify_id, :name, :artist, :thumbnail_url, :image_url)
    .to_h.symbolize_keys
  end
end
