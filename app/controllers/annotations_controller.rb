class AnnotationsController < ApplicationController
  before_filter :find_paper

  def index
    render :json => @paper.annotations
  end

  def create
    annotation = Annotation.new(params[:annotation])

    if @paper.annotations << annotation
      render :json => { }, :status => :created
    else
      render :json => annotation.errors, :status => :unprocessable_entity
    end
  end

  def update
    annotation = Annotation.find(params[:id])

    # TODO should we be using the @paper object here?
    if annotation.save
      render :json => { }, :status => :created
    else
      render :json => annotation.errors, :status => :unprocessable_entity
    end
  end

  def method_name

  end

  private

  def find_paper
    @paper = Paper.find(params[:paper_id])
  end
end
