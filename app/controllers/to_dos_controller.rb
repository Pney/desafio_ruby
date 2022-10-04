class ToDosController < ApplicationController
  include SessionHelper
  include ToDosHelper
  before_action :set_to_do, only: %i[ show edit update destroy ]
  layout 'users_backoffice'

  # GET /to_dos or /to_dos.json
  def index
    @to_dos = ToDo.all.where(user: current_user)
    @status_lists = StatusList.all.where(user: current_user)
  end

  # GET /to_dos/1 or /to_dos/1.json
  def show
  end

  # GET /to_dos/new
  def new
    @to_do = ToDo.new
  end

  # GET /to_dos/1/edit
  def edit
  end

  def edit_status_right
    item = ToDo.find(params[:to_do])
    if !(StatusList.find(item.status_list.id + 1 )).nil?
      next_status = StatusList.find(item.status_list.id + 1)
      if !(next_status.nil?)
        item.status_list = next_status
        item.save!
        redirect_to to_dos_index_path, notice: "Funcionou"
      end
    else
      redirect_to to_dos_index_path, notice: "FAlhoooo"
    end
  end

  def edit_status_left
    item = ToDo.find(params[:to_do])
    if !(StatusList.find(item.status_list.id - 1 )).nil?
      next_status = StatusList.find(item.status_list.id - 1)
      if !(next_status.nil?)
        item.status_list = next_status
        item.save!
        redirect_to to_dos_index_path, notice: "Funcionou"
      end
    else
      redirect_to to_dos_index_path, notice: "Falho"
    end
  end

  # POST /to_dos or /to_dos.json
  def create
    # ! Trash Code, to_do_params receber algo aq no Controller
    # * Clean Code, to_do_params deve receber algo somente na view
    StatusList.find(to_do_params[:status_list_id])
    to_do_params[:user_id] =  current_user

    @to_do = ToDo.new(to_do_params)


    respond_to do |format|
      if @to_do.save
        format.html { redirect_to to_dos_index_url(@to_do), notice: "To do was successfully created." }
        format.json { render :show, status: :created, location: @to_do }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /to_dos/1 or /to_dos/1.json
  def update
    respond_to do |format|
      if @to_do.update(to_do_params)
        format.html { redirect_to to_do_url(@to_do), notice: "To do was successfully updated." }
        format.json { render :show, status: :ok, location: @to_do }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_dos/1 or /to_dos/1.json
  def destroy
    @to_do.destroy

    respond_to do |format|
      format.html { redirect_to to_dos_index_path, notice: "To do was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_to_do
      @to_do = ToDo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def to_do_params
      params.require(:to_do).permit(:user_id, :uni_code, :title, :description, :category, :public_permission, :status_list_id)
    end
end
