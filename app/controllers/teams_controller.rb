class TeamsController < ApplicationController

    skip_before_action  :verify_authenticity_token

    def index
        @teams = Team.all
    end

    def create
        @team_members = team_params[:team_members]
        @team_members = @team_members.drop(1)
        @team_member = User.find(@team_members)
        @team = Team.new(team_params.except(:team_members).merge(users: @team_member))
        if @team.save
            @team.team_members.first_or_create
            redirect_to '/teams'
        else
            redirect_to ''
        end
    end

    def update
        @team = Team.find(team_params[:id])
        @team_members = team_params[:team_members]
        @team_members = @team_members.drop(1)
        @team_member = User.find(@team_members)
        if @team.update(team_params.except(:team_members).merge(users: @team_member))            
            redirect_to '/teams'
        else 
            redirect_to ''
        end
    end

    def get_team_members
        @team = Team.find(params[:id])
        @team_members = User.find(@team.team_members.pluck(:user_id))
        if @team_members.present?
            p @team_members.pluck(:email)
            render json: { status: 'success', message: 'Team member found.', team_id: @team.id, team_members: @team_members.pluck(:id, :email)}
        else
            render json: { status: 'error', message: 'No Team members'}
        end 
    end

    def new
        @team = Team.new()
        @team_member = @team.team_members.build
    end

    def edit
        @team = Team.find(params[:id])
        @team_member = User.find(1)
        @users = User.all
    end

    def destroy
        @team = Team.find(params[:id])
        @team.destroy
        redirect_to teams_path
    end


    private

    def team_params
        params.require(:team).permit(:id, :name, team_members:[])
    end
    
end
