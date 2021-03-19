class Api::TestsController < Api::ApiController
  before_action :authenticate_user!
  before_action :set_test, only: %i[ show result ]

  # GET /tests or /tests.json
  def index
    @tests = Test.includes(:questions).all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  def result
    score = @test.cal_score
    render json: {score: score}, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end
end
