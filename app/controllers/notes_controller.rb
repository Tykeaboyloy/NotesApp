class NotesController < ApplicationController
    attr_accessor :head
    def index
        @head = "My notes"
        @notes = Note.all()
    end

    def show
        @head = "Notes Detail"
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new()
    end

    def create
        note_params = params[:note]
        note = Note.new(title:note_params[:title],body:note_params[:body],author:note_params[:author])
        note.save!
        if note.save
            redirect_to root_path
        end
    end
end
