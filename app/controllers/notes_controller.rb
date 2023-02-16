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
        @note = Note.new(note_params)
        if @note.save
            redirect_to notes_path
          else
            render :new, status: :unprocessable_entity
          end
    end


    def edit
        @head = "Edit the note"
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])

        if @note.update(note_params)
            redirect_to @note
        else
            render :edit,status: :unprocessable_entity
        end
    end

    def destroy 
        @note = Note.find(params[:id])
        @note.destroy

        redirect_to notes_path
    end

    private
    def note_params
        params.require(:note).permit(:title,:body,:author)
    end
end
