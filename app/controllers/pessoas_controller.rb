class PessoasController < ApplicationController
  def index
    result = if params[:t]
      ::Pessoas::Filter.result(condition: params[:t])
    else
      ::Pessoas::List.result
    end

    render json: result.people, status: 200
  end

  def show
    result = ::Pessoas::Find.result(id: params[:id])

    if result.success?
      render json: result.person, status: 200
    else
      render status: 400
    end
  end

  def create
    result = ::Pessoas::Create.result(attributes: pessoas_params)

    if result.success?
      render json: result.person, status: 201
    else
      render status: 422
    end
  end

  def contagem_pessoas
    result = ::Pessoas::Count.result

    render json: result.count, status: 200
  end

  def pessoas_params
    params.require(:pessoa).permit(:apelido, :nascimento, :nome, stack: [])
  end
end
