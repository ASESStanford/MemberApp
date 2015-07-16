class EmailController < ApplicationController
  def index
    @emails = Email.all
    @email = Email.new
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
